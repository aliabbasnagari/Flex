using Flex.Classes;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flex.pages.academics
{
    public partial class Faculty_Registration : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("Data Source=anonymous\\SQLEXPRESS;Initial Catalog=FlexDB;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadCampusOptions();
            }
        }
        protected void loadCampusOptions()
        {
            conn.Open();
            ddCampus.Items.Clear();
            ddSections.Items.Add(new ListItem("Choose...", "", false));
            string query = "select CampusID, CampusName from Campus;";
            SqlCommand command = new SqlCommand(query, conn);
            SqlDataReader reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    string cname = reader["CampusName"].ToString();
                    string cid = reader["CampusID"].ToString();
                    ddCampus.Items.Add(new ListItem(cname, cid));
                }
            }
            reader.Close();
            conn.Close();
        }

        protected void loadCourseOptions()
        {
            conn.Open();
            ddCourse.Items.Clear();
            ddCourse.Items.Add(new ListItem("Choose...", ""));
            string query = "select C.CourseID, C.CourseCode from Courses C " +
                "join OfferedForDegree OD on OD.CourseID = C.CourseID " +
                "join CampusDegree CD on CD.Degree = OD.Degree " +
                "where CD.CampusID = @cid";
            SqlCommand command = new SqlCommand(query, conn);
            command.Parameters.AddWithValue("@cid", ddCampus.SelectedValue);
            SqlDataReader reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    string dcode = reader["CourseCode"].ToString();
                    string did = reader["CourseID"].ToString();
                    ddCourse.Items.Add(new ListItem(dcode, did));
                }
            }
            reader.Close();
            conn.Close();
        }

        protected void loadSectionOptions()
        {
            conn.Open();
            ddSections.Items.Clear();
            ddSections.Items.Add(new ListItem("Choose...", ""));
            string query = "select SectionID, SectionName from Sections s " +
                "join OfferedForDegree OD on OD.DegreeID = s.DegreeID " +
                " where s.AvailableSeats != 0 and OD.CourseID = @cid;";
            SqlCommand command = new SqlCommand(query, conn);
            command.Parameters.AddWithValue("@cid", ddCourse.SelectedValue);
            SqlDataReader reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    string sname = reader["SectionName"].ToString();
                    string sid = reader["SectionID"].ToString();
                    ddSections.Items.Add(new ListItem(sname, sid));
                }
            }
            reader.Close();
            conn.Close();
        }

        protected void btnGenerate_Click(object sender, EventArgs e)
        {
            string mail_prefix = (fName.Text + '.' + lName.Text).ToLower();
            string mail_postfix = "@nu.edu.pk";
            while(ComQueries.NuMailExists(mail_prefix + mail_postfix))
            {
                mail_prefix += ".v";
            }
            nuEmail.Text = mail_prefix + mail_postfix;
        }

        protected void ddDegree_Selected(object sender, EventArgs e)
        {
            loadSectionOptions();
        }

        protected void ddCampus_Selected(object sender, EventArgs e)
        {
            loadCourseOptions();
        }

        protected void btnEnroll_Click(object sender, EventArgs e)
        {
            string _uiid = (ComQueries.MaxUserID() + 1).ToString();
            conn.Open();
            SqlCommand command = conn.CreateCommand();
            SqlTransaction transaction;
            transaction = conn.BeginTransaction("SampleTransaction");
            command.Connection = conn;
            command.Transaction = transaction;
            command.Parameters.AddWithValue("@uid", _uiid);
            command.Parameters.AddWithValue("@fname", fName.Text);
            command.Parameters.AddWithValue("@lname", lName.Text);
            command.Parameters.AddWithValue("@nuemail", nuEmail.Text);
            command.Parameters.AddWithValue("@password", fName.Text + '@' + lName.Text);
            command.Parameters.AddWithValue("@cid", ddCampus.SelectedValue);
            command.Parameters.AddWithValue("@dob", uDob.Text);
            command.Parameters.AddWithValue("@gender", ddGender.SelectedItem.Text);
            command.Parameters.AddWithValue("@contact", phNumber.Text);
            command.Parameters.AddWithValue("@cnic", userCnic.Text);
            command.Parameters.AddWithValue("@nationality", uNation.Text);
            command.Parameters.AddWithValue("@email", uEmail.Text);
            command.Parameters.AddWithValue("@address", uAddress.Text);
            command.Parameters.AddWithValue("@city", uCity.Text);
            command.Parameters.AddWithValue("@country", uCountry.Text);
            command.Parameters.AddWithValue("@ftname", ftName.Text);
            command.Parameters.AddWithValue("@guname", null);
            command.Parameters.AddWithValue("@fid", ComQueries.MaxFacultyID() + 1);
            command.Parameters.AddWithValue("@admdate", DateTime.Now.ToString("yyyy-MM-dd"));
            command.Parameters.AddWithValue("@secid", ddSections.SelectedValue);
            try
            {
                command.CommandText = "INSERT INTO Users (UserID, FirstName, LastName, NUemail, Password, CampusID) " +
                            "VALUES (@uid, @fname, @lname, @nuemail, @password, @cid);";
                command.ExecuteNonQuery();
                command.CommandText = "INSERT INTO  UserInfo(InfoID, DOB, Gender, ContactNo, Cnic, Nationality, PersonalEmail, Address, City, Country, FatherName, GuardianName) " +
                    "VALUES (@uid, @dob, @gender, @contact, @cnic, @nationality, @email, @address, @city, @country, @ftname, @guname);";
                command.ExecuteNonQuery();
                command.CommandText = "INSERT INTO Faculty (FacultyID, UserID) " +
                    "VALUES (@fid, @uid); ";
                command.ExecuteNonQuery();
                command.CommandText = "Insert into UserSections(SectionID, UserID) " +
                    "VALUES (@secid, @uid); ";
                command.ExecuteNonQuery();

                transaction.Commit();
                Helper.alert("Success", this);
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
    }
}