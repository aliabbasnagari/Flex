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
    public partial class Academic_Report : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("Data Source=anonymous\\SQLEXPRESS;Initial Catalog=FlexDB;Integrated Security=True");
        string roll_no;
        protected void Page_Load(object sender, EventArgs e)
        {
            roll_no = (string)Session["roll_no"];
            addCourseButtons(roll_no);
        }

        protected void addCourseButtons(string rollno)
        {
            conn.Open();
            string query = "SELECT cc.CourseID, cc.CourseCode from courses cc " +
                "join TakenBy tb on tb.CourseID = cc.CourseID " +
                "join students std on tb.UserID = std.UserID " +
                "where std.rollno = @roll";
            SqlCommand command = new SqlCommand(query, conn);
            command.Parameters.AddWithValue("@roll", rollno);
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                string courseCode = reader["coursecode"].ToString();
                string courseId = reader["courseid"].ToString();
                Button courseBtn = new Button();
                courseBtn.ID = courseId;
                courseBtn.Text = courseCode;
                courseBtn.CssClass = "btn btn-link nav-link";
                courseBtn.Click += fetchMarksData;
                courseButtons.Controls.Add(courseBtn);
            }
            reader.Close();
            conn.Close();
        }

        protected void fetchMarksData(object sender, EventArgs e)
        {
            Button clickedButton = (Button)sender;
            clickedButton.CssClass = "btn btn-secondary rounded-5";
            Session["sel_course_id"] = clickedButton.ID;
            DataTable data = loadAssessmentData("Assignment");
            assignmentsGrid.DataSource = data;
            assignmentsGrid.DataBind();
            data.Clear();
            data = loadAssessmentData("Quiz");
            quizzesGrid.DataSource = data;
            quizzesGrid.DataBind();
            data.Clear();
            data = loadAssessmentData("SessionalExam");
            sessionalsGrid.DataSource = data;
            sessionalsGrid.DataBind();
            data.Clear();
            data = loadAssessmentData("Project");
            projectGrid.DataSource = data;
            projectGrid.DataBind();
            data.Clear();
            data = loadAssessmentData("FinalExam");
            finalGrid.DataSource = data;
            finalGrid.DataBind();
            data.Clear();
            foreach (Button button in courseButtons.Controls.OfType<Button>().Where(b => b != clickedButton))
                button.CssClass = "btn btn-link nav-link";
        }

        DataTable loadAssessmentData(string type)
        {
            conn.Open();
            string query = "SELECT ass.* from Assessments ass " +
                "join students std on std.studentid = ass.studentid " +
                "where ass.courseid = @cid and std.rollno = @roll and ass.AssessmentType = @asst";
            SqlCommand command = new SqlCommand(query, conn);
            command.Parameters.AddWithValue("@cid", (string)Session["sel_course_id"]);
            command.Parameters.AddWithValue("@roll", (string)Session["roll_no"]);
            command.Parameters.AddWithValue("@asst", type);
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            conn.Close();
            return dt;
        }

        protected void profileButton_Click(object sender, EventArgs e)
        {

        }
    }
}