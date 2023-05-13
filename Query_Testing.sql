USE MASTER;
use FLEXDB;

select * from users;
select * from Students;

select concat(firstname, ' ' ,lastname) as name, nuemail from students stud
join users usr on usr.userid = stud.userid
where stud.rollno = '21I-6512'