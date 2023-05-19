using Flex.Classes;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Xml.Linq;
using System.Web.DynamicData;

namespace Flex.pages.faculty
{
    public partial class attendance : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("Data Source=anonymous\\SQLEXPRESS;Initial Catalog=FlexDB;Integrated Security=True");
        string nu_email;
        string sel_course;
        protected void Page_Load(object sender, EventArgs e)
        {
            nu_email = (string)Session["nuemail"];
            addCourseButtons(nu_email);
        }

        DataTable loadAttendance(string sec_id, string c_id)
        {
            Helper.alert(sec_id + "<-s  c->" + c_id + " " + aDate.Text, this);
            if (!string.IsNullOrEmpty(sec_id) && !string.IsNullOrEmpty(c_id))
            {
                conn.Open();/*
                string query = "SELECT ccs.coursecode, FORMAT(ATT.AttendanceDate, 'yyyy-MM-dd') as 'Date', ST.Rollno, concat(usr.firstname, ' ', lastname) as 'Student Name', ATT.Presence " +
                    "FROM Students ST " +
                    "JOIN Users usr on usr.userid = st.userid " +
                    "JOIN TakenBy TB ON TB.UserID = ST.UserID " +
                    "JOIN OfferedForDegree OD ON OD.CourseID = TB.CourseID " +
                    "JOIN COurses ccs on ccs.courseid = od.courseid " +
                    "JOIN Sections SC ON SC.DegreeId = OD.DegreeID " +
                    "JOIN Attendance ATT ON ATT.UserID = ST.UserID " +
                    "WHERE SC.SectionID = @secid AND TB.CourseID = @cid and Att.Attendancedate = @date";*/
                string query = "SELECT ccs.coursecode, FORMAT(ATT.AttendanceDate, 'yyyy-MM-dd') as 'Date', ST.Rollno, concat(usr.firstname, ' ', lastname) as 'Student Name', ATT.Presence " +
                    "from students st " +
                    "join users usr on usr.userid = st.userid " +
                    "join TakenBy tb on tb.userid = st.userid " +
                    "JOIN Courses ccs on ccs.courseid = tb.courseid " +
                    "join UserSections us on us.userid = st.userid " +
                    "join Sections sc on sc.sectionid = us.sectionid " +
                    "join Attendance att on att.studentid = st.studentid and att.courseid = tb.courseid " +
                    "WHERE SC.SectionID = @secid AND TB.CourseID = @cid and Att.Attendancedate = @date";
                SqlCommand command = new SqlCommand(query, conn);
                command.Parameters.AddWithValue("@secid", sec_id);
                command.Parameters.AddWithValue("@cid", c_id);
                command.Parameters.AddWithValue("@date", aDate.Text);
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
                courseBtn.Click += fetchSectionButtons;
                courseButtons.Controls.Add(courseBtn);
            }
            reader.Close();
            conn.Close();
        }

