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
            roll_no = (string)Session["roll_no"];
            if (!string.IsNullOrEmpty(roll_no))
                addCourseButtons(roll_no);

        }

        DataTable loadAttendance(string roll_no, string course)
        {
            if (!string.IsNullOrEmpty(roll_no) && !string.IsNullOrEmpty(course))
            {
                conn.Open();
                string query = "select att.LectureNo as 'Lecture No',  CONVERT(varchar(10), att.AttendanceDate, 101) as 'Date',  duration as 'Duration', presence as 'Presence'   from Attendance att " +
                    "join Students st on st.StudentID = att.StudentID " +
                    "where att.CourseID = @cid and st.RollNo = @roll";
                SqlCommand command = new SqlCommand(query, conn);
                command.Parameters.AddWithValue("@cid", course);
                command.Parameters.AddWithValue("@roll", roll_no);
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

        protected float CalculatePresencePercentage(DataTable dt)
        {
            float totalFactor = 0;
            float totalDuration = 0;
            foreach (DataRow row in dt.Rows)
            {
                float dur = float.Parse(row["duration"].ToString());
                if (row["Presence"].ToString() == "P")
                    totalFactor += (dur * 1);
                else if (row["Presence"].ToString() == "L")
                    totalFactor += (dur * 0.5f);
                else if (row["Presence"].ToString() == "A")
                    totalFactor += (dur * 0);
                totalDuration += dur;
            }
            return (totalFactor / totalDuration) * 100;
        }

        protected void fetchAttendance(object sender, EventArgs e)
        {
            Button clickedButton = (Button)sender;
            clickedButton.CssClass = "btn btn-secondary rounded-5";

            updateAttendance(roll_no, clickedButton.ID);

            foreach (Button button in linkbuttons.Controls.OfType<Button>().Where(b => b != clickedButton))
                button.CssClass = "btn btn-link nav-link";
        }

        protected void addCourseButtons(string roll_no)
        {
            conn.Open();
            string query = "SELECT cc.CourseID, cc.CourseCode from courses cc " +
                "join TakenBy tb on tb.CourseID = cc.CourseID " +
                "join Students st on tb.UserID = st.UserID " +
                "where st.RollNo = @roll";
            SqlCommand command = new SqlCommand(query, conn);
            command.Parameters.AddWithValue("@roll", roll_no);
            SqlDataReader reader = command.ExecuteReader();
            int i = 0;
            string init_id = "";
            while (reader.Read())
            {
                string courseCode = reader["coursecode"].ToString();
                string courseId = reader["courseid"].ToString();
                Button button = new Button();
                button.ID = courseId;
                button.Text = courseCode;
                if (i == 0)
                {
                    button.CssClass = "btn btn-secondary rounded-5";
                    init_id = courseId;
                    i++;
                }
                else button.CssClass = "btn btn-link nav-link";
                button.Click += new EventHandler(fetchAttendance);
                linkbuttons.Controls.Add(button);
            }
            reader.Close();
            conn.Close();
            updateAttendance(roll_no, init_id);
        }

        protected void updateAttendance(string roll_no, string course)
        {
            DataTable data = loadAttendance(roll_no, course);
            attendanceGrid.DataSource = data;
            attendanceGrid.DataBind();

            float per = CalculatePresencePercentage(data);
            Helper.alert(per.ToString(), this);
            attendanceProgress.Style["width"] = per.ToString() + "%";
            attendanceProgress.InnerHtml = per.ToString("F2") + "%";
            if (per < 85)
                attendanceProgress.Attributes["class"] = "progress-bar progress-bar-striped progress-bar-animated bg-danger";
            else
                attendanceProgress.Attributes["class"] = "progress-bar progress-bar-striped progress-bar-animated bg-success";
        }
    }
}