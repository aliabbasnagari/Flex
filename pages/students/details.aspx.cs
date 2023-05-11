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
    public partial class details : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("Data Source=anonymous\\SQLEXPRESS;Initial Catalog=FlexDB;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            string roll_no = (string)Session["roll_no"];
            if (!string.IsNullOrEmpty(roll_no))
            {
                conn.Open();
                SqlCommand cm;
                string query = "select * from students where rollno = '" + EncryptionUtility.Decrypt(roll_no) + "';";
                cm = new SqlCommand(query, conn);
                SqlDataReader res = cm.ExecuteReader();
                while (res.Read())
                {
                    lbGender.Text = res["gender"].ToString();
                    lbDob.Text = ((DateTime)res["dob"]).ToString("dd/MM/yyyy");
                    lbCnic.Text = res["cnic"].ToString();
                    lbEmail.Text = res["email"].ToString();
                    lbMobNo.Text = res["phonenumber"].ToString();
                    lbNation.Text = res["nationality"].ToString();
                    lbBloodGroup.Text = "O";
                }
                res.Close();
                conn.Close();
            }
            else
            {
                Response.Redirect("~/pages/Login.aspx"); // Redirect to the home page
            }

        }
    }
}