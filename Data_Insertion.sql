USE MASTER;
use FLEXDB;

INSERT INTO Campus (CampusID, CampusName, CampusLocation) VALUES 
(1, 'Islamabad Campus', 'Islamabad'),
(2, 'Karachi Campus', 'Karachi'),
(3, 'Faisalabad Campus', 'Faisalabad'),
(4, 'Lahore Campus', 'Lahore'),
(5, 'Peshawar Campus', 'Peshawar');

INSERT INTO Departments(DepartmentName) VALUES
('Computer Sciences'),
('Electrical Engineering'),
('Business Administration');

INSERT INTO Degree(DegreeCode, Degree, FieldOfStudy, DepartmentId) VALUES
('BS(CS)', 'Bachelors', 'Computer Sciences', 1),
('BS(SE)', 'Bachelors', 'Software Engineering', 1),
('BS(AI)', 'Bachelors', 'Artificial Intelligence', 1),
('BS(DS)', 'Bachelors', 'Data Sciences', 1),
('BS(CY)', 'Bachelors', 'Cyber Security', 1),
('BS(EE)', 'Bachelors', 'Electrical Engineering', 2),
('BBA',    'Bachelors', 'Business Administration', 3),
('MS(CS)', 'Bachelors', 'Computer Sciences', 1),
('MS(SE)', 'Bachelors', 'Software Engineering', 1),
('MS(AI)', 'Bachelors', 'Artificial Intelligence', 1),
('MS(DS)', 'Bachelors', 'Data Sciences', 1),
('MS(CY)', 'Bachelors', 'Cyber Security', 1);

INSERT INTO CampusDepartments(CdNO, DepartmentID, CampusID) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 1, 1),
(5, 2, 1),
(6, 3, 1),
(7, 1, 1),
(8, 2, 2),
(9, 3, 2),
(10, 3, 2),
(11, 2, 2),
(12, 1, 2),
(13, 1, 2),
(14, 2, 2),
(15, 3, 3),
(16, 1, 3),
(17, 1, 3),
(18, 2, 3),
(19, 3, 3),
(20, 1, 3),
(21, 1, 4),
(22, 2, 4),
(23, 3, 4),
(24, 1, 4),
(25, 2, 4),
(26, 3, 4),
(27, 1, 4),
(28, 2, 5),
(29, 3, 5),
(30, 3, 5),
(31, 1, 5),
(32, 2, 5);

