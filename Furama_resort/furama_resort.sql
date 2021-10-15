drop database if exists Furama;
create database Furama;
use Furama;
create table vi_tri (
idViTri int primary key,
tenViTri varchar(45)
);
create table trinh_do (
idTrinhDo int primary key,
trinhDo varchar(45)
);
create table bo_phan (
idBoPhan int primary key,
tenBoPhan varchar(45)
);
create table nhan_vien (
idNhanVien int primary key,
hoTen varchar(45),
idViTri int,
idTrinhDo int,
idBoPhan int,
ngaySinh date,
soCMND varchar(45),
luong varchar(45),
sdt varchar(45),
email varchar(45),
diaChi varchar(45),
foreign key (idViTri) references vi_tri(idViTri),
foreign key (idTrinhDo) references trinh_do(idTrinhDo),
foreign key (idBoPhan) references bo_phan(idBoPhan)
);
create table dich_vu_di_kem(
idDichVuDiKem int primary key,
tenDichVuDiKem varchar(45),
gia int,
donVi int,
trangThaiKhaDung varchar(45)
);

create table loai_khach (
idLoaiKhach int primary key,
tenLoaiKhach varchar (45)
);
create table khach_hang (
idKhachHang int primary key,
idLoaiKhach int,
hoTen varchar (45),
ngaySinh date,
soCMND varchar(45),
sdt varchar(45),
email varchar(45),
diaChi varchar(45),
foreign key (idLoaiKhach) references loai_khach(idLoaiKhach)
);
create table kieu_thue (
idKieuThue int primary key,
tenKieuThue varchar(45),
gia int
);
create table loai_dich_vu (
idLoaiDichVu int primary key,
tenLoaiDichVu varchar(45)
);
create table dich_vu (
idDichVu int primary key,
tenDichVu varchar(45),
dienTich int,
soTang int,
soNguoiToiDa varchar(45),
chiPhiThue varchar(45),
idKieuThue int,
idLoaiDichVu int,
trangThai varchar(45),
foreign key (idKieuThue) references kieu_thue(idKieuThue),
foreign key (idLoaiDichVu) references loai_dich_vu(idLoaiDichVu)
);
create table hop_dong (
idHopDong int primary key,
idNhanVien int,
idKhachHang int,
idDichVu int,
ngayLamHopDong date,
ngayKetThuc date,
tienDatCoc int,
tongTien int,
foreign key (idNhanVien) references nhan_vien(idNhanVien),
foreign key (idKhachHang) references khach_hang(idKhachHang),
foreign key (idDichVu) references dich_vu(idDichVu)
);
create table hop_dong_chi_tiet (
idHopDongChiTiet int primary key,
idHopDong int,
idDichVuDiKem int,
soLuong int,
foreign key (idDichVuDiKem) references dich_vu_di_kem(idDichVuDiKem),
foreign key (idHopDong) references hop_dong(idHopDong)
);

insert into vi_tri
values (1, "Lễ tân"),
(2, "Phục vụ"),
(3, "Chuyên viên"),
(4, "Giám sát"),
(5, "Quản lý"),
(6, "Giám đốc");
insert into trinh_do
values (1, "Trung cấp"),
(2, "Cao đẳng"),
(3, "Đại học"),
(4, "Sau đại học");

insert into bo_phan
values (1, "Sale – Marketing"),
(2, "Hành Chính"),
(3, "Phục vụ"),
(4, "Quản lý");
insert into nhan_vien
values (1,'Nguyễn An', 1, 3, 1, '1980-10-20', '0982345145', '100000', '0376597123', 'nguyenan@gmail','Đà Nẵng'),
       (2,'Võ văn Bia', 2, 2, 2, '1989-10-20', '5426712398', '200000', '0376654314','vovanbia@gmail.com','Quảng Trị'),
	   (3,'Hoàng Thi Cam', 1, 1, 2, '1965-10-20', '198734723', '300000', '0376876532','hoangthicam@gmail','Quảng Nam'),
	   (4,'Trần Hữu Trung', 2, 4, 3, '1988-11-20', '7432698731', '150000', '03764623', 'tranhuutrung@gmail','Quảng Nam'),
	   (5,'Lê Tấn Trường', 2, 2, 1, '1982-11-20', '0982345763', '120000', '0376583245', 'letantruong@gmail','Quảng Trị');


insert into dich_vu_di_kem
values (1, "massage", 10, 123, null),
(2, "karaoke", 20, 101, null),
(3, "thức ăn", 30, 109, null),
(4, "nước uống", 15, 300, null),
(5, "thuê xe", 09, 200, null);


insert into loai_khach
values (1, "Diamond"),
(2, "Platinium"),
(3, "Gold"), 
(4, "Silver"), 
(5, "Member");

insert into khach_hang
values (1, 1, "Nguyễn Hoàng Nam", '1993-03-20', '012435246', '0375591232', "nguyenhoangnam@gmail", "Đà Nẵng" ),
(2, 2, "Võ Văn Tú", '1994-02-22', '533461865', '09875591094', "vovantu@gmail", "Quảng Trị" ),
(3, 1, "Hoàng Xuân Thân", '1995-01-22', '654438676', '0375591232', "hoangxuanthan@gmail", "Đà Nẵng" ),
(4, 3, "Hồ Hữu", '1996-10-25', '7635246', '0377986232', "hohuu@gmail", "Quảng Trị" ),
(5, 5, "Trần Nhật Nam", '1997-09-23', '765435246', '05241232', "trannhatnam@gmail", "Đà Nẵng" ),
(6, 4, "Lê Quang Thành", '1998-03-10', '972435246', '06756591232', "lequangthanh@gmail", "Quảng Nam" );


insert into kieu_thue
values (1,  "theo giờ", 10),
(2, "theo ngày", 200),
(3, "theo tháng", 1000),
(4,"theo năm", 3300);

insert into loai_dich_vu
values (1,'Room'),
(2,'House'),
(3,'Villa');

insert into dich_vu
values (1,'Villa_A',50, 2,10, 3000,1,3,null),
(2,'Villa_B',60, 2,7, 3500,1,3,null),
(3,'House_A',30, 1,5, 1500,2,2,null),
(4,'Room_B',40, 2, 3, 2000,1,1,null);

insert into hop_dong
 values (1,1,1,4,'2019-08-10','2019-08-11',1000,2000),
(2,1,1,1,'2019-08-10','2019-08-11',1000,2000),
(3,2,2,2,'2019-06-12','2019-06-13',1000,2000),
(4,2,2,1,'2019-05-12','2019-05-13',1000,2000);


insert into hop_dong_chi_tiet
values (1, 1, 1, 1),
(2,2,2,1),
(3,1,1,2),
(4,1,2,4),
(5,2,3,1);

 
 

 