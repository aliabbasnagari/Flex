using Flex.Classes;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flex.pages.academics
{
    public partial class Profile : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("Data Source=anonymous\\SQLEXPRESS;Initial Catalog=FlexDB;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            string numail = (string)Session["nuemail"];
            if (!string.IsNullOrEmpty(numail))
            {
                conn.Open();
                SqlCommand cm;
                string query = "select * from academics ac " +
                    "join users ur on ur.UserID = ac.UserID " +
                    "join userinfo ui on ui.InfoID = ac.userid " +
                    "where ur.nuemail = @numail";
                cm = new SqlCommand(query, conn);
                cm.Parameters.AddWithValue("@numail", numail);
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
                Response.Redirect("~/pages/academics/Login.aspx"); // Redirect to the home page
            }

        }
    }
}