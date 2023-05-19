using Flex.Classes;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flex.pages.students
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("Data Source=anonymous\\SQLEXPRESS;Initial Catalog=FlexDB;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["roll_no"] = EncryptionUtility.Encrypt("21I-2503"); // Save the username in session
            //Response.Redirect("~/pages/Student/Profile.aspx"); // Redirect to the home page
        }

        protected void signInButton_Click(object sender, EventArgs e)
        {
            if (loginAuth(userRoll.Text, userPassword.Text))
            {
                Session["roll_no"] = userRoll.Text; // Save the username in session
                Response.Redirect("~/pages/students/profile.aspx"); // Redirect to the home page
            }
        }

        protected bool loginAuth(string rollnum, string password)
        {
            conn.Open();
            SqlCommand cm;
            string query = "select * from Students st " +
                "join Users usr on usr.userid = st.userid " +
                "where st.rollno = @Rollnum and usr.password = @Password";
            cm = new SqlCommand(query, conn);
            cm.Parameters.AddWithValue("@Rollnum", rollnum);
            cm.Parameters.AddWithValue("@Password", password);
            SqlDataReader res = cm.ExecuteReader();
            if (!res.HasRows)
            {
                cm.Dispose();
                conn.Close();
                return false;
            }
            else
            {
                if (res.Read())
                {
                    Session["s_uid"] = res["UserID"].ToString();
                }
                cm.Dispose();
                conn.Close();
                return true;
            }
        }
    }
}