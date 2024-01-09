create database collegenew;
use collegenew;

create table student(
rollno int primary key,
name varchar(20),
marks int not null,
grade varchar(10),
city varchar(20)
);

insert into student values(101,'Aditya',82,'A','Nashik'),(102,'Om',86,'A','Nashik'),(103,'Omkar',92,'A','Nashik');
insert into student values(104,'Ritesh',78,'Pune'),(105,'Yash',72,'Mumbai'),(106,'Akash',76,'Pune');

select * from student;
select name,marks from student;
select distinct city from student;

select * from student where marks>80;
select * from student where marks+20>100;
select * from student where marks=72;
select * from student where marks>80 AND city="Nashik";
select * from student where marks>85 OR city="Nashik";
select * from student where marks between 80 AND 100;
select * from student where city in('Nashik','Pune');
select * from student where city not in('Nashik','Pune');
select * from student where marks>80 limit 2;
select * from student order by city asc;
select * from student order by marks desc limit 3;

select max(marks) from student;

select city,rollno, count(name)
from student
group by city, rollno;

select city, avg(marks)
from student
group by city;

select city, avg(marks)
from student
group by city
order by avg(marks);

select grade, count(rollno)
from student
group by grade
order by grade;

select city, count(rollno)
from student
group by city
having max(marks)>80;

select city
from student
where grade='A'
group by city
having max(marks)>=75
order by city asc; 

set sql_safe_updates = 0;

update student
set grade ='O'
where grade = 'A';
select * from student;

update student 
set marks=89
where marks=76;

update student
set marks = marks+1;

delete from student
where marks<70;

create table dept(
id int primary key,
name varchar(20)
);

insert into dept values(101,'englist'),(102,'IT');
select * from dept;

update dept
set id = 103
where id = 102;

create table teacher(
id int primary key,
name varchar(20),
dept_id int,
foreign key(dept_id) references dept(id)
on update cascade
on delete cascade
);   

drop table teacher;

insert into teacher values(101,'adom',101),(102,'eve',102);
select * from teacher;

alter table student 
add column age int;
select * from student;

alter table student 
drop column age;

alter table student 
add column age int not null default 19 ;

alter table student 
modify column age varchar(2);

insert into student (rollno,name,marks,stud_age) values(107,'atul',81,20);

alter table student
change age stud_age int;

alter table student 
drop column stud_age;
select * from student;
alter table stud
rename to student;

truncate table student;

alter table student                         
change name full_name varchar(20);

delete from student
where marks<80;

alter table student
drop column grade;

use college;
select*from student;

create table course(id int primary key, course varchar(20));
insert into course values(2,'english'),
(3,'math'),(4,'science'),(5,'CS');
select*from course;

select*from student
inner join course
on student.id=course.id;

select*from student as s
inner join course as c
on s.id=c.id;

select*from student
left join course
on student.id=course.id;

select*from student
right join course
on student.id=course.id;

select*from student
left join course
on student.id=course.id
union
select*from student
right join course
on student.id=course.id;

select*from student as s
left join course as c
on s.id=c.id
where c.id is null;

select*from student as s
right join course as c
on s.id=c.id
where s.id is null;

select*from student as s
left join course as c
on s.id=c.id
union
select*from student as s
right join course as c
on s.id=c.id
where s.id and c.id is null ; 

create table employee(
id int primary key,
name varchar(20),
manager_id int);
insert into employee values(101,'adam',103),(102,'bob',104),(103,'casey',null),(104,'donald',103);
select*from employee;

select a.name as manager_name, b.name
from employee as a
join employee as b
on a.id=b.manager_id;

select name from employee
union 
select name from employee;

select name from employee
union all 
select name from employee;

select * from student;

select avg(marks)
from student;

select full_name, marks 
from student
where marks>86.6667;

select full_name, marks 
from student
where marks > (select avg(marks) from student);

select rollno from student 
where rollno % 2 = 0;

select full_name, rollno from student
where rollno in(102,104,106);

select full_name, rollno from student
where rollno in(select rollno from student where rollno % 2 = 0);

select * from student
where city='pune';

select max(marks)
from(select * from student
where city='nashik') as temp;

select max(marks)
from student
where city='nashik';

select (select max(marks) from student),full_name 
from student;

create view view1 as
select rollno,full_name,marks from student;

select * from view1;

select * from view1
where marks>80;

drop view view1;

