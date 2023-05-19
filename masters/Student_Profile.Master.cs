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
                string query = "select concat(usr.firstname, ' ' ,usr.lastname) as name, dg.degreecode from students std " +
                    "join users usr on usr.userid = std.userid " +
                    "join Degree dg on dg.degreeid = std.degreeid " +
                    "where std.rollno = @rollno";

                cm = new SqlCommand(query, conn);
                cm.Parameters.AddWithValue("@rollno", roll_no);
                SqlDataReader res = cm.ExecuteReader();
                while (res.Read())
                {
                    string uname = res["name"].ToString();
                    string udegree = res["degreecode"].ToString();
                    lbName.Text = uname;
                    lbDegRoll.Text = udegree + " - " + roll_no;
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