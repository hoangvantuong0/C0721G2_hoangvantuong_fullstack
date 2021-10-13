drop database if exists quan_ly_diem_thi;
create database quan_ly_diem_thi;
use quan_ly_diem_thi;
create table hoc_sinh (
maHs varchar(20) primary key,
tenHs varchar(50),
ngaySinh datetime,
lop varchar(20),
gt varchar(20)
);
create table mon_hoc (
maMh varchar(20) primary key,
tenMh varchar(50)
);
create table bang_diem (
maHs varchar(20),
maMh varchar(20),
diemthi int,
ngayKt datetime,
primary key (maHs, maMh),
foreign key (maHs) references hoc_sinh(maHs),
foreign key (maMh) references mon_hoc(maMh)
);
create table giao_vien (
maGv varchar(20) primary key,
tenGv varchar(20),
sdt varchar(10)
);
alter table mon_hoc add maGv varchar(20);
alter table mon_hoc add constraint fk_maGv foreign key (maGv) references giao_vien(maGv);