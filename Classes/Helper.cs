using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace Flex.Classes
{
    public static class Helper
    {
        public static void alert(string message, Control control)
        {
            string script = "alert('" + message + "');";
            ScriptManager.RegisterStartupScript(control, control.GetType(), "SignInButtonClickScript", script, true);
        }
    }
}