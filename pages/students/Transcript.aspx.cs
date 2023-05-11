using Flex.Classes;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flex.pages.students
{
    public partial class Transcript : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("Data Source=anonymous\\SQLEXPRESS;Initial Catalog=FlexDB;Integrated Security=True");
        string roll_no;
        protected void Page_Load(object sender, EventArgs e)
        {
            roll_no = EncryptionUtility.Decrypt((string)Session["roll_no"]);
            if (!IsPostBack)
            {
                DataTable data = loadCourses();
                attendanceGrid.DataSource = data;
                attendanceGrid.DataBind();
            }
        }

        DataTable loadCourses()
        {
            conn.Open();
            string query = "SELECT * from courses";
            SqlCommand command = new SqlCommand(query, conn);
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            return dt;
        }

        protected void profileButton_Click(object sender, EventArgs e)
        {

        }

        protected void fetchAttendance(object sender, EventArgs e)
        {
            Button clickedButton = (Button)sender;
            clickedButton.CssClass = "btn btn-secondary rounded-5";

            DataTable data = loadCourses();
            attendanceGrid.DataSource = data;
            attendanceGrid.DataBind();

            foreach (Button button in linkbuttons.Controls.OfType<Button>().Where(b => b != clickedButton))
            {
                button.CssClass = "btn btn-link nav-link";
            }
        }
    }
}