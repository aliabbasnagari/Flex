use FLEXDB;

INSERT INTO Campus (CampusID, CampusName, CampusLocation) VALUES
(1, 'University of ABC', 'New York'),
(2, 'XYZ College', 'Los Angeles'),
(3, 'ABC University', 'Chicago'),
(4, 'City College', 'San Francisco'),
(5, 'Global University', 'London');

INSERT INTO Degree (DegreeID, DegreeCode, Degree, FieldOfStudy) VALUES
(1, 'BSCS', 'Bachelor of Science in Computer Science', 'Computer Science'),
(2, 'BBA', 'Bachelor of Business Administration', 'Business Administration'),
(3, 'BSE', 'Bachelor of Software Engineering', 'Software Engineering'),
(4, 'BA', 'Bachelor of Arts', 'Arts'),
(5, 'BSEE', 'Bachelor of Science in Electrical Engineering', 'Electrical Engineering');

INSERT INTO CampusDegree (DegreeID, CampusID) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO Users (UserID, FirstName, LastName, NUemail, Password, CampusId) VALUES
(1, 'John', 'Doe', 'johndoe@example.com', 'password123', 1),
(2, 'Ali', 'Abbas', 'i212503@nu.edu.pk', 'pass456', 2),
(3, 'Michael', 'Johnson', 'michaeljohnson@example.com', 'securepass', 3),
(4, 'Emily', 'Brown', 'emilybrown@example.com', 'abc123', 4),
(5, 'David', 'Davis', 'daviddavis@example.com', 'qwerty123', 5);

INSERT INTO userInfo (InfoID, DOB, Gender, FatherName, GuardianName, ContactNo, Cnic, Nationality, PersonalEmail, Address, City, Country) VALUES 
(1, '1990-05-15', 'Male', 'John Doe Sr.', 'John Doe Sr.', '+1234567890', '12345-6789012-3', 'American', 'johndoe_personal@example.com', '123 Main Street', 'New York', 'United States'),
(2, '1992-09-22', 'Female', 'Robert Smith', 'Robert Smith', '+0987654321', '98765-4321098-7', 'British', 'janesmith_personal@example.com', '456 Park Avenue', 'London', 'United Kingdom'),
(3, '1985-12-10', 'Male', 'Michael Johnson Sr.', 'Michael Johnson Sr.', '+9876543210', '87654-3210987-1', 'American', 'michaeljohnson_personal@example.com', '789 Elm Street', 'Chicago', 'United States'),
(4, '1994-07-08', 'Female', 'David Brown Sr.', 'David Brown Sr.', '+7418529630', '76543-2109876-5', 'American', 'emilybrown_personal@example.com', '321 Oak Avenue', 'San Francisco', 'United States'),
(5, '1991-03-20', 'Male', 'Daniel Davis Sr.', 'Daniel Davis Sr.', '+3698521470', '65432-1098765-4', 'British', 'daviddavis_personal@example.com', '654 Pine Street', 'London', 'United Kingdom');

INSERT INTO Roles (RoleID, Role) VALUES
(1, 'Student'),
(2, 'Faculty'),
(3, 'Admin');

INSERT INTO UserRoles (UserID, RoleID) VALUES 
(1, 1),
(2, 2),
(3, 2),
(4, 1),
(5, 3);


INSERT INTO Academics (AcademicsId, UserID, Position) VALUES
(1, 1, 'Assistant Professor');

INSERT INTO Semesters (SemesterID, SemesterName, StartDate, EndDate) VALUES 
(1, 'Fall 2021', '2021-09-01', '2021-12-31'),
(2, 'Spring 2022', '2022-01-01', '2022-04-30'),
(3, 'Summer 2022', '2022-05-01', '2022-08-31'),
(4, 'Fall 2022', '2022-09-01', '2022-12-31'),
(5, 'Spring 2023', '2023-01-01', '2023-04-30');

INSERT INTO Students (StudentID, RollNo, UserID, AdmissionDate, DegreeID) VALUES 
(1, '21I-2503', 2, '2021-09-01', 1),
(2, '22I-0578', 3, '2021-09-01', 2);

insert into StudentSemester (SemesterID, StudentID) VALUES 
(1, 1),
(1, 2);

INSERT INTO Faculty (FacultyID, UserID, Position) VALUES
(1, 4, 'Assistant Professor'),
(2, 5, 'Associate Professor');

INSERT INTO Sections (SectionID, SectionName, DegreeId, CAPACITY, AvailableSeats) VALUES
(1, 'A', 1, 30, 30),
(2, 'B', 1, 30, 20),
(3, 'A', 2, 25, 25),
(4, 'A', 3, 40, 40),
(5, 'B', 3, 40, 30);

