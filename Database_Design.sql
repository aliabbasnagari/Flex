USE MASTER;
drop database if exists FLEXDB;
create database FLEXDB;
use FLEXDB;

create table Campus---
(
	CampusID INT PRIMARY KEY,
    CampusName VARCHAR(100) NOT NULL,
    CampusLocation VARCHAR(100) NOT NULL
);


create table Degree---
(
	DegreeID INT PRIMARY KEY,
	DegreeCode VARCHAR(10) NOT NULL,
	Degree VARCHAR(50) NOT NULL,
	FieldOfStudy VARCHAR(50) NOT NULL
);

create table CampusDegree---
(
	DegreeID INT NOT NULL,
	CampusID INT NOT NULL,
	PRIMARY KEY (DegreeID, CampusID),
    FOREIGN KEY(DegreeID) REFERENCES Degree(DegreeID) ON DELETE CASCADE,
	FOREIGN KEY(CampusID) REFERENCES Campus(CampusID) ON DELETE CASCADE
);

create table Semesters---
(
    SemesterID INT PRIMARY KEY,
    SemesterName VARCHAR(20) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL
);

create table Users---
(
    UserID INT PRIMARY KEY, --ARN
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    NUemail VARCHAR(100) NOT NULL UNIQUE,
    Password VARCHAR(100) NOT NULL,
	CampusID INT NOT NULL,
	FOREIGN KEY(CampusID) REFERENCES Campus(CampusID) ON DELETE CASCADE
);

create table userInfo---
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
);

create table Roles---
(
	RoleID INT PRIMARY KEY,
	Role VARCHAR(50)
	CONSTRAINT CHECK_ROLE CHECK (Role IN ('Student', 'Faculty', 'Admin'))
);

create table UserRoles---
(
    UserID INT,
    RoleID INT,
    FOREIGN KEY(UserID) REFERENCES Users(UserID) ON DELETE CASCADE,
	FOREIGN KEY(RoleID) REFERENCES Roles(RoleID) ON DELETE CASCADE,
);

create table Academics---
(
    AcademicsID INT PRIMARY KEY,
    UserID INT,
	Position varchar(100),
    FOREIGN KEY(UserID) REFERENCES Users(UserID) ON DELETE CASCADE 
);

create table Students---
(
	StudentID INT PRIMARY KEY,
    RollNo VARCHAR(10),
	UserID INT,
    AdmissionDate DATE NOT NULL,
    DegreeID INT NOT NULL,
    FOREIGN KEY(UserID) REFERENCES Users(UserID) ON DELETE CASCADE,
    FOREIGN KEY(DegreeID) REFERENCES Degree(DegreeID) ON DELETE CASCADE,
);

create table Faculty---
(
    FacultyID INT PRIMARY KEY,
    UserID INT,
	Position varchar(100),
    FOREIGN KEY(UserID) REFERENCES Users(UserID) ON DELETE CASCADE
);

create table Sections---
(
	SectionID INT PRIMARY KEY,
    SectionName VARCHAR(10) NOT NULL,
    DegreeID INT NOT NULL,
	CAPACITY INT NOT NULL,
	AvailableSeats INT,
    FOREIGN KEY(DegreeID) REFERENCES Degree(DegreeID) ON DELETE CASCADE
);

create table UserSections -- Only Faculty and Students
(
    SectionID INT,
    UserID INT,
    PRIMARY KEY(SectionID, UserID),
    FOREIGN KEY(SectionID) REFERENCES Sections(SectionID) ON DELETE CASCADE,
    FOREIGN KEY(UserID) REFERENCES Users(UserID) ON DELETE CASCADE
);

