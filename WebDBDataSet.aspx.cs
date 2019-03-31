using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
namespace PrgAdoNet
{
    public partial class WebDBDataSet : System.Web.UI.Page
    {
        static DataSet mySet;
        static int indx;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                mySet = new DataSet();
                SqlConnection myCon = new SqlConnection("Data Source=DESKTOP-LGADQO6;Initial Catalog=MusicBox;Integrated Security=True");
                myCon.Open();
                SqlCommand myCmd = new SqlCommand("select * from Performers", myCon);
                SqlDataAdapter adpPerformer = new SqlDataAdapter(myCmd);
                adpPerformer.Fill(mySet, "Performers");

                SqlCommand myCmd1 = new SqlCommand("select * from Songs", myCon);
                SqlDataAdapter adpSong = new SqlDataAdapter(myCmd1);
                adpSong.Fill(mySet, "Songs");

                indx = 0;
                TabToText();
            }
        }

        private void TabToText()
        {
            txtName.Text = mySet.Tables["Performers"].Rows[indx]["InterName"].ToString();
            txtGenre.Text = mySet.Tables["Performers"].Rows[indx]["Genre"].ToString();
            txtCountry.Text = mySet.Tables["Performers"].Rows[indx]["Country"].ToString();
            txtCategory.Text = mySet.Tables["Performers"].Rows[indx]["Category"].ToString();
            txtBirthDate.Text = mySet.Tables["Performers"].Rows[indx]["Birthdate"].ToString();
        }

    }
}