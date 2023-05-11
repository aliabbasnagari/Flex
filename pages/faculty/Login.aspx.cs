using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flex.pages.faculty
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGotoStudent_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/pages/students/login.aspx");
        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {

        }
    }
}