create table StudentSemester--
(
	SemesterID INT,
    StudentID INT,
    PRIMARY KEY(SemesterID, StudentID),
    FOREIGN KEY(SemesterID) REFERENCES Semesters(SemesterID) ON DELETE CASCADE,
    FOREIGN KEY(StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE
);

CREATE TABLE Courses---
(
    CourseID INT PRIMARY KEY,
    CourseCode VARCHAR(10),
    CourseName VARCHAR(100) NOT NULL,
    CreditHours INT NOT NULL,
    SemesterID INT NOT NULL,
    Year INT NOT NULL,
    CourseType VARCHAR(10) NOT NULL,
    CONSTRAINT CHECK_COURSE_TYPE CHECK (CourseType IN ('Core', 'Elective')),
    FOREIGN KEY(SemesterID) REFERENCES Semesters(SemesterID) ON DELETE CASCADE
);

create table Prerequisites---
(
    CourseID INT,
    PreqID INT,
    PRIMARY KEY(CourseID, PreqID),
    FOREIGN KEY(CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY(PreqID) REFERENCES Courses(CourseID)
);

create table OfferedForDegree---
(
	CourseID INT,
	DegreeID INT,
	Primary Key (CourseID, DegreeID),
	FOREIGN KEY(CourseID) REFERENCES Courses(CourseID) ON DELETE CASCADE,
	FOREIGN KEY(DegreeID) REFERENCES Degree(DegreeID) ON DELETE CASCADE
);

create Table TakenBy---
(
	CourseID INT,
	UserID INT,
	Primary Key (CourseID, UserID),
	FOREIGN KEY(CourseID) REFERENCES Courses(CourseID) ON DELETE CASCADE,
	FOREIGN KEY(UserID) REFERENCES Users(UserID) ON DELETE CASCADE
);

create Table CourseCoordinator---
(
	CourseID INT,
	FacultyID INT,
	Primary Key (CourseID, FacultyID),
	FOREIGN KEY(CourseID) REFERENCES Courses(CourseID) ON DELETE CASCADE,
	FOREIGN KEY(FacultyID) REFERENCES Faculty(FacultyID) ON DELETE CASCADE
);

create table Attendance
(
    AttendanceID INT PRIMARY KEY,
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
	LectureNo INT NOT NULL,
    AttendanceDate DATE NOT NULL,
    Duration DECIMAL(4,2) NOT NULL CHECK (Duration >= 0),
	Presence CHAR(1) NOT NULL,
    FOREIGN KEY(CourseID) REFERENCES Courses(CourseID) ON DELETE CASCADE,
    FOREIGN KEY(StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE,
	CONSTRAINT CHECK_PRESENCE CHECK (PRESENCE IN ('P', 'A', 'L', '-'))
);

create table Assessments---
(
    AssessmentID INT PRIMARY KEY,
	AssessmentNo INT,
    CourseID INT NOT NULL,
    StudentID INT,
    AssessmentType VARCHAR(50) NOT NULL,
	TotalMarks Decimal(6,2) NOT NULL, 
    Marks Decimal(6,2) CHECK (Marks >= 0),
    FOREIGN KEY(CourseID) REFERENCES Courses(CourseID) ON DELETE CASCADE,
    FOREIGN KEY(StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE,
	CONSTRAINT CHECK_ASSESMENT_TYPE CHECK (AssessmentType IN ('Assignment', 'Quiz', 'SessionalExam', 'Project', 'FinalExam'))
);

create Table WeightageDistribution---
(
	WDistID INT IDENTITY(1,1) Primary Key,
	CourseID INT UNIQUE NOT NULL,
	AssignmentW Decimal(4,2),
	QuizW Decimal(4,2),
	Sessional1W Decimal(4,2),
	Sessional2W Decimal(4,2),
	ProjectW Decimal(4,2),
	FinalW Decimal(4,2),
	FOREIGN KEY(CourseID) REFERENCES Courses(CourseID) ON DELETE CASCADE,
);

create table Transcript---
(
    TranscriptID INT PRIMARY KEY,
    StudentID INT,
    SemesterID INT,
    SemesterGPA DECIMAL(3,2),
    FOREIGN KEY(StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE,
    FOREIGN KEY(SemesterID) REFERENCES Semesters(SemesterID) ON DELETE CASCADE
);

create table TranscriptDetails---
(
    TranscriptID INT,
    CourseID INT,
    Grade VARCHAR(2) CHECK (Grade IN ('A+', 'A', 'A-', 'B+', 'B', 'B-', 'C+', 'C', 'C-', 'D+', 'D', 'F')),
    PRIMARY KEY(TranscriptID, CourseID),
    FOREIGN KEY(TranscriptID) REFERENCES Transcript(TranscriptID),
    FOREIGN KEY(CourseID) REFERENCES Courses(CourseID) ON DELETE CASCADE
);

create Table LOGS
(
	LogID INT IDENTITY(1,1) Primary key,
	Operation Varchar(100),
	UserID INT,
	OpDate Date,
	UserType varchar(50),
	FOREIGN KEY(UserID) REFERENCES Users(UserID)
);

create table Feedback
(
	FeedbackID INT IDENTITY(1,1) Primary KEY,
	FacultyID INT,
	StudentID INT,
	Comment varchar(200),
	FdPercent DECIMAL(4,2),
	FOREIGN KEY(FacultyID) REFERENCES Faculty(FacultyID),
	FOREIGN KEY(StudentID) REFERENCES Students(StudentID)
);

select * from users

select * from Students

select * from Transcript

select * from LOGS