        protected void addSectionButtons(string email, string c_id)
        {
            conn.Open();
            string query = "SELECT SC.SectionName, SC.SectionID FROM Sections SC " +
                "JOIN CampusDegree CD ON CD.DegreeID = SC.DegreeId " +
                "JOIN OfferedForDegree OD ON OD.DegreeID = CD.DegreeID " +
                "join TakenBy tb on tb.CourseID = OD.CourseID " +
                "join Faculty fc on fc.UserID = tb.UserID " +
                "join Users usr on usr.UserID = fc.UserID " +
                "WHERE usr.NUemail = @email and OD.CourseID = @cid";
            ddSections.Items.Clear();
            ddSections.Items.Add(new ListItem("Choose...", ""));
            SqlCommand command = new SqlCommand(query, conn);
            command.Parameters.AddWithValue("@email", email);
            command.Parameters.AddWithValue("@cid", c_id);
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                string courseCode = reader["SectionName"].ToString();
                string courseId = reader["SectionID"].ToString();
                ddSections.Items.Add(new ListItem(courseCode, courseId));
            }
            ddSections.Items[0].Selected = true;
            reader.Close();
            conn.Close();
        }

        protected void updateAttendance(string sec_id, string c_id)
        {
            attendanceGrid.DataSource = null;
            attendanceGrid.DataBind();
            DataTable data = loadAttendance(sec_id, c_id);
            attendanceGrid.DataSource = data;
            attendanceGrid.DataBind();
        }

        protected void fetchSectionButtons(object sender, EventArgs e)
        {
            Button clickedButton = (Button)sender;
            clickedButton.CssClass = "btn btn-secondary rounded-5";
            Session["att_sel_course"] = clickedButton.ID;
            addSectionButtons(nu_email, clickedButton.ID);
            foreach (Button button in courseButtons.Controls.OfType<Button>().Where(b => b != clickedButton))
                button.CssClass = "btn btn-link nav-link";
        }

        protected void addAttendance_Click(object sender, EventArgs e)
        {
            bool tryAdd = false;
            string val = (string)Session["att_sel_course"];
            if (!ComQueries.AttendanceExists(ddSections.SelectedValue, val, DateTime.Now.ToString("yyyy-MM-dd")))
            {
                conn.Open();
                List<string> studID = new List<string>();
                string query = "SELECT ST.StudentID FROM Students ST " +
                    "JOIN TakenBy TB ON TB.UserID = ST.UserID " +
                    "JOIN OfferedForDegree OD ON OD.CourseID = TB.CourseID " +
                    "JOIN Sections SC ON SC.DegreeId = OD.DegreeID " +
                    "WHERE SC.SectionID = @secid AND TB.CourseID = @cid";
                SqlCommand command = new SqlCommand(query, conn);
                command.Parameters.AddWithValue("@secid", ddSections.SelectedValue);
                command.Parameters.AddWithValue("@cid", val);
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    studID.Add(reader["StudentID"].ToString());
                }
                reader.Close();
                int nid = ComQueries.MaxAttendanceID() + 1;
                for (int i = 0; i < studID.Count(); i++)
                {
                    string query2 = "INSERT INTO Attendance (AttendanceID, StudentID, CourseID, LectureNO, AttendanceDate, Duration, Presence) " +
                                    "VALUES (@aid, @uid, @cid2, @lno, @date, @dur, @pres);";
                    try
                    {
                        SqlCommand command2 = new SqlCommand(query2, conn);
                        command2.Parameters.AddWithValue("@aid", nid + i);
                        command2.Parameters.AddWithValue("@uid", studID[i]);
                        command2.Parameters.AddWithValue("@cid2", (string)Session["att_sel_course"]);
                        command2.Parameters.AddWithValue("@lno", 99);
                        command2.Parameters.AddWithValue("@date", DateTime.Now.ToString("yyyy-MM-dd"));
                        command2.Parameters.AddWithValue("@dur", 1.5);
                        command2.Parameters.AddWithValue("@pres", "-");
                        int effected = command2.ExecuteNonQuery();

                    }
                    catch (SqlException ex)
                    {
                        conn.Close();
                        Console.WriteLine("SqlException: " + ex.ToString());
                    }
                    catch (Exception ex)
                    {
                        conn.Close();
                        Console.WriteLine("Exception: " + ex.ToString());
                    }
                }
                conn.Close();
                tryAdd = true;
            }
            if (tryAdd)
                Helper.alert("Added!", this);
            else
                Helper.alert("Failed!", this);
            aDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            updateAttendance(ddSections.SelectedValue, (string)Session["att_sel_course"]);
        }

        protected void showAttendance_Click(object sender, EventArgs e)
        {
            updateAttendance(ddSections.SelectedValue, (string)Session["att_sel_course"]);
        }

        protected void btnUpdateAttendance_Click(object sender, EventArgs e)
        {
            DataTable dataTable = AttendanceUpdateData(ddSections.SelectedValue, (string)Session["att_sel_course"]);
            foreach (GridViewRow gridViewRow in attendanceGrid.Rows)
            {
                DataRow dataRow = dataTable.Rows[gridViewRow.RowIndex];
                string gridViewValue = (gridViewRow.Cells[3].FindControl("ddlPresence") as DropDownList)?.SelectedValue;
                string aid = dataRow["AttendanceID"].ToString();
                runUpdate(aid, gridViewValue);
            }

        }

        protected void runUpdate(string a_id, string presence)
        {
            bool isFailed = false;
            try
            {
                conn.Open();
                string query = "UPDATE Attendance " +
                    "SET Presence =  @pre " +
                    "WHERE AttendanceID = @aid; " +
                    "INSERT INTO LOGS (Operation, UserID, OpDate, UserType) " +
                    "VALUES (@op, @uid, @opdate, @utype); ";
                string uid = (string)Session["f_uid"];
                SqlCommand command = new SqlCommand(query, conn);
                command.Parameters.AddWithValue("@pre", presence);
                command.Parameters.AddWithValue("@aid", a_id);
                command.Parameters.AddWithValue("@op", "Updation");
                command.Parameters.AddWithValue("@uid", uid);
                command.Parameters.AddWithValue("@opdate", DateTime.Now.ToString("yyyy-MM-dd"));
                command.Parameters.AddWithValue("@utype", "Faculty");
                command.ExecuteNonQuery();
                conn.Close();
            }
            catch (SqlException ex)
            {
                isFailed = true;
                Console.WriteLine("SQL UPDATE ERROR: ", ex.Message);
                conn.Close();
            }
            if (isFailed)
                Helper.alert("Failed !", this);
            else
                Helper.alert("Success !", this);
        }

        DataTable AttendanceUpdateData(string sec_id, string c_id)
        {
            if (!string.IsNullOrEmpty(sec_id) && !string.IsNullOrEmpty(c_id))
            {
                conn.Open();
                string query = "SELECT Att.* " +
                    "from students st " +
                    "join users usr on usr.userid = st.userid " +
                    "join TakenBy tb on tb.userid = st.userid " +
                    "JOIN Courses ccs on ccs.courseid = tb.courseid " +
                    "join UserSections us on us.userid = st.userid " +
                    "join Sections sc on sc.sectionid = us.sectionid " +
                    "join Attendance att on att.studentid = st.studentid and att.courseid = tb.courseid " +
                    "WHERE SC.SectionID = @secid AND TB.CourseID = @cid and Att.Attendancedate = @date";
                SqlCommand command = new SqlCommand(query, conn);
                command.Parameters.AddWithValue("@secid", sec_id);
                command.Parameters.AddWithValue("@cid", c_id);
                command.Parameters.AddWithValue("@date", aDate.Text);
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
    }
}