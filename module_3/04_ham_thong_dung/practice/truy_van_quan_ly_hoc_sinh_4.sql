drop database if exists quan_ly_sinh_vien_3;
create database quan_ly_sinh_vien_3;
use quan_ly_sinh_vien_3;
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


--  Sử dụng hàm count để hiển thị số lượng sinh viên ở từng nơi

select address, count(studentID) as "số lượng học viên"
from student
group by address;

-- Tính điểm trung bình các môn học của mỗi học viên bằng cách sử dụng hàm AVG
select S.studentID, S.studentName, AVG(mark)
from student S join mark M on S.studentID = M.student_studentId
group by S.studentID, S.studentName;
	
-- Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 10
select S.studentID, S.studentName, AVG(mark)
from student S join mark M on S.studentID = M.student_studentId
group by S.studentID, S.studentName
having AVG(mark) > 10;

-- Hiển thị thông tin các học viên có điểm trung bình lớn nhất.
select S.studentID, S.studentName, AVG(mark)
from student S join mark M on S.studentID = M.student_studentId
group by S.studentID, S.studentName
having AVG(mark) >= all (select AVG(mark) from mark group by mark.student_studentId);





