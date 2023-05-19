using Flex.Classes;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flex.pages.faculty
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("Data Source=anonymous\\SQLEXPRESS;Initial Catalog=FlexDB;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["roll_no"] = EncryptionUtility.Encrypt("21I-2503"); // Save the username in session
            //Response.Redirect("~/pages/Student/Profile.aspx"); // Redirect to the home page
        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            if (loginAuth(userEmail.Text, userPassword.Text))
            {
                Session["nuemail"] = userEmail.Text; // Save the username in session
                Response.Redirect("~/pages/faculty/profile.aspx"); // Redirect to the home page
            }
        }

        protected bool loginAuth(string nuemail, string password)
        {
            conn.Open();
            SqlCommand cm;
            string query = "select * from faculty fc " +
                "join Users usr on usr.userid = fc.userid " +
                "where usr.NUemail = @nuemail and usr.password = @password";
            cm = new SqlCommand(query, conn);
            cm.Parameters.AddWithValue("@nuemail", nuemail);
            cm.Parameters.AddWithValue("@password", password);
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
                    Session["f_uid"] = res["UserID"].ToString();
                }
                cm.Dispose();
                conn.Close();
                return true;
            }
        }
    }
}