INSERT INTO Users (FirstName, LastName, DOB, NUemail, Password, CampusID, Gender, ContactNo, Cnic, Nationality, PersonalEmail, Address, HomeContact, PostalCode, City, Country) VALUES
('Raza', 'Ahmed', '1997-01-01', 'raza.ahmed@nu.edu.pk', 'pass123', 1, 'Male', '0333-1234567', '12345-6789123-1', 'Pakistani', 'raza.ahmed@gmail.com', '123 Main Street', '021-12345678', '74500', 'Karachi', 'Pakistan'),
('Mohsin', 'Naqvi', '1998-05-05', 'mohsin.naqvi@nu.edu.pk', 'pass456', 1, 'Male', '0333-2345678', '23456-7891234-2', 'Pakistani', 'mohsin.naqvi@gmail.com', '456 Second Street', '021-23456789', '74500', 'Karachi', 'Pakistan'),
('Salar', 'Murtaza', '1995-07-10', 'salar.murtaza@nu.edu.pk', 'pass789', 2, 'Male', '0333-3456789', '34567-8912345-3', 'Pakistani', 'salar.murtaza@gmail.com', '789 Third Street', '021-34567890', '44000', 'Islamabad', 'Pakistan'),
('Sarah', 'Johnson', '1996-09-15', 'sarah.johnson@nu.edu.pk', 'pass101', 3, 'Female', '0333-4567890', '45678-9123456-4', 'American', 'sarah.johnson@gmail.com', '101 Fourth Street', '021-45678901', '10005', 'New York', 'USA'),
('Ahmed', 'Ali', '1999-02-28', 'ahmed.ali@nu.edu.pk', 'pass111', 4, 'Male', '0333-5678901', '56789-1234567-5', 'Pakistani', 'ahmed.ali@gmail.com', '123 Fifth Street', '021-56789012', '44000', 'Islamabad', 'Pakistan'),
('Fatima', 'Raza', '1997-03-20', 'fatima.raza@nu.edu.pk', 'pass222', 5, 'Female', '0333-6789012', '67890-2345678-6', 'Pakistani', 'fatima.raza@gmail.com', '456 Sixth Street', '021-67890123', '74000', 'Lahore', 'Pakistan'),
('Muhammad', 'Ibrahim', '1998-11-11', 'muhammad.ibrahim@nu.edu.pk', 'pass333', 1, 'Male', '+923451234567', '12345-6789012-3', 'Pakistani', 'muhammad.ibrahim@gmail.com', '123 Main Street', '+923451234568', '44000', 'Lahore', 'Pakistan'),
('Sana', 'Khan', '1996-06-07', 'sana.khan@nu.edu.pk', 'pass444', 2, 'Female', '+923458765432', '12345-6789012-4', 'Pakistani', 'sana.khan@hotmail.com', '456 Market Street', '+923458765431', '44000', 'Lahore', 'Pakistan'),
('Ali', 'Hussain', '1995-09-28', 'ali.hussain@nu.edu.pk', 'pass555', 3, 'Male', '+923451234567', '12345-6789012-5', 'Pakistani', 'ali.hussain@yahoo.com', '789 Park Avenue', '+923451234567', '46000', 'Islamabad', 'Pakistan'),
('Nimra', 'Ahmed', '1997-12-31', 'nimra.ahmed@nu.edu.pk', 'pass666', 4, 'Female', '+923458765432', '12345-6789012-6', 'Pakistani', 'nimra.ahmed@gmail.com', '1234 South Avenue', '+923458765431', '46000', 'Islamabad', 'Pakistan'),
('Alex', 'Johnson', '1994-04-21', 'alex.johnson@nu.edu.pk', 'pass777', 5, 'Male', '+923451234567', '12345-6789012-7', 'American', 'alex.johnson@yahoo.com', '4567 North Street', '+923451234567', '47000', 'New York', 'USA'),
('Emma', 'Garcia', '1993-08-12', 'emma.garcia@nu.edu.pk', 'pass888', 1, 'Female', '+923458765432', '12345-6789012-8', 'Mexican', 'emma.garcia@hotmail.com', '890 East Street', '+923458765431', '48000', 'Mexico City', 'Mexico'),
('Daniel', 'Anderson', '1996-06-20', 'daniel.anderson@nu.edu.pk', 'pass999', 2, 'Male', '+923451234567', '12345-6789012-9', 'Canadian', 'daniel.anderson@gmail.com', '3456 West Avenue', '+923451234567', '49000', 'Toronto', 'Canada'),
('Emily', 'Davis', '1998-07-14', 'emily.davis@nu.edu.pk', 'pass1234', 3, 'Female', '+923458765432', '12345-6789012-0', 'Australian', 'emily.davis@yahoo.com', '7890 East Street', '+923458765431', '50000', 'Sydney', 'Australia'),
('Ethan', 'Rodriguez', '1997-09-28', 'ethan.rodriguez@nu.edu.pk', 'pass567', 4, 'Male', '0333-9876543', '12345-6789012-3', 'Pakistani', 'ethan.rodriguez@gmail.com', '123 Main Street', '042-7654321', '54000', 'Lahore', 'Pakistan');

-- Academics Table
INSERT INTO Academics(AcademicsId, UserID, Position) VALUES 
(1, 13, 'Accountant'),
(2, 14, 'Finance'),
(3, 15, 'Admissions');

-- Students Table
INSERT INTO Students (RollNo, AdmissionDate, DegreeID, UserID, Semester) VALUES
('18I-1502', '2021-09-01', 1, 1, 1),
('18I-2514', '2022-01-15', 2, 2, 1),
('18I-3506', '2022-08-10', 3, 3, 1),
('19I-4518', '2021-09-01', 7, 4, 1),
('20I-5510', '2022-03-01', 8, 5, 1),
('21I-6512', '2021-09-01', 4, 6, 1),
('21I-7514', '2022-01-15', 5, 7, 1),
('21I-8516', '2022-08-10', 1, 8, 1);

-- Faculty Table
INSERT INTO Faculty (FacultyID, DepartmentID, UserID) VALUES
(1, 1, 9),
(2, 2, 10),
(3, 3, 12),
(4, 1, 12);

