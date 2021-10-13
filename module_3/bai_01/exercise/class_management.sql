drop database if exists class_management;
create database class_management;
use class_management;
create table class (
id int primary key,
`name` varchar(45)
);