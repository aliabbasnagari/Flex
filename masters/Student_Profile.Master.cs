using Flex.Classes;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flex.masters
{
    public partial class Student_Profile : System.Web.UI.MasterPage
    {
        SqlConnection conn = new SqlConnection("Data Source=anonymous\\SQLEXPRESS;Initial Catalog=FLEXDB;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            string roll_no = (string)Session["roll_no"];
            if (!string.IsNullOrEmpty(roll_no))
            {
                conn.Open();
                SqlCommand cm;
                string query = "select concat(firstname, ' ' ,lastname) as name, nuemail from students stud " +
                    "join users usr on usr.userid = stud.userid " +
                    "where stud.rollno = @rollno";

                //string query = "SELECT Name, Degree FROM students WHERE RollNo = '" + EncryptionUtility.Decrypt(roll_no) + "';";
                cm = new SqlCommand(query, conn);
                cm.Parameters.AddWithValue("@rollno", EncryptionUtility.Decrypt(roll_no));
                SqlDataReader res = cm.ExecuteReader();
                while (res.Read())
                {
                    string uname = res["name"].ToString();
                    string udegree = res["nuemail"].ToString();
                    lbName.Text = uname;
                    lbDegRoll.Text = EncryptionUtility.Decrypt(roll_no) + " - " + udegree;
                }
                res.Close();
                conn.Close();
            }
            else
            {
                Response.Redirect("~/pages/students/login.aspx"); // Redirect to the home page
            }

        }

        protected void btnSignOut_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/pages/students/login.aspx"); // Redirect to the home page
        }
    }
}