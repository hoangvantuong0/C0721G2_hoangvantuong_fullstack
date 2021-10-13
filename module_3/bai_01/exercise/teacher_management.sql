drop database if exists teacher_management;
create database teacher_management;
use teacher_management;
create table teacher (
id int primary key,
`name` varchar(45) null,
`age` int null,
country varchar(45) null

);