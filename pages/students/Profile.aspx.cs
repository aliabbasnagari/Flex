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
                
            }
            else
            {
                Response.Redirect("~/pages/Login.aspx"); // Redirect to the home page
            }

        }
    }
}