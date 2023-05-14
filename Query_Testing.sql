USE MASTER;
use FLEXDB;

select * from users;
select * from Students;

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

select * from users u
join Students s on s.UserID = u.UserID
join UserSections us on us.UserID = u.UserID
join Sections se on se.SectionID = us.SectionID
join Degree d on s.DegreeID = d.DegreeID
left join UserCourses uc on uc.UserID = u.UserID
where s.RollNo = '23F-1010';

select * from UserSections

DELETE FROM users WHERE UserId = '16'
DELETE FROM UserSections WHERE SectionID = '1'

INSERT INTO Users (UserId, FirstName, LastName, NUemail, Password, CampusID) VALUES ('16', 'Ali', 'Abbas', 'i212503@nu.edu.pk', 'abc', '1')
INSERT INTO  UserInfo(InfoId, UserId, DOB, Gender, ContactNo, Cnic, Nationality, PersonalEmail, Address, City, Country, FatherName, GuardianName) VALUES ('16', '16', '1-1-2021', 'Male', '12345', '11111-1111111-1', 'pak', 'an@g.com', 'GIL', 'ISL', 'Pak', 'A', 'A')
INSERT INTO Students (RollNo, AdmissionDate, DegreeID, UserID, Semester) VALUES ('21I-2503', '1-1-2021', '1', '1', '1')
Insert into UserSections(SectionID, UserID) values ('1', '16');



