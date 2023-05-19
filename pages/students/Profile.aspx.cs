using Flex.Classes;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Flex.pages.students
{
    public partial class Profile : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("Data Source=anonymous\\SQLEXPRESS;Initial Catalog=FlexDB;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            string roll_no = (string)Session["roll_no"];
            if (!string.IsNullOrEmpty(roll_no))
            {
                conn.Open();
                SqlCommand cm;
                string query = "select * from students st " +
                    "join users ur on ur.UserID = st.UserID " +
                    "join userinfo ui on ui.InfoID = st.userid " +
                    "where st.rollno = @rollno";
                cm = new SqlCommand(query, conn);
                cm.Parameters.AddWithValue("@rollno", roll_no);
                SqlDataReader res = cm.ExecuteReader();
                while (res.Read())
                {
                    lbGender.Text = res["gender"].ToString();
                    lbDob.Text = ((DateTime)res["dob"]).ToString("dd/MM/yyyy");
                    lbCnic.Text = res["cnic"].ToString();
                    lbEmail.Text = res["personalemail"].ToString();
                    lbMobNo.Text = res["contactno"].ToString();
                    lbNation.Text = res["nationality"].ToString();
                    lbAddress.Text = res["address"].ToString();
                    lbCity.Text = res["city"].ToString();
                    lbCountry.Text = res["country"].ToString();
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