INSERT INTO UserSections (SectionID, UserID) VALUES 
(1, 2),
(1, 3);

INSERT INTO Courses (CourseID, CourseCode, CourseName, CreditHours, SemesterID, Year, CourseType) VALUES
(1, 'CS101', 'Introduction to Computer Science', 3, 1, 2021, 'Core'),
(2, 'MATH201', 'Calculus I', 4, 1, 2021, 'Core'),
(3, 'CS201', 'Data Structures', 3, 2, 2022, 'Core'),
(4, 'CS301', 'Database Management Systems', 3, 3, 2022, 'Core'),
(5, 'CS401', 'Artificial Intelligence', 3, 4, 2023, 'Elective');

insert into TakenBy (CourseID, UserID) Values
(1, 2),
(2, 2),
(3, 2),
(1, 4),
(1, 5),
(2, 4),
(3, 4),
(3, 5);

INSERT INTO Prerequisites (CourseID, PreqID) VALUES
(3, 1),
(4, 3),
(5, 3),
(5, 4),
(5, 2);

INSERT INTO OfferedForDegree (CourseID, DegreeID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 4),
(1, 5),
(2, 5),
(3, 1),
(4, 2),
(5, 5);

INSERT INTO Attendance (AttendanceID, StudentID, CourseID, LectureNo, AttendanceDate, Duration, Presence) VALUES 
(1, 1, 1, 1, '2023-01-01', 1.5, 'P'),
(2, 1, 1, 2, '2023-01-08', 1.5, 'P'),
(3, 1, 2, 3, '2023-01-02', 1.5, 'P'),
(4, 1, 2, 4, '2023-01-09', 1.5, 'A'),
(5, 1, 3, 5, '2023-01-03', 1.5, 'P'),
(6, 1, 3, 6, '2023-01-10', 1.5, 'P'),
(7, 1, 4, 7, '2023-01-04', 1.5, 'P'),
(8, 1, 4, 8, '2023-01-11', 1.5, 'P'),
(9, 1, 5, 9, '2023-01-05', 1.5, 'A'),
(10, 2, 5, 1, '2023-01-12', 1.5, 'P'),
(11, 2, 1, 2, '2023-01-01', 1.5, 'P'),
(12, 2, 1, 3, '2023-01-08', 1.5, 'P'),
(13, 2, 2, 4, '2023-01-02', 1.5, 'P'),
(14, 2, 2, 5, '2023-01-09', 1.5, 'A'),
(15, 2, 3, 6, '2023-01-03', 1.5, 'P'),
(16, 2, 3, 7, '2023-01-10', 1.5, 'P'),
(17, 2, 4, 8, '2023-01-11', 1.5, 'P'),
(18, 2, 4, 9, '2023-01-12', 1.5, 'P'),
(19, 2, 5, 10, '2023-02-09', 1.5, 'P'),
(20, 2, 5, 11, '2023-02-10', 1.5, 'A');

INSERT INTO Assessments (AssessmentID, AssessmentNo, CourseID, StudentID, AssessmentType, TotalMarks, Marks) VALUES 
(1, 1, 1, 1, 'Assignment', 50, 45),
(2, 2, 1, 1, 'Quiz', 20, 18),
(3, 1, 2, 1, 'Assignment', 50, 42),
(4, 2, 2, 2, 'Quiz', 20, 19),
(5, 1, 3, 2, 'Assignment', 50, 48),
(6, 2, 3, 2, 'Quiz', 20, 18);

INSERT INTO WeightageDistribution (CourseID, AssignmentW, QuizW, Sessional1W, Sessional2W, ProjectW, FinalW) VALUES
(1, 30, 20, 20, 5, 5, 20),
(2, 25, 15, 30, 5, 5, 20),
(3, 30, 20, 20, 5, 5, 20);

INSERT INTO Transcript (TranscriptID, StudentID, SemesterID, SemesterGPA) VALUES
(1, 1, 1, 3.75),
(2, 1, 1, 3.6),
(3, 1, 2, 3.9),
(4, 2, 2, 3.8),
(5, 2, 3, 3.7);

INSERT INTO TranscriptDetails (TranscriptID, CourseID, Grade) VALUES
(1, 1, 'A'),
(1, 2, 'A-'),
(1, 3, 'B+'),
(2, 1, 'A'),
(2, 2, 'B'),
(2, 3, 'B+'),
(3, 4, 'A+'),
(3, 5, 'A'),
(4, 4, 'A'),
(4, 5, 'A-'),
(5, 1, 'B+');