INSERT INTO Courses (CourseCode, CourseName, CreditHours) 
VALUES 
('CS101', 'Introduction to Computer Science', 3),
('CS201', 'Data Structures and Algorithms', 4),
('CS301', 'Operating Systems', 4),
('CS401', 'Artificial Intelligence', 3),
('CS402', 'Machine Learning', 3),
('EE101', 'Introduction to Electrical Engineering', 3),
('EE201', 'Circuit Analysis and Design', 4),
('EE301', 'Digital Signal Processing', 4),
('EE401', 'Power Systems', 3),
('EE402', 'Control Systems', 3);

INSERT INTO Sections (SectionID, SectionName, DepartmentID, CAPACITY, AvailableSeats) VALUES
(1, 'A', 1, 50, 50),
(2, 'B', 1, 40, 40),
(3, 'C', 2, 30, 30),
(4, 'D', 2, 35, 35);

INSERT INTO Prerequisites (CourseCode, PrerequisiteCode) VALUES 
('CS301', 'CS101'),
('CS201', 'CS101'),
('CS402', 'CS201'),
('EE301', 'EE101'),
('EE402', 'EE401');

INSERT INTO CourseFaculty (CourseCode, FacultyID) VALUES
('CS101', 1),
('CS201', 2),
('CS301', 3),
('CS401', 4),
('CS402', 1),
('EE101', 2),
('EE201', 3),
('EE301', 4),
('EE401', 1),
('EE402', 2);

INSERT INTO CourseOfferings (CourseCode, Semester, Year, CourseType) VALUES 
('CS101', 1, 2018, 'Core'),
('CS301', 1, 2019, 'Core'),
('CS201', 2, 2020, 'Core'),
('CS401', 2, 2021, 'Core'),
('CS402', 1, 2022, 'Core'),
('EE101', 2, 2022, 'Core'),
('EE201', 1, 2022, 'Elective'),
('EE301', 2, 2022, 'Elective'),
('EE401', 1, 2022, 'Elective'),
('EE402', 2, 2022, 'Elective');

INSERT INTO UserCourses (UserID, CourseCode , Semester) VALUES
(1, 'CS101', 1),
(2, 'CS301', 1),
(4, 'CS201', 1),
(4, 'CS401', 1),
(5, 'CS402', 1),
(6, 'EE101', 1),
(7, 'EE201', 1),
(8, 'EE301', 1),
(9, 'EE401', 1),
(10, 'EE402', 1),
(11, 'CS101', 1),
(12, 'CS301', 1),
(13, 'CS201', 1),
(14, 'CS401', 1),
(15, 'CS402', 1);

INSERT INTO Attendance (AttendanceID, UserID, CourseCode, AttendanceDate, Duration, Presence) VALUES 
(1, 1, 'CS101', '2023-05-01', 1.5, 'P'),
(2, 1, 'CS101', '2023-05-02', 1.5, 'P'),
(3, 1, 'CS101', '2023-05-03', 1.5, 'P'),
(4, 1, 'CS101', '2023-05-04', 1.5, 'P'),
(5, 1, 'CS101', '2023-05-05', 1.5, 'A'),
(6, 1, 'CS101', '2023-05-06', 1.5, 'P'),
(7, 1, 'CS101', '2023-05-07', 1.5, 'P'),
(8, 1, 'CS101', '2023-05-08', 1.5, 'P'),
(9, 1, 'CS101', '2023-05-09', 1.5, 'L'),
(10, 2, 'CS101', '2023-05-01', 1.5, 'P'),
(11, 3, 'CS101', '2023-05-01', 1.5, 'A'),
(12, 4, 'CS101', '2023-05-01', 1.5, 'P'),
(13, 5, 'CS201', '2023-05-01', 1.5, 'L'),
(14, 6, 'CS201', '2023-05-01', 1.5, 'P'),
(15, 7, 'CS201', '2023-05-01', 1.5, 'L'),
(16, 8, 'CS201', '2023-05-01', 1.5, 'P');

INSERT INTO Assessments (AssessmentID, AssessmentNo, CourseCode, UserID, AssessmentType, TotalMarks, Marks) VALUES 
(1, 1, 'CS101', 1, 'Assignment', 50, 40),
(2, 1, 'CS101', 1, 'Quiz', 20, 18),
(3, 1, 'CS101', 1, 'SessionalExam', 100, 75),
(4, 1, 'CS101', 1, 'Project', 200, 160),
(5, 1, 'CS101', 1, 'FinalExam', 150, 135),
(6, 2, 'CS201', 1, 'Assignment', 50, 45),
(7, 2, 'CS201', 1, 'Quiz', 20, 20),
(8, 2, 'CS201', 1, 'SessionalExam', 100, 80);