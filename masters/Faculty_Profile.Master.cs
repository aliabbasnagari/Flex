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
    public partial class Faculty_Profile : System.Web.UI.MasterPage
    {
        SqlConnection conn = new SqlConnection("Data Source=anonymous\\SQLEXPRESS;Initial Catalog=FLEXDB;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            string numail = (string)Session["nuemail"];
            if (!string.IsNullOrEmpty(numail))
            {
                conn.Open();
                SqlCommand cm;
                string query = "select concat(usr.firstname, ' ' ,usr.lastname) as Name, fc.Position from faculty fc " +
                    "join users usr on usr.userid = fc.userid " +
                    "where usr.nuemail= @nuemail";

                //string query = "SELECT Name, Degree FROM students WHERE RollNo = '" + EncryptionUtility.Decrypt(roll_no) + "';";
                cm = new SqlCommand(query, conn);
                cm.Parameters.AddWithValue("@nuemail", numail);
                SqlDataReader res = cm.ExecuteReader();
                while (res.Read())
                {
                    string uname = res["Name"].ToString();
                    string position = res["Position"].ToString();
                    lbName.Text = uname;
                    lbDegRoll.Text = position;
                }
                res.Close();
                conn.Close();
            }
            else
            {
                Response.Redirect("~/pages/faculty/login.aspx"); // Redirect to the home page
            }

        }

        protected void btnSignOut_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/pages/faculty/login.aspx"); // Redirect to the home page
        }
    }
}