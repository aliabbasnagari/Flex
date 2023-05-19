USE MASTER;
use FLEXDB;


select concat(firstname, ' ' ,lastname) as name, nuemail from students stud
join users usr on usr.userid = stud.userid
where stud.rollno = '21I-6512'

select * from CampusDegree cd
join Degree d on d.DegreeID = cd.DegreeID
where cd.campusid = 5

select CampusID, CampusName from Campus;

select * from Sections s
where s.AvailableSeats != 0;

select count(*) + 1 as 'NewRoll' from Students;

select d.DegreeCode, d.DegreeID from CampusDegree cd join Degree d on d.DegreeID = cd.DegreeID where cd.CampusID = 1

select * from students s where s.RollNo = '23I-1009';
select * from usersections;
select * from userinfo;
select * from users;
select * from Students;
select * from Degree;
select * from Attendance

select * from users u
join Students s on s.UserID = u.UserID
join UserSections us on us.UserID = u.UserID
join Sections se on se.SectionID = us.SectionID
join Degree d on s.DegreeID = d.DegreeID
left join UserCourses uc on uc.UserID = u.UserID
where s.RollNo = '23F-1010';


SELECT * FROM Students ST
JOIN Attendance ATT ON ATT.UserID = ST.UserID
WHERE SC.SectionID = 3 AND TB.CourseID = 2 and Att.Attendancedate = '2023-05-17'

select * from UserSections

DELETE FROM users WHERE UserId = '16'
DELETE FROM UserSections WHERE SectionID = '1'

INSERT INTO Users (UserId, FirstName, LastName, NUemail, Password, CampusID) VALUES ('16', 'Ali', 'Abbas', 'i212503@nu.edu.pk', 'abc', '1')
INSERT INTO  UserInfo(InfoId, UserId, DOB, Gender, ContactNo, Cnic, Nationality, PersonalEmail, Address, City, Country, FatherName, GuardianName) VALUES ('16', '16', '1-1-2021', 'Male', '12345', '11111-1111111-1', 'pak', 'an@g.com', 'GIL', 'ISL', 'Pak', 'A', 'A')
INSERT INTO Students (RollNo, AdmissionDate, DegreeID, UserID, Semester) VALUES ('21I-2503', '1-1-2021', '1', '1', '1')
Insert into UserSections(SectionID, UserID) values ('1', '16');



select * from logs
select * from Transcript

select cs.coursecode, cs.coursename, cs.credithours, td.grade,  cs.coursetype from Transcript t
join TranscriptDetails td on td.TranscriptID = t.TranscriptID
join Students st on st.studentid = t.studentid
join Courses cs on cs.courseid = td.courseid
where st.rollno = '21I-2503'

select * from Attendance att
join TakenBy tb on tb.courseid = att.courseid and tb.userID = st.userid
join students st on att.studentid = st.studentid

select * from students st
join TakenBy tb on tb.userid = st.userid
JOIN Courses ccs on ccs.courseid = tb.courseid
join UserSections us on us.userid = st.userid
join Sections sc on sc.sectionid = us.sectionid
join Attendance att on att.studentid = st.studentid and att.courseid = tb.courseid

select * from Sections

JOIN OfferedForDegree OD ON OD.CourseID = TB.CourseID 
JOIN COurses ccs on ccs.courseid = od.courseid 
JOIN Sections SC ON SC.DegreeId = OD.DegreeID 

SELECT *
FROM Students ST
JOIN Users usr on usr.userid = st.userid 
JOIN TakenBy TB ON TB.UserID = ST.UserID 
JOIN OfferedForDegree OD ON OD.CourseID = TB.CourseID 
JOIN COurses ccs on ccs.courseid = od.courseid 
JOIN Sections SC ON SC.DegreeId = OD.DegreeID 
JOIN Attendance ATT ON ATT.studentid = ST.studentid 
WHERE SC.SectionID = @secid AND TB.CourseID = @cid and Att.Attendancedate = @date

SELECT ss.SemesterID, ss.SemesterName from semesters ss
join studentsemester sts on sts.semesterid = ss.semesterid 
join students st on st.studentid = sts.studentid 
where st.rollno = @roll

select * from Transcript t
join TranscriptDetails td on td.TranscriptID = t.TranscriptID
join Students st on st.studentid = t.studentid
join Courses cs on cs.courseid = td.courseid
where st.rollno = @roll

Select * from Faculty fc
join users usr on usr.userid = fc.userid
join userinfo ui on ui.infoid = fc.userid
join usersections usec on usec.userid = fc.userid
join takenby tb on tb.userid = fc.userid
join courses ccs on ccs.courseid = tb.courseid;