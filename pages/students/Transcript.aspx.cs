using Flex.Classes;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.DynamicData;

namespace Flex.pages.students
{
    public partial class Transcript : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("Data Source=anonymous\\SQLEXPRESS;Initial Catalog=FlexDB;Integrated Security=True");
        string roll_no;
        protected void Page_Load(object sender, EventArgs e)
        {
            roll_no = (string)Session["roll_no"];
            addSemesterButtons(roll_no);
        }

        protected void addSemesterButtons(string rollno)
        {
            conn.Open();
            string query = "SELECT ss.SemesterID, ss.SemesterName from semesters ss " +
                "join studentsemester sts on sts.semesterid = ss.semesterid " +
                "join students st on st.studentid = sts.studentid " +
                "where st.rollno = @roll";
            SqlCommand command = new SqlCommand(query, conn);
            command.Parameters.AddWithValue("@roll", rollno);
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                string courseCode = reader["SemesterName"].ToString();
                string courseId = reader["SemesterID"].ToString();
                Button courseBtn = new Button();
                courseBtn.ID = courseId;
                courseBtn.Text = courseCode;
                courseBtn.CssClass = "btn btn-link nav-link";
                courseBtn.Click += fetchTranscript;
                semesterButtons.Controls.Add(courseBtn);
            }
            reader.Close();
            conn.Close();
        }

        protected void fetchTranscript(object sender, EventArgs e)
        {
            Button clickedButton = (Button)sender;
            clickedButton.CssClass = "btn btn-secondary rounded-5";
            Session["sel_semester"] = clickedButton.ID;
            DataTable data = loadTrasncriptData();
            transcriptGrid.DataSource = data;
            transcriptGrid.DataBind();
            float totalfactor = 0;
            float totalcredits = 0;
            foreach (DataRow row in data.Rows)
            {
                float ccre = float.Parse(row["credithours"].ToString());
                totalfactor += (Helper.getGradeGPA(row["grade"].ToString()) * ccre);
                totalcredits += ccre;
            }
            gpaLabel.Text = (totalfactor / totalcredits).ToString();
            foreach (Button button in semesterButtons.Controls.OfType<Button>().Where(b => b != clickedButton))
                button.CssClass = "btn btn-link nav-link";
        }

        DataTable loadTrasncriptData()
        {
            conn.Open();
            string query = "select cs.coursecode, cs.coursename, cs.credithours, td.grade,  cs.coursetype from Transcript t " +
                "join TranscriptDetails td on td.TranscriptID = t.TranscriptID " +
                "join Students st on st.studentid = t.studentid " +
                "join Courses cs on cs.courseid = td.courseid " +
                "where st.rollno = @roll";
            SqlCommand command = new SqlCommand(query, conn);
            command.Parameters.AddWithValue("@roll", (string)Session["roll_no"]);
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