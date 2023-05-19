using Flex.Classes;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flex.pages.faculty
{
    public partial class weightage : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("Data Source=anonymous\\SQLEXPRESS;Initial Catalog=FlexDB;Integrated Security=True");
        string nu_email;
        string sel_course;
        protected void Page_Load(object sender, EventArgs e)
        {
            nu_email = (string)Session["nuemail"];
            addCourseButtons(nu_email);
        }
        protected void addCourseButtons(string email)
        {
            conn.Open();
            string query = "SELECT cc.CourseID, cc.CourseCode from courses cc " +
                "join TakenBy tb on tb.CourseID = cc.CourseID " +
                "join Faculty fc on tb.UserID = fc.UserID " +
                "join Users usr on usr.UserID = fc.UserID " +
                "where usr.NUemail = @numail";
            SqlCommand command = new SqlCommand(query, conn);
            command.Parameters.AddWithValue("@numail", email);
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                string courseCode = reader["coursecode"].ToString();
                string courseId = reader["courseid"].ToString();
                Button courseBtn = new Button();
                courseBtn.ID = courseId;
                courseBtn.Text = courseCode;
                courseBtn.CssClass = "btn btn-link nav-link";
                courseBtn.Click += currentCourseWeights;
                courseButtons.Controls.Add(courseBtn);
            }
            reader.Close();
            conn.Close();
        }

        protected void currentCourseWeights(object sender, EventArgs e)
        {
            Button clickedButton = (Button)sender;
            clickedButton.CssClass = "btn btn-secondary rounded-5";
            Session["att_sel_course"] = clickedButton.ID;

            getWeights(clickedButton.ID);

            foreach (Button button in courseButtons.Controls.OfType<Button>().Where(b => b != clickedButton))
                button.CssClass = "btn btn-link nav-link";
        }

        protected void getWeights(string courseid)
        {
            conn.Open();
            string query = "SELECT * from WeightageDistribution wd " +
                "where wd.courseid = @cid";
            SqlCommand command = new SqlCommand(query, conn);
            command.Parameters.AddWithValue("@cid", courseid);
            SqlDataReader reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                Session["has_already"] = "TRUE";
                while (reader.Read())
                {
                    assiWeight.Text = reader["AssignmentW"].ToString();
                    quizWeight.Text = reader["QuizW"].ToString();
                    sess1Weight.Text = reader["Sessional1W"].ToString();
                    sess2Weight.Text = reader["Sessional2W"].ToString();
                    projWeight.Text = reader["ProjectW"].ToString();
                    examWeight.Text = reader["FinalW"].ToString();
                }
            }
            else
            {
                Session["has_already"] = "FALSE";
            }
            reader.Close();
            conn.Close();

        }


        protected void btnSetWeights_Click(object sender, EventArgs e)
        {
            if ((string)Session["has_already"] == "TRUE")
            {
                if ((float.Parse(assiWeight.Text) + float.Parse(quizWeight.Text) + float.Parse(sess1Weight.Text) + float.Parse(sess2Weight.Text) + float.Parse(projWeight.Text) + float.Parse(examWeight.Text)) <= 100)
                {
                    conn.Open();
                    string query = "Update WeightageDistribution " +
                        "set AssignmentW = @aw, " +
                        "QuizW = @qw, " +
                        "Sessional1W = @s1w, " +
                        "Sessional2W = @s2w, " +
                        "ProjectW = @pw, " +
                        "FinalW = @fw " +
                        "Where CourseID = @cid";
                    SqlCommand command = new SqlCommand(query, conn);
                    command.Parameters.AddWithValue("@cid", (string)Session["att_sel_course"]);
                    command.Parameters.AddWithValue("@aw", assiWeight.Text);
                    command.Parameters.AddWithValue("@qw", quizWeight.Text);
                    command.Parameters.AddWithValue("@s1w", sess1Weight.Text);
                    command.Parameters.AddWithValue("@s2w", sess2Weight.Text);
                    command.Parameters.AddWithValue("@pw", projWeight.Text);
                    command.Parameters.AddWithValue("@fw", examWeight.Text);
                    int effected = command.ExecuteNonQuery();
                    conn.Close();
                }
                else
                {
                    Helper.alert("Weightage Excedded 100", this);
                }
            }
            else
            {
                if ((float.Parse(assiWeight.Text) + float.Parse(quizWeight.Text) + float.Parse(sess1Weight.Text) + float.Parse(sess2Weight.Text) + float.Parse(projWeight.Text) + float.Parse(examWeight.Text)) <= 100)
                {
                    conn.Open();
                    string query = "INSERT INTO WeightageDistribution (CourseID, AssignmentW, QuizW, Sessional1W, Sessional2W, ProjectW, FinalW) " +
                                        "VALUES (@cid, @aw, @qw, @s1w, @s2w, @pw, @fw);";
                    SqlCommand command = new SqlCommand(query, conn);
                    command.Parameters.AddWithValue("@cid", (string)Session["att_sel_course"]);
                    command.Parameters.AddWithValue("@aw", assiWeight.Text);
                    command.Parameters.AddWithValue("@qw", quizWeight.Text);
                    command.Parameters.AddWithValue("@s1w", sess1Weight.Text);
                    command.Parameters.AddWithValue("@s2w", sess2Weight.Text);
                    command.Parameters.AddWithValue("@pw", projWeight.Text);
                    command.Parameters.AddWithValue("@fw", examWeight.Text);
                    int effected = command.ExecuteNonQuery();
                    conn.Close();
                }
                else
                {
                    Helper.alert("Weightage Excedded 100", this);
                }
            }


        }
    }
}