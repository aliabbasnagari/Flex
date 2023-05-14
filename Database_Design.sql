USE MASTER;
drop database FLEXDB;
create database FLEXDB;
use FLEXDB;

create table Campus
(
	CampusID INT PRIMARY KEY,
    CampusName VARCHAR(100) NOT NULL,
    CampusLocation VARCHAR(100) NOT NULL
)

create table Degree
(
	DegreeID INT PRIMARY KEY,
	DegreeCode VARCHAR(10) NOT NULL,
	Degree VARCHAR(50) NOT NULL,
	FieldOfStudy VARCHAR(50) NOT NULL
)

create table CampusDegree
(
	DegreeID INT NOT NULL,
	CampusID INT NOT NULL,
	PRIMARY KEY (DegreeID, CampusID),
    FOREIGN KEY(DegreeID) REFERENCES Degree(DegreeID) ON DELETE CASCADE,
	FOREIGN KEY(CampusID) REFERENCES Campus(CampusID) ON DELETE CASCADE
)
create table Users
(
    UserID INT PRIMARY KEY, --ARN
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    NUemail VARCHAR(100) NOT NULL UNIQUE,
    Password VARCHAR(100) NOT NULL,
	CampusId INT NOT NULL,
	FOREIGN KEY(CampusId) REFERENCES Campus(CampusId) ON DELETE CASCADE
)

create table userInfo
(
	InfoID INT PRIMARY KEY,
	DOB DATE NOT NULL,
	Gender VARCHAR(7) NOT NULL,
	FatherName VARCHAR(100),
	GuardianName VARCHAR(100),
	ContactNo VARCHAR(13) NOT NULL,
	Cnic VARCHAR(15) NOT NULL UNIQUE check (Cnic LIKE '[0-9][0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9][0-9][0-9][0-9]-[0-9]'),
	Nationality VARCHAR(50) NOT NULL,
	PersonalEmail VARCHAR(100),
	Address VARCHAR(200),
	City VARCHAR(50),
	Country VARCHAR(50),
	FOREIGN KEY(InfoID) REFERENCES Users(UserID) ON DELETE CASCADE
)

create table UserRoles
(
    UserID INT PRIMARY KEY,
    Role VARCHAR(50) NOT NULL,
    FOREIGN KEY(UserID) REFERENCES Users(UserID) ON DELETE CASCADE,
	CONSTRAINT CHECK_ROLE CHECK (Role IN ('Student', 'Faculty', 'Admin'))
)

create table Academics
(
    AcademicsId INT PRIMARY KEY,
    UserID INT,
	Position varchar(100),
    FOREIGN KEY(UserID) REFERENCES Users(UserID) ON DELETE CASCADE 
)

create table Students
(
	StudentID INT PRIMARY KEY,
    RollNo VARCHAR(10),
	UserID INT,
    AdmissionDate DATE NOT NULL,
    DegreeID INT NOT NULL,
	Semester INT NOT NULL check (Semester >= 1 AND Semester <= 8),
    FOREIGN KEY(UserID) REFERENCES Users(UserID) ON DELETE CASCADE,
    FOREIGN KEY(DegreeID) REFERENCES Degree(DegreeID) ON DELETE CASCADE
)

create table Faculty
(
    FacultyID INT PRIMARY KEY,
    UserID INT,
    FOREIGN KEY(UserID) REFERENCES Users(UserID) ON DELETE CASCADE
)

create table Courses
(
	CourseID INT PRIMARY KEY,
    CourseCode VARCHAR(10),
    CourseName VARCHAR(100) NOT NULL,
    CreditHours INT NOT NULL
)

create table FacultyCourses
(
	FcID INT PRIMARY KEY,
	FacultyID INT,
	CourseID INT,
	FOREIGN KEY(FacultyID) REFERENCES Faculty(FacultyID) ON DELETE CASCADE,
    FOREIGN KEY(CourseID) REFERENCES Courses(CourseID) ON DELETE CASCADE
)

create table Sections
(
	SectionID INT PRIMARY KEY,
    SectionName VARCHAR(10) NOT NULL,
    DegreeId INT NOT NULL,
	CAPACITY INT NOT NULL,
	AvailableSeats INT,
    FOREIGN KEY(DegreeId) REFERENCES Degree(DegreeId) ON DELETE CASCADE
)

create table Prerequisites
(
    CourseID INT,
    PreqID INT,
    PRIMARY KEY(CourseID, PreqID),
    FOREIGN KEY(CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY(PreqID) REFERENCES Courses(CourseID)
)

create table UserSections
(
    SectionID INT,
    UserID INT,
    PRIMARY KEY(SectionID, UserID),
    FOREIGN KEY(SectionID) REFERENCES Sections(SectionID) ON DELETE CASCADE,
    FOREIGN KEY(UserID) REFERENCES Users(UserID) ON DELETE CASCADE
)

create table CourseOfferings
(
    CourseId INT,
    Semester INT NOT NULL,
    Year INT NOT NULL,
    PRIMARY KEY(CourseId, Semester, Year),
    CourseType VARCHAR(10) NOT NULL,
	CONSTRAINT CHECK_COURSE_TYPE CHECK (CourseType IN ('Core', 'Elective')),
    FOREIGN KEY(CourseId) REFERENCES Courses(CourseId) ON DELETE CASCADE
)

create table UserCourses
(
    CourseId INT,
    UserID INT,
    Semester INT NOT NULL,
    PRIMARY KEY(CourseId, UserID),
    FOREIGN KEY(CourseId) REFERENCES Courses(CourseId) ON DELETE CASCADE,
    FOREIGN KEY(UserID) REFERENCES Users(UserID) ON DELETE CASCADE
)

create table Attendance
(
    AttendanceID INT PRIMARY KEY,
    UserID INT,
    CourseId INT,
    AttendanceDate DATE NOT NULL,
    Duration INT NOT NULL CHECK (Duration >= 0),
	Presence CHAR(1) NOT NULL,
    FOREIGN KEY(CourseId) REFERENCES Courses(CourseId) ON DELETE CASCADE,
    FOREIGN KEY(UserID) REFERENCES Users(UserID) ON DELETE CASCADE,
	CONSTRAINT CHECK_PRESENCE CHECK (PRESENCE IN ('P', 'A', 'L'))
)

create table Assessments
(
    AssessmentID INT PRIMARY KEY,
	AssessmentNo INT,
    CourseId INT,
    UserID INT,
    AssessmentType VARCHAR(50) NOT NULL,
	TotalMarks INT NOT NULL, 
    Marks INT CHECK (Marks >= 0),
    FOREIGN KEY(CourseId) REFERENCES Courses(CourseId) ON DELETE CASCADE,
    FOREIGN KEY(UserID) REFERENCES Users(UserID) ON DELETE CASCADE,
	CONSTRAINT CHECK_ASSESMENT_TYPE CHECK (AssessmentType IN ('Assignment', 'Quiz', 'SessionalExam', 'Project', 'FinalExam'))
)