using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Flex.Classes
{
    public static class ComQueries
    {
        private static SqlConnection conn = new SqlConnection("Data Source=anonymous\\SQLEXPRESS;Initial Catalog=FlexDB;Integrated Security=True");
        public static int MaxUserID()
        {
            int users = -1;
            conn.Open();
            string query = "SELECT max(UserID) FROM USERS;";
            SqlCommand command = new SqlCommand(query, conn);
            SqlDataReader reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                if (reader.Read())
                {
                    if (int.TryParse(reader[0].ToString(), out users))
                    {
                        reader.Close();
                        conn.Close();
                        return users;
                    }
                }
            }
            reader.Close();
            conn.Close();
            return users;
        }

        public static int MaxStudentID()
        {
            int users = -1;
            conn.Open();
            string query = "SELECT MAX(StudentID) FROM Students;";
            SqlCommand command = new SqlCommand(query, conn);
            SqlDataReader reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                if (reader.Read())
                {
                    if (int.TryParse(reader[0].ToString(), out users))
                    {
                        reader.Close();
                        conn.Close();
                        return users;
                    }
                }
            }
            reader.Close();
            conn.Close();
            return users;
        }

        public static int MaxFacultyID()
        {
            int users = -1;
            conn.Open();
            string query = "SELECT max(FacultyID) FROM Faculty;";
            SqlCommand command = new SqlCommand(query, conn);
            SqlDataReader reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                if (reader.Read())
                {
                    if (int.TryParse(reader[0].ToString(), out users))
                    {
                        reader.Close();
                        conn.Close();
                        return users;
                    }
                }
            }
            reader.Close();
            conn.Close();
            return users;
        }

        public static int MaxAcademicsID()
        {
            int users = -1;
            conn.Open();
            string query = "SELECT max(AcademicsID) FROM Academics;";
            SqlCommand command = new SqlCommand(query, conn);
            SqlDataReader reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                if (reader.Read())
                {
                    if (int.TryParse(reader[0].ToString(), out users))
                    {
                        reader.Close();
                        conn.Close();
                        return users;
                    }
                }
            }
            reader.Close();
            conn.Close();
            return users;
        }

        public static int getStudentsCount()
        {
            int users = -1;
            conn.Open();
            string query = "select count(*) as 'NoStudents' from Students;";
            SqlCommand command = new SqlCommand(query, conn);
            SqlDataReader reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                if (reader.Read())
                {
                    users = int.Parse(reader["NoStudents"].ToString());
                }
            }
            reader.Close();
            conn.Close();
            return users;
        }

        public static int getUsersCount()
        {
            int users = -1;
            conn.Open();
            string query = "select count(*) as 'NoUsers' from Users;";
            SqlCommand command = new SqlCommand(query, conn);
            SqlDataReader reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                if (reader.Read())
                {
                    users = int.Parse(reader["NoUsers"].ToString());
                }
            }
            reader.Close();
            conn.Close();
            return users;
        }

        public static int MaxAttendanceID()
        {
            int users = -1;
            conn.Open();
            string query = "SELECT max(AttendanceID) FROM Attendance;";
            SqlCommand command = new SqlCommand(query, conn);
            SqlDataReader reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                if (reader.Read())
                {
                    if (int.TryParse(reader[0].ToString(), out users))
                    {
                        reader.Close();
                        conn.Close();
                        return users;
                    }
                }
            }
            reader.Close();
            conn.Close();
            return users;
        }

        public static bool NuMailExists(string email)
        {
            conn.Open();
            string query = "SELECT U.UserID FROM USERS U where U.NUemail = @email;";
            SqlCommand command = new SqlCommand(query, conn);
            command.Parameters.AddWithValue("@email", email);
            SqlDataReader reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                reader.Close();
                conn.Close();
                return true;
            }
            reader.Close();
            conn.Close();
            return false;
        }

        public static string getLatestSemesterID(string rollno)
        {
            string semester = "";
            conn.Open();
            string query = "SELECT top 1 ss.SemesterID from semesters ss " +
                "join studentsemester sts on sts.semesterid = ss.semesterid " +
                "join students st on st.studentid = sts.studentid " +
                "where st.rollno = @roll" +
                "Order by ss.SemesterID desc";
            SqlCommand command = new SqlCommand(query, conn);
            command.Parameters.AddWithValue("@roll", rollno);
            SqlDataReader reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                if (reader.Read())
                {
                    semester = reader["SemesterID"].ToString();
                }
                reader.Close();
                conn.Close();
                return semester;
            }
            reader.Close();
            conn.Close();
            return semester;
        }

        public static bool AttendanceExists(string sec, string course, string date)
        {
            conn.Open();
            string query = "SELECT Att.AttendanceID from students st " +
                "join users usr on usr.userid = st.userid " +
                "join TakenBy tb on tb.userid = st.userid " +
                "JOIN Courses ccs on ccs.courseid = tb.courseid " +
                "join UserSections us on us.userid = st.userid " +
                "join Sections sc on sc.sectionid = us.sectionid " +
                "join Attendance att on att.studentid = st.studentid and att.courseid = tb.courseid " +
                "WHERE SC.SectionID = @secid AND TB.CourseID = @cid and Att.Attendancedate = @date;";
            SqlCommand command = new SqlCommand(query, conn);
            command.Parameters.AddWithValue("@secid", sec);
            command.Parameters.AddWithValue("@date", date);
            command.Parameters.AddWithValue("@cid", course);
            SqlDataReader reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                reader.Close();
                conn.Close();
                return true;
            }
            else
            {
                reader.Close();
                conn.Close();
                return false;
            }
        }
    }
}