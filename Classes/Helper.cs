using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flex.Classes
{
    public static class Helper
    {
        public static void alert(string message, Control control)
        {
            string script = "alert('" + message + "');";
            ScriptManager.RegisterStartupScript(control, control.GetType(), "Popup", script, true);
        }

        public static void ResetFormFields(Control parent)
        {
            foreach (Control control in parent.Controls)
            {
                if (control is TextBox)
                {
                    ((TextBox)control).Text = string.Empty;
                }
                else if (control is DropDownList)
                {
                    ((DropDownList)control).ClearSelection();
                }
                else if (control is CheckBox)
                {
                    ((CheckBox)control).Checked = false;
                }
                else if (control is RadioButtonList)
                {
                    ((RadioButtonList)control).ClearSelection();
                }
                else if (control is HiddenField)
                {
                    ((HiddenField)control).Value = string.Empty;
                }
                else if (control.HasControls())
                {
                    ResetFormFields(control);
                }
            }
        }
    }
}