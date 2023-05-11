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
    public partial class Attendance : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("Data Source=anonymous\\SQLEXPRESS;Initial Catalog=FlexDB;Integrated Security=True");
        string roll_no;
        protected void Page_Load(object sender, EventArgs e)
        {
            roll_no = EncryptionUtility.Decrypt((string)Session["roll_no"]);
            if (!IsPostBack && !string.IsNullOrEmpty(roll_no))
                updateAttendance(roll_no, "MT-1001");
            addCourseButtons(roll_no);

        }

        DataTable loadAttendance(string roll_no, string course)
        {
            if (!string.IsNullOrEmpty(roll_no) && !string.IsNullOrEmpty(course))
            {
                conn.Open();
                string query = "SELECT lecture_no as 'Lecture No', CONVERT(varchar(10), date, 101) as 'Date', duration as 'Duration', presence as 'Presence' from attendance WHERE course_id = @courseId AND rollno = @rollNo";
                SqlCommand command = new SqlCommand(query, conn);
                command.Parameters.AddWithValue("@courseId", course);
                command.Parameters.AddWithValue("@rollNo", roll_no);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                conn.Close();
                return dt;
            }
            else
            {
                return null;
            }
        }

        protected void profileButton_Click(object sender, EventArgs e)
        {

        }

        protected float CalculatePresencePercentage(DataTable dt)
        {
            int totalClasses = dt.Rows.Count;
            int totalLectures = 0;
            int totalAbsent = 0;

            foreach (DataRow row in dt.Rows)
            {
                if (row["Presence"].ToString() == "L")
                    totalLectures++;
                else if (row["Presence"].ToString() == "A")
                    totalAbsent++;
            }

            float totalHours = totalClasses * 2;
            float totalPresent = (totalClasses - totalLectures) * 2;
            float percentage = (totalPresent / totalHours) * 100;
            return percentage;
        }

        protected void fetchAttendance(object sender, EventArgs e)
        {
            Button clickedButton = (Button)sender;
            clickedButton.CssClass = "btn btn-secondary rounded-5";

            updateAttendance(roll_no, clickedButton.Text);

            foreach (Button button in linkbuttons.Controls.OfType<Button>().Where(b => b != clickedButton))
                button.CssClass = "btn btn-link nav-link";
        }

        protected void addCourseButtons(string roll_no)
        {
            conn.Open();
            string query = "SELECT course_id from courses";
            SqlCommand command = new SqlCommand(query, conn);
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                string courseId = reader["course_id"].ToString();
                Button button = new Button();
                button.ID = courseId;
                button.Text = courseId;
                button.CssClass = "btn btn-link nav-link";
                button.Click += new EventHandler(fetchAttendance);
                linkbuttons.Controls.Add(button);
            }
            reader.Close();
            conn.Close();
        }

        protected void updateAttendance(string roll_no, string course)
        {
            DataTable data = loadAttendance(roll_no, course);
            attendanceGrid.DataSource = data;
            attendanceGrid.DataBind();

            float per = CalculatePresencePercentage(data);
            attendanceProgress.Style["width"] = per.ToString() + "%";
            attendanceProgress.InnerHtml = per.ToString("F2") + "%";
            if (per < 85)
                attendanceProgress.Attributes["class"] += " bg-danger";
        }
    }
}