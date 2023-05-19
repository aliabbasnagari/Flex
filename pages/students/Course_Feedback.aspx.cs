﻿using Flex.Classes;
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
    public partial class Course_Feedback : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("Data Source=anonymous\\SQLEXPRESS;Initial Catalog=FlexDB;Integrated Security=True");
        string roll_no;
        protected void Page_Load(object sender, EventArgs e)
        {
            roll_no = EncryptionUtility.Decrypt((string)Session["roll_no"]);
            if (!IsPostBack)
            {
                addCourseButtons(roll_no);
            }
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
            while (reader.Read())
            {
                string courseCode = reader["coursecode"].ToString();
                string courseId = reader["courseid"].ToString();
                Button button = new Button();
                button.ID = courseId;
                button.Text = courseCode;
                button.CssClass = "btn btn-link nav-link";
                button.Click += new EventHandler(updateButton);
                linkbuttons.Controls.Add(button);
            }
            reader.Close();
            conn.Close();
        }

        protected void updateButton(object sender, EventArgs e)
        {
            Button clickedButton = (Button)sender;
            clickedButton.CssClass = "btn btn-secondary rounded-5";

            foreach (Button button in linkbuttons.Controls.OfType<Button>().Where(b => b != clickedButton))
                button.CssClass = "btn btn-link nav-link";
        }
    }
}