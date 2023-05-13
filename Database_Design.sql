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

create table Departments
(
    DepartmentID INT IDENTITY(1,1) PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL,
)

create table Degree
(
	DegreeID INT IDENTITY(1,1) PRIMARY KEY,
	DegreeCode VARCHAR(10) NOT NULL,
	Degree VARCHAR(50) NOT NULL,
	FieldOfStudy VARCHAR(50) NOT NULL,
	DepartmentId INT,
	FOREIGN KEY(DepartmentID) REFERENCES Departments(DepartmentID)
)

create table CampusDepartments
(
	CdNO INT PRIMARY KEY,
	DepartmentID INT NOT NULL,
	CampusID INT NOT NULL,
    FOREIGN KEY(DepartmentID) REFERENCES Departments(DepartmentID),
	FOREIGN KEY(CampusID) REFERENCES Campus(CampusID)
)


create table Users
(
    UserID INT IDENTITY(1,1) PRIMARY KEY, --ARN
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DOB DATE NOT NULL,
    NUemail VARCHAR(100) NOT NULL UNIQUE,
    Password VARCHAR(100) NOT NULL,
	CampusId INT NOT NULL,
	Gender VARCHAR(7) NOT NULL,
	ContactNo VARCHAR(13) NOT NULL,
	Cnic VARCHAR(15) NOT NULL check (Cnic LIKE '[0-9][0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9][0-9][0-9][0-9]-[0-9]'),
	Nationality VARCHAR(50) NOT NULL,
	PersonalEmail VARCHAR(100),
	Address VARCHAR(200),
	HomeContact VARCHAR(13),
	PostalCode VARCHAR(10),
	City VARCHAR(50),
	Country VARCHAR(50)
	FOREIGN KEY(CampusId) REFERENCES Campus(CampusId)
)

create table UserRoles
(
    UserID INT,
    Role VARCHAR(50) NOT NULL,
    PRIMARY KEY(UserID),
    FOREIGN KEY(UserID) REFERENCES Users(UserID),
	CONSTRAINT CHECK_ROLE CHECK (Role IN ('Student', 'Faculty', 'Admin'))
)

create table Academics
(
    AcademicsId INT PRIMARY KEY,
    UserID INT,
	Position varchar(100),
    FOREIGN KEY(UserID) REFERENCES Users(UserID)
)

create table Students
(
    RollNo VARCHAR(10) PRIMARY KEY,
	UserID INT,
    AdmissionDate DATE NOT NULL,
    DegreeID INT NOT NULL,
	Semester INT NOT NULL check (Semester >= 1 AND Semester <= 8),
    FOREIGN KEY(UserID) REFERENCES Users(UserID),
    FOREIGN KEY(DegreeID) REFERENCES Degree(DegreeID)
)

create table Faculty
(
    FacultyID INT PRIMARY KEY,
    DepartmentID INT NOT NULL,
    UserID INT,
    FOREIGN KEY(UserID) REFERENCES Users(UserID),
    FOREIGN KEY(DepartmentID) REFERENCES Departments(DepartmentID)
)

create table Courses
(
    CourseCode VARCHAR(10) PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    CreditHours INT NOT NULL
)

create table Sections
(
    SectionID INT PRIMARY KEY,
    SectionName VARCHAR(10) NOT NULL,
    DepartmentID INT NOT NULL,
	CAPACITY INT NOT NULL,
	AvailableSeats INT,
    FOREIGN KEY(DepartmentID) REFERENCES Departments(DepartmentID),
)

create table CourseSections
(
    CourseCode VARCHAR(10),
    SectionID INT,
    PRIMARY KEY(CourseCode, SectionID),
    FOREIGN KEY(CourseCode) REFERENCES Courses(CourseCode),
    FOREIGN KEY(SectionID) REFERENCES Sections(SectionID)
)

create table Prerequisites
(
    CourseCode VARCHAR(10),
    PrerequisiteCode VARCHAR(10),
    PRIMARY KEY(CourseCode, PrerequisiteCode),
    FOREIGN KEY(CourseCode) REFERENCES Courses(CourseCode),
    FOREIGN KEY(PrerequisiteCode) REFERENCES Courses(CourseCode)
)

create table CourseFaculty
(
    CourseCode VARCHAR(10),
    FacultyID INT,
    PRIMARY KEY(CourseCode, FacultyID),
    FOREIGN KEY(CourseCode) REFERENCES Courses(CourseCode),
    FOREIGN KEY(FacultyID) REFERENCES Faculty(FacultyID)
)

create table UserSections
(
    SectionID INT,
    UserID INT,
    PRIMARY KEY(SectionID, UserID),
    FOREIGN KEY(SectionID) REFERENCES Sections(SectionID),
    FOREIGN KEY(UserID) REFERENCES Users(UserID)
)

create table CourseOfferings
(
    CourseCode VARCHAR(10),
    Semester INT NOT NULL,
    Year INT NOT NULL,
    PRIMARY KEY(CourseCode, Semester, Year),
    CourseType VARCHAR(10) NOT NULL,
	CONSTRAINT CHECK_COURSE_TYPE CHECK (CourseType IN ('Core', 'Elective')),
    FOREIGN KEY(CourseCode) REFERENCES Courses(CourseCode)
)

create table UserCourses
(
    CourseCode VARCHAR(10),
    UserID INT,
    Semester INT NOT NULL,
    PRIMARY KEY(CourseCode, UserID),
    FOREIGN KEY(CourseCode) REFERENCES Courses(CourseCode),
    FOREIGN KEY(UserID) REFERENCES Users(UserID)
)

create table Attendance
(
    AttendanceID INT PRIMARY KEY,
    UserID INT,
    CourseCode VARCHAR(10),
    AttendanceDate DATE NOT NULL,
    Duration INT NOT NULL CHECK (Duration >= 0),
	Presence CHAR(1) NOT NULL,
    FOREIGN KEY(CourseCode) REFERENCES Courses(CourseCode),
    FOREIGN KEY(UserID) REFERENCES Users(UserID),
	CONSTRAINT CHECK_PRESENCE CHECK (PRESENCE IN ('P', 'A', 'L'))
)

create table Assessments
(
    AssessmentID INT PRIMARY KEY,
	AssessmentNo INT,
    CourseCode VARCHAR(10),
    UserID INT,
    AssessmentType VARCHAR(50) NOT NULL,
	TotalMarks INT NOT NULL, 
    Marks INT CHECK (Marks >= 0),
    FOREIGN KEY(CourseCode) REFERENCES Courses(CourseCode),
    FOREIGN KEY(UserID) REFERENCES Users(UserID),
	CONSTRAINT CHECK_ASSESMENT_TYPE CHECK (AssessmentType IN ('Assignment', 'Quiz', 'SessionalExam', 'Project', 'FinalExam'))
)
