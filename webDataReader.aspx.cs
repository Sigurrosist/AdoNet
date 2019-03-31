using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;

namespace PrgAdoNet
{
    
    public partial class webDataReader : System.Web.UI.Page
    {
        OleDbConnection myCon;
        OleDbDataReader rdStudents;
        OleDbDataReader rdCourses;
        protected void Page_Load(object sender, EventArgs e)
        {
            myCon = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("~/App_Data/College.mdb"));
            myCon.Open();
            OleDbCommand myCmd = new OleDbCommand("select StudentName, BirthDate, Telephone, Average, Email, ReferCourse from Students", myCon);
            rdStudents = myCmd.ExecuteReader();
            OleDbCommand myCmd1 = new OleDbCommand("select [Number], RefCourse, Title, Duration, Teacher, Description from Courses order by [Number]", myCon);
            rdCourses = myCmd1.ExecuteReader();
            if (!Page.IsPostBack)
            {            
                FillLstCourse();
                gridResult.DataSource = rdStudents;
                gridResult.DataBind();
            }
        }

        private void FillLstCourse()
        {
            lstCourse.DataTextField = "Number";
            lstCourse.DataValueField = "RefCourse";
            lstCourse.DataSource = rdCourses;
            lstCourse.DataBind();
        }

        protected void lstCourse_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillTextBoxes();
            FillGridView();
        }

        private void FillTextBoxes()
        {
            OleDbCommand crsCmd = new OleDbCommand("select [Number], Teacher, Duration, Title, Description from Courses where [Number] =@num", myCon);
            crsCmd.Parameters.AddWithValue("num", lstCourse.SelectedItem.Text);
            OleDbDataReader crsRdr = crsCmd.ExecuteReader();
            DataTable res = new DataTable();
            res.Load(crsRdr);
            txtNumber.Text = res.Rows[0]["Number"].ToString();
            txtTeacher.Text = res.Rows[0]["Teacher"].ToString();
            txtDuration.Text = res.Rows[0]["Duration"].ToString();
            txtTitle.Text = res.Rows[0]["Title"].ToString();
            litDescription.Text = res.Rows[0]["Description"].ToString();
        }

        private void FillGridView()
        {
            OleDbCommand studCourseCmd = new OleDbCommand("select * from Students where ReferCourse =@refcourse", myCon);
            studCourseCmd.Parameters.AddWithValue("refcourse", lstCourse.SelectedValue.ToString());
            OleDbDataReader myStudCour = studCourseCmd.ExecuteReader();
            gridResult.DataSource = myStudCour;
            gridResult.DataBind();
        }

        protected void btnCheck_Click(object sender, EventArgs e)
        {
            gridTestShow();
        }

        private void gridTestShow()
        {
            string sql = "select * from Courses where Teacher=@teach and Duration <@dur";
            OleDbCommand myCmdTest = new OleDbCommand(sql, myCon);
            //OleDbParameter myPar = new OleDbParameter("teach", "Houria Houmel");
            //myCmdTest.Parameters.Add(myPar);

            myCmdTest.Parameters.AddWithValue("teach", "Houria Houmel");
            myCmdTest.Parameters.AddWithValue("dur", 50);

            OleDbDataReader rdTest = myCmdTest.ExecuteReader();
            GridTest.DataSource = rdTest;
            GridTest.DataBind();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int refC = Convert.ToInt32(lstCourse.SelectedItem.Value);
            string sql = "update Courses set Duration=@dur, Teacher=@tea, Description=@des where Refcourse=@courseid";
            OleDbCommand mycmdUpdate = new OleDbCommand(sql, myCon);
            mycmdUpdate.Parameters.AddWithValue("dur", Convert.ToInt32(txtDuration.Text));
            mycmdUpdate.Parameters.AddWithValue("tea", txtTeacher.Text);
            mycmdUpdate.Parameters.AddWithValue("des", litDescription.Text);
            mycmdUpdate.Parameters.AddWithValue("dur", refC);

            int mycmdupdate = mycmdUpdate.ExecuteNonQuery();


        }
    }
}