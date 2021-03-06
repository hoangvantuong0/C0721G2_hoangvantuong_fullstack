drop database if exists quan_ly_sinh_vien_2;
create database quan_ly_sinh_vien_2;
use quan_ly_sinh_vien_2;
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
insert into class
values (4, 'A1', current_date, 0);
insert into class
values (5, 'A2', current_date, 1);

insert into student (studentName, address, phone, `status`, class_classID)
values ('Hung', 'Ha Noi', '0912113113', 1, 1);
insert into student (studentName, address, `status`, class_classID)
values ('Hoan', 'Hai Phong', 1, 1);
insert into student (studentName, address, phone, `status`, class_classID)
values ('Manh', 'HCM', '0123123123', 0, 2);
insert into student (studentName, address, phone, `status`, class_classID)
values ('Manh', 'Ha Noi', '0123123123', 0, 1);
insert into student (studentName, address, phone, `status`, class_classID)
values ('Manh', 'HCM', '0123123567', 1, 2);

insert into `subject`
values (1, 'Toan', 5, 1),
       (2, 'Ly', 6, 1),
       (3, 'Hoa', 5, 1),
       (4, 'Hoa', 10, 1),
       (5, 'Toan', 7, 1),
       (6, 'Sinh', 6, 1);
insert into mark (subject_subId, student_studentId, mark, examTimes)
values (1, 1, 8, 1),
	   (2, 2, 10, 2),
       (3, 3, 12, 1),
       (4, 2, 8, 2),
       (5, 1, 8, 1);
       
       
-- Hi???n th??? t???t c??? c??c sinh vi??n c?? t??n b???t ?????u b???ng k?? t??? ???h???.

select studentName
from student
where `studentName` like "H%";

-- Hi???n th??? c??c th??ng tin l???p h???c c?? th???i gian b???t ?????u v??o th??ng 12.
select *
from class
where startDate like "%12%";

-- Hi???n th??? t???t c??? c??c th??ng tin m??n h???c c?? credit trong kho???ng t??? 3-5.
select *
from `subject`
where credit between 3 and 5;

-- Thay ?????i m?? l???p(ClassID) c???a sinh vi??n c?? t??n ???Hung??? l?? 2.

SET SQL_SAFE_UPDATES = 0;
update student
set class_classId = 2
where studentName = 'Hung'; 
SET SQL_SAFE_UPDATES = 1;

-- Hi???n th??? c??c th??ng tin: StudentName, SubName, Mark. D??? li???u s???p x???p theo ??i???m thi (mark) gi???m d???n. n???u tr??ng s???p theo t??n t??ng d???n.

select student.studentName, `subject`.subName, mark.mark
from student
join mark
on student.studentId = mark.student_studentId
join `subject`
on mark.subject_subId = subject_subId
where mark
order by mark desc, studentName asc ;


       
       
       
       