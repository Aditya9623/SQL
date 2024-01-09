create database if not exists college;

drop database if exists company;


use college;
create table student(
id int primary key,
name varchar(20),
age int not null
);

insert into student values(1,'Adi',21);
insert into student values(2,'Yash',20);
insert into student values(3,'Om',22);
select * from student;

show databases;
show tables;
