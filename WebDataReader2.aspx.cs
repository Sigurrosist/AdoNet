using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrgAdoNet
{
    public partial class WebDataReader2 : System.Web.UI.Page
    {
        OleDbConnection myCon;
        OleDbDataReader rdSchool;
        OleDbDataReader rdStudents;
        OleDbDataReader rdProgram;
        OleDbDataReader rdCourses;

        protected void Page_Load(object sender, EventArgs e)
        {
            myCon = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("~/App_Data/College1.mdb"));
            myCon.Open();
            OleDbCommand myCmdSchool = new OleDbCommand("select * from Schools", myCon);
            rdSchool = myCmdSchool.ExecuteReader();
            OleDbCommand myCmdProgram = new OleDbCommand("select * from Programs", myCon);
            rdProgram = myCmdProgram.ExecuteReader();
            OleDbCommand myCmdCourse = new OleDbCommand("select * from Courses", myCon);
            rdCourses = myCmdCourse.ExecuteReader();
            OleDbCommand myCmdStudent = new OleDbCommand("select * from Students", myCon);
            rdStudents = myCmdStudent.ExecuteReader();
            if (!Page.IsPostBack)
            {
                lblCourse.Visible = chklistCourse.Visible = lblProgram.Visible = RadioLstProg.Visible = false;
                FillSchoolRadio();
            }
        }

        private void FillSchoolRadio()
        {
            RadioLstSchool.Items.Clear();
            while(rdSchool.Read())
            {
                ListItem temp = new ListItem();
                temp.Text = rdSchool["SchoolName"].ToString();
                temp.Value = rdSchool["RefSchool"].ToString();
                RadioLstSchool.Items.Add(temp);
            }
        }

        private void FillProgramRadio()
        {
            RadioLstProg.Items.Clear();
            while(rdProgram.Read())
            {
                if(rdProgram["ReferSchool"].ToString() == RadioLstSchool.SelectedValue.ToString())
                {
                    ListItem temp = new ListItem();
                    temp.Text = rdProgram["ProgramName"].ToString();
                    temp.Value = rdProgram["RefProgram"].ToString();
                    RadioLstProg.Items.Add(temp);
                }
            }
            RadioLstProg.Visible = lblProgram.Visible = true;
        }

        private void FillCourseCheckList()
        {
            chklistCourse.Items.Clear();
            while(rdCourses.Read())
            {
                if(rdCourses["ReferPrograms"].ToString() == RadioLstProg.SelectedValue.ToString())
                {
                    ListItem temp = new ListItem();
                    temp.Text = rdCourses["CourseNumber"].ToString();
                    temp.Value = rdCourses["RefCourse"].ToString();
                    chklistCourse.Items.Add(temp);
                }
            }
        }

        private string FillStudentGrid()
        {
            string sql = "Select StudentName, Birthdate, ReferCourse from Students where ";
            bool count = false;
            foreach (ListItem i in chklistCourse.Items)
            {
                if (i.Selected)
                {
                    if (!count)
                    {
                        sql += "ReferCourse = " + i.Value.ToString() + " ";
                        count = true;
                    }
                    else
                        sql += "or ReferCourse = " + i.Value.ToString() + " ";
                }
            }

            sql = sql.Trim();
            return sql;
            
        }

        protected void RadioLstSchool_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillProgramRadio();
        }

        protected void RadioLstProg_SelectedIndexChanged(object sender, EventArgs e)
        {

            FillCourseCheckList();
        }

        protected void chklistCourse_SelectedIndexChanged(object sender, EventArgs e)
        {
            OleDbCommand courStud = new OleDbCommand(FillStudentGrid(), myCon);
            OleDbDataReader courStudRd = courStud.ExecuteReader();
            gridStudent.DataSource = courStudRd;
            gridStudent.DataBind();
            chklistCourse.Visible = lblCourse.Visible = true;
        }

    }
}