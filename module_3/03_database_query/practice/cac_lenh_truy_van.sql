drop database if exists quan_ly_sinh_vien_1;
create database quan_ly_sinh_vien_1;
use quan_ly_sinh_vien_1;
create table class (
classId int not null auto_increment primary key,
className varchar(60) not null,
startDate datetime not null,
`status` bit
);
create table student(
studentID int not null auto_increment primary key,
studentName varchar(40) not null,
address varchar(60),
phone varchar(20),
`status` bit,
class_classId int not null,
foreign key (class_classId) references class(classID)
);
create table `subject` (
subId int not null auto_increment primary key,
subName varchar(30) not null,
credit tinyint not null default 1 check (credit >=1),
`status` bit default 1
);
create table mark(
markId int not null auto_increment primary key,
subject_subId int not null,
student_studentId int not null,
mark float default 0 check (mark between 0 and 100),
examTimes tinyint default 1,
unique (subject_subId, student_studentId),
foreign key (subject_subId) references `subject` (subID),
foreign key (student_studentId) references student (studentId)
);
insert into class
values (1, 'A1', '2008-12-20', 1);
insert into class
values (2, 'A2', '2008-12-22', 1);
insert into class
values (3, 'B3', current_date, 0);

insert into student (studentName, address, phone, `status`, class_classID)
values ('Hung', 'Ha Noi', '0912113113', 1, 1);
insert into student (studentName, address, `status`, class_classID)
values ('Hoa', 'Hai Phong', 1, 1);
insert into student (studentName, address, phone, `status`, class_classID)
values ('Manh', 'HCM', '0123123123', 0, 2);

insert into `subject`
values (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
insert into mark (subject_subId, student_studentId, mark, examTimes)
values (1, 1, 8, 1),
	   (2, 2, 10, 2),
       (3, 3, 12, 1);
select *
from student;

select *
from student
where `status` = true;

select *
from `subject` where credit <10;

select student.studentID, student.studentName, class.classID
from student 
join class
on student.class_classID = class.classId
where className = 'A1';

select student.studentID, student.studentName, `subject`.subName, mark.mark
from student 
join mark
on student.studentId = mark.student_studentId
join `subject`
on mark.subject_subId = `subject`.subId
where subName = "CF";







