using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace PrgAdoNet
{
    public partial class WebDataSet : System.Web.UI.Page
    {
        static DataSet companySet;
        static DataTable tbFunction;
        static DataTable tbEmployee;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                companySet = new DataSet();
                tbFunction = CreateTabFunction();
                tbEmployee = CreateTabEmployees();

                companySet.Tables.Add(tbFunction);
                companySet.Tables.Add(tbEmployee);

                DataRelation myRel = new DataRelation("functionEmployee", tbFunction.Columns["RefFunction"], tbEmployee.Columns["RefFunction"]);
                companySet.Relations.Add(myRel);


                gridTable.DataSource = tbEmployee;
                gridTable.DataBind();
                fillFunctionListBox();
            }
        }

        private void fillGridView()
        {
            DataRow[] search = tbEmployee.Select("RefFunction =" + lstFunction.SelectedValue.ToString());
            DataTable temp = search.CopyToDataTable();
            gridTable.DataSource = temp;
            gridTable.DataBind();
        }
        private void fillFunctionListBox()
        {
            // loop version
            //foreach(DataRow myrow in tbFunction.Rows)
            //{
            //    lstFunction.Items.Add(new ListItem(myrow["Title"].ToString(), myrow["RefFunction"].ToString()));
            //}

            // Databinding version
            lstFunction.DataTextField = "Title";
            lstFunction.DataValueField = "RefFunction";
            lstFunction.DataSource = tbFunction;
            lstFunction.DataBind();
        }

        private void fillTextBoxes()
        {
            // ******************************loop version****************************************
            //foreach(DataRow myrow in tbFunction.Rows)
            //{
            //    if (myrow["RefFunction"].ToString() == lstFunction.SelectedItem.Value.ToString())
            //    {
            //        txtTitle.Text = myrow["Title"].ToString();
            //        txtSalary.Text = myrow["BaseSalary"].ToString();
            //        txtDiploma.Text = myrow["Diploma"].ToString();
            //        txtDescription.Text = myrow["Description"].ToString();
            //    }
            //}

            //****************************OOP version*****************************************
            //DataRow[] search = tbFunction.Select("RefFunction =" + lstFunction.SelectedValue.ToString());
            //if (search.Length != 0)
            //{
            //    txtTitle.Text = search[0]["Title"].ToString();
            //    txtSalary.Text = search[0]["BaseSalary"].ToString();
            //    txtDiploma.Text = search[0]["Diploma"].ToString();
            //    txtDescription.Text = search[0]["Description"].ToString();
            //}

            // Another OOP version
            DataRow myrow = tbFunction.Rows.Find(Convert.ToInt32(lstFunction.SelectedValue));
            txtTitle.Text = myrow["Title"].ToString();
            txtSalary.Text = myrow["BaseSalary"].ToString();
            txtDiploma.Text = myrow["Diploma"].ToString();
            txtDescription.Text = myrow["Description"].ToString();
        }
        private DataTable CreateTabEmployees()
        {
            DataTable temp = new DataTable("Employees");
            DataColumn myCol = new DataColumn("RefEmployee", typeof(Int32));
            myCol.AutoIncrement = true;
            myCol.AutoIncrementSeed = 1;
            myCol.AutoIncrementStep = 1;
            temp.Columns.Add(myCol);

            temp.Columns.Add(new DataColumn("EmpName", typeof(String)));
            temp.Columns.Add(new DataColumn("Birthday", typeof(DateTime)));
            temp.Columns.Add(new DataColumn("Salary", typeof(Decimal)));
            temp.Columns.Add(new DataColumn("Address", typeof(String)));
            temp.Columns.Add(new DataColumn("RefFunction", typeof(Int32)));

            DataColumn[] keys = new DataColumn[1];
            keys[0] = temp.Columns["RefEmployee"];
            temp.PrimaryKey = keys;

            DataRow myRow = temp.NewRow();
            myRow["EmpName"] = "Judy Mok";
            myRow["Birthday"] = new DateTime(1982, 02, 13);
            myRow["Salary"] = 30000;
            myRow["Address"] = "1819 Beaubien East Montreal";
            myRow["RefFunction"] = 3;
            temp.Rows.Add(myRow);

            myRow = temp.NewRow();
            myRow["EmpName"] = "Jingyu Mok";
            myRow["Birthday"] = new DateTime(1985, 10, 14);
            myRow["Salary"] = 28000;
            myRow["Address"] = "1819 Beaubien East Montreal";
            myRow["RefFunction"] = 3;
            temp.Rows.Add(myRow);

            myRow = temp.NewRow();
            myRow["EmpName"] = "Kong Mok";
            myRow["Birthday"] = new DateTime(2013, 04, 05);
            myRow["Salary"] = 60000;
            myRow["Address"] = "1819 Beaubien East Montreal";
            myRow["RefFunction"] = 1;
            temp.Rows.Add(myRow);

            myRow = temp.NewRow();
            myRow["EmpName"] = "Sally Mok";
            myRow["Birthday"] = new DateTime(2016, 07, 01);
            myRow["Salary"] = 50000;
            myRow["Address"] = "1819 Beaubien East Montreal";
            myRow["RefFunction"] = 2;
            temp.Rows.Add(myRow);

            return temp;
        }

        private DataTable CreateTabFunction()
        {
            DataTable temp = new DataTable("Functions");
            DataColumn myCol = new DataColumn("RefFunction", typeof(Int32));
            myCol.AutoIncrement = true;
            myCol.AutoIncrementSeed = 1;
            myCol.AutoIncrementStep = 1;
            temp.Columns.Add(myCol);

            temp.Columns.Add(new DataColumn("Title", typeof(String)));
            temp.Columns.Add(new DataColumn("BaseSalary", typeof(Decimal)));
            temp.Columns.Add(new DataColumn("Diploma", typeof(String)));
            temp.Columns.Add(new DataColumn("Description", typeof(String)));

            DataColumn[] keys = new DataColumn[1];
            keys[0] = temp.Columns["RefFunction"];
            temp.PrimaryKey = keys;

            DataRow myRow = temp.NewRow();
            myRow["Title"] = "Director";
            myRow["BaseSalary"] = 50000;
            myRow["Diploma"] = "Bachelor";
            myRow["Description"] = "Manage the department";
            temp.Rows.Add(myRow);

            myRow = temp.NewRow();
            myRow["Title"] = "Teacher";
            myRow["BaseSalary"] = 35000;
            myRow["Diploma"] = "Bachelor";
            myRow["Description"] = "Worst job ever";
            temp.Rows.Add(myRow);

            myRow = temp.NewRow();
            myRow["Title"] = "Security";
            myRow["BaseSalary"] = 25000;
            myRow["Diploma"] = "Secondary 5th";
            myRow["Description"] = "Keep the building and the people safe";
            temp.Rows.Add(myRow);

            return temp;
        }

        protected void lstFunction_SelectedIndexChanged(object sender, EventArgs e)
        {
            fillTextBoxes();
            fillGridView();
        }

        private void clearboxes()
        {
            txtDescription.Text = txtDiploma.Text = txtSalary.Text = txtTitle.Text = "";
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            clearboxes();
            status = "Add";

        }
        private string status;
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if(status == "Add")
            {
                DataRow myrow = companySet.Tables["Functions"].NewRow();
                myrow["Title"] = txtDescription.Text;
                myrow["BaseSalary"] = Convert.ToDouble(txtSalary.Text);
                myrow["Diploma"] = txtDiploma.Text;
                myrow["Description"] = txtDescription.Text;
                tbFunction.Rows.Add(myrow);
                fillFunctionListBox();
            }
            if(status == "Edit")
            {
                DataRow myrow = tbFunction.Rows.Find(Convert.ToInt32(lstFunction.SelectedValue));
                myrow["Title"] = txtDescription.Text;
                myrow["BaseSalary"] = Convert.ToDouble(txtSalary.Text);
                myrow["Diploma"] = txtDiploma.Text;
                myrow["Description"] = txtDescription.Text;
            }
            if(status == "Delete")
            {
                tbFunction.Rows.Find(Convert.ToInt32(lstFunction.SelectedValue)).Delete();
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            status = "Edit";
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            status = "Delete";
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            fillTextBoxes();
            fillGridView();
        }
    }

}