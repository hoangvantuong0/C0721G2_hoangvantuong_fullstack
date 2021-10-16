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
values 
(1, "Lễ tân"),
(2, "Phục vụ"),
(3, "Chuyên viên"),
(4, "Giám sát"),
(5, "Quản lý"),
(6, "Giám đốc");
insert into trinh_do
values 
(1, "Trung cấp"),
(2, "Cao đẳng"),
(3, "Đại học"),
(4, "Sau đại học");

insert into bo_phan
values 
(1, "Sale – Marketing"),
(2, "Hành Chính"),
(3, "Phục vụ"),
(4, "Quản lý");
insert into nhan_vien
values 
(1,'Nguyễn An', 1, 3, 1, '1980-10-20', '0982345145', '100000', '0376597123', 'nguyenan@gmail','Đà Nẵng'),
(2,'Võ văn Bia', 2, 2, 2, '1989-10-20', '5426712398', '200000', '0376654314','vovanbia@gmail.com','Quảng Trị'),
(3,'Hoàng Thi Cam', 1, 1, 2, '1965-10-20', '198734723', '300000', '0376876532','hoangthicam@gmail','Quảng Nam'),
(4,'Trần Hữu Trung', 2, 4, 3, '1988-11-20', '7432698731', '150000', '03764623', 'tranhuutrung@gmail','Quảng Nam'),
(5,'Lê Tấn Trường', 2, 2, 1, '1982-11-20', '0982345763', '120000', '0376583245', 'letantruong@gmail','Quảng Trị'),
(6,'Khánh Toàn', 2, 2, 1, '1982-11-20', '0982584717', '140000', '0376839876', 'khanhtoan@gmail','Hue'),
(7,'Trần Nguyễn Khánh Vân', 2, 1, 1, '1992-11-20', '098253817', '145000', '0377329876', 'trannguyenkhanhvan@gmail','Đà Nẵng');

insert into dich_vu_di_kem
values 
(1, "massage", 10, 123, null),
(2, "karaoke", 20, 101, null),
(3, "thức ăn", 30, 109, null),
(4, "nước uống", 15, 300, null),
(5, "thuê xe", 09, 200, null);


insert into loai_khach
values 
(1, "Diamond"),
(2, "Platinium"),
(3, "Gold"), 
(4, "Silver"), 
(5, "Member");

insert into khach_hang
values 
(1, 1, "Nguyễn Hoàng Nam", '1993-03-20', '012435246', '0375591232', "nguyenhoangnam@gmail", "Đà Nẵng" ),
(2, 2, "Võ Văn Tú", '1994-02-22', '533461865', '09875591094', "vovantu@gmail", "Quảng Trị" ),
(3, 1, "Hoàng Xuân Thân", '1995-01-22', '654438676', '0375591232', "hoangxuanthan@gmail", "Đà Nẵng" ),
(4, 3, "Hồ Hữu", '1996-10-25', '7635246', '0377986232', "hohuu@gmail", "Quảng Trị" ),
(5, 5, "Trần Nhật Nam", '1997-09-23', '765435246', '05241232', "trannhatnam@gmail", "Đà Nẵng" ),
(6, 4, "Lê Quang Thành", '1998-03-10', '972435246', '06756591232', "lequangthanh@gmail", "Quảng Nam" ),
(7, 3, "Khánh Vân", '1990-03-10', '972437433', '06756543232', "khanhvan@gmail", "Hue" ),
(8, 2, "Trương Toàn Năng", '2009-02-16', '9724365433', '089964323', "truongtoannang@gmail", "Hue" ),
(9, 1, "Hốt Tất Liệt", '1953-03-10', '972476533', '067569826246', "hottatliet@gmail", "Quảng Ngãi" );

insert into kieu_thue
values 
(1, "theo giờ", 10),
(2, "theo ngày", 200),
(3, "theo tháng", 1000),
(4, "theo năm", 3300);

insert into loai_dich_vu
values 
(1,'Room'),
(2,'House'),
(3,'Villa');

insert into dich_vu
values 
(1,'Villa_A',50, 2,10, 3000,1,3,null),
(2,'Villa_B',60, 2,7, 3500,1,3,null),
(3,'House_A',30, 1,5, 1500,2,2,null),
(4,'Room_B',40, 2, 3, 2000,1,1,null);

insert into hop_dong
 values 
(1,1,1,4,'2019-02-10','2019-08-11',1000,2000),
(2,2,4,1,'2021-03-10','2021-08-11',1000,2000),
(3,3,4,2,'2019-06-15','2019-08-30',1000,2000),
(4,4,5,3,'2019-04-14','2020-05-13',1000,2000),
(5,5,3,4,'2017-05-12','2019-05-21',1000,2000),
(6,4,5,2,'2019-01-22','2020-05-14',1000,2000),
(7,5,2,1,'2018-03-25','2019-05-11',1000,2000),
(8,1,9,3,'2019-06-24','2019-09-16',1000,2000),
(9,1,1,3,'2019-04-21','2019-09-26',1000,2000),
(10,1,1,3,'2019-07-21','2019-09-23',1000,2000),
(11,1,1,3,'2019-10-21','2019-11-13',1000,2000),
(12,1,9,3,'2019-12-21','2019-12-26',1000,2000);


insert into hop_dong_chi_tiet
values (1, 1, 1, 1),
(2,8,2,1),
(3,5,1,2),
(4,3,2,4),
(5,12,2,4),
(6,8,3,1);


-- 2. Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự.
select *
from nhan_vien
where (hoTen like "H%" or hoTen like "T%" or hoTen like "K%") and char_length(hoTen) <= 15;


-- 3. Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select *
from khach_hang as AGE
where (timestampdiff (year, ngaySinh, curdate()) > 18 and timestampdiff (year, ngaySinh, curdate()) <50) 
and (diaChi ="Quảng Trị" or diaChi = "Đà Nẵng");

-- 4. Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần.
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.				
select khach_hang.hoTen as "họ tên khách hàng", khach_hang.idKhachHang as "id khách hàng", 
loai_khach.tenLoaiKhach as "loại khách", hop_dong.idKhachHang as "id hợp đồng", count(hop_dong.idKhachHang) as "số lần đặt"
from khach_hang 
join hop_dong
on khach_hang.idKhachHang = hop_dong.idKhachHang
join loai_khach
on khach_hang.idLoaiKhach = loai_khach.idLoaiKhach
where loai_khach.tenLoaiKhach = "Diamond" 
group by  hop_dong.idKhachHang 
order by count(hop_dong.idKhachHang) asc;

-- 5.	Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc, TongTien 
-- (Với TongTien được tính theo công thức như sau: ChiPhiThue + SoLuong*Gia, với SoLuong và Giá là từ bảng DichVuDiKem) 
-- cho tất cả các Khách hàng đã từng đặt phỏng. (Những Khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
select KH.idKhachHang, KH.hoTen, HD.idHopDong, DV.tenDichVu, HD.ngayLamHopDong, HD.ngayKetThuc, 
(DV.chiPhiThue + DVDK.gia*HDCT.soLuong) as "Tổng tiền"
from khach_hang KH
left join hop_dong HD
on HD.idKhachHang = KH.idKhachHang
left join loai_khach LK
on KH.idKhachHang = LK.idLoaiKhach
left join dich_vu DV
on HD.idDichVu = DV.idDichVu
left join kieu_thue KT
on DV.idKieuThue = KT.idKieuThue
left join hop_dong_chi_tiet HDCT
on HDCT.idHopDong = HD.idHopDong
left join dich_vu_di_kem DVDK
on DVDK.idDichVuDiKem = HDCT.idDichVuDiKem;

-- 6.	Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu của tất cả các loại Dịch vụ 
-- chưa từng được Khách hàng thực hiện đặt từ quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3).
select DV.idDichVu, DV.tenDichVu, DV.dienTich, DV.chiPhithue, LDV.tenLoaiDichVu as "loại dịch vụ"
from dich_vu DV
right join loai_dich_vu LDV
on DV.idLoaiDichVu = LDV.idLoaiDichVu
right join hop_dong HD
on DV.idDichVu = HD.idDichVu
where (year(HD.ngayLamHopDong) > '2019') or ((year(HD.ngayLamHopDong) = 2019) and month(HD.ngayLamHopDong) >3) or DV.idDichVu is null;

-- 7.	Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu của tất cả 
-- các loại dịch vụ đã từng được Khách hàng đặt phòng trong năm 2018 nhưng chưa từng được Khách hàng đặt phòng trong năm 2019.
select DV.idDichVu, DV.tenDichVu, DV.dienTich, DV.soNguoiToiDa, DV.chiPhiThue, LDV.tenLoaiDichVu
from dich_vu DV
right join loai_dich_vu LDV
on LDV.idLoaiDichVu = DV.idLoaiDichVu
right join hop_dong HD
on HD.idDichVu = DV.idDichVu
where (year(HD.ngayLamHopDong) = 2018) and not (year(HD.ngayLamHopDong) < 2018 or (year(HD.ngayLamHopDong) > 2018));

-- 8.	Hiển thị thông tin HoTenKhachHang có trong hệ thống, với yêu cầu HoThenKhachHang không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên
-- cách 1
select KH.idKhachHang, KH.hoTen, count(KH.idKhachHang)
from khach_hang KH
left join hop_dong HD
on HD.idKhachHang = KH.idKhachHang
group by KH.idKhachHang;
-- cách 2
select distinct KH.idKhachHang, KH.hoTen
from khach_hang KH
left join hop_dong HD
on HD.idKhachHang = KH.idKhachHang;
-- cách 3
select KH.idKhachHang, KH.hoTen
from khach_hang KH;

-- 9. Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2019 
-- thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

select hop_dong.ngayLamHopDong, count(hop_dong.ngayLamHopDong) as 'Tổng'
from hop_dong
join dich_vu
on hop_dong.idDichVu = dich_vu.idDichVu
where year(hop_dong.ngayLamHopDong) = '2019'
group by month(hop_dong.ngayLamHopDong);


-- 10.	Hiển thị thông tin tương ứng với từng Hợp đồng thì đã sử dụng bao nhiêu Dịch vụ đi kèm. 
-- Kết quả hiển thị bao gồm IDHopDong, NgayLamHopDong, NgayKetthuc, TienDatCoc, SoLuongDichVuDiKem 
-- (được tính dựa trên việc count các IDHopDongChiTiet).
select HD.idHopDong, HD.ngayLamHopDong, HD.ngayKetThuc, HD.tienDatCoc, DVDK.tenDichVuDiKem, HDCT.soLuong as 'số lượng dịch vụ đi kèm'
from hop_dong HD
join hop_dong_chi_tiet HDCT
on HDCT.idHopDong = HD.idHopDong
join dich_vu_di_kem DVDK
on DVDK.idDichVuDiKem = HDCT.idDichVuDiKem
group by HDCT.idHopDongChiTiet;

-- 11.	Hiển thị thông tin các Dịch vụ đi kèm đã được sử dụng bởi những Khách hàng
-- có TenLoaiKhachHang là “Diamond” và có địa chỉ là “Vinh” hoặc “Quảng Ngãi”.

select DVDK.tenDichVuDiKem, KH.hoTen, DVDK.gia
from dich_vu_di_kem DVDK
join hop_dong_chi_tiet HDCT
on HDCT.idDichVuDiKem
join hop_dong HD
on HDCT.idHopDong = HD.idHopDong
join khach_hang KH
on HD.idKhachHang = KH.idKhachHang
join loai_khach LK
on LK.idLoaiKhach = KH.idKhachHang
where LK.tenLoaiKhach = "Diamond" 
and (KH.diaChi = "Quảng Ngãi" or KH.diaChi = "Quảng Ngãi");

-- 12.	Hiển thị thông tin IDHopDong, TenNhanVien, TenKhachHang, SoDienThoaiKhachHang, TenDichVu, SoLuongDichVuDikem 
-- (được tính dựa trên tổng Hợp đồng chi tiết), TienDatCoc của tất cả các dịch vụ đã từng được khách hàng đặt vào 
-- 3 tháng cuối năm 2019 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2019.
select HD.idHopDong, NV.hoTen, KH.hoTen, KH.sdt, DV.tenDichVu, HDCT.soLuong, HD.tienDatCoc
from hop_dong HD
join nhan_vien NV
on HD.idNhanVien = NV.idNhanVien
join khach_hang KH
on KH.idKhachHang = HD.idKhachHang
join dich_vu DV
on DV.idDichVu = HD.idDichVu
join hop_dong_chi_tiet HDCT
on HDCT.idHopDong = HD.idHopDong
where  year(HD.ngayLamHopDong) = '2019' and month(HD.ngayLamHopDong) > 9
and HD.idDichVu not in (
select HD.idHopDong
from hop_dong HD
join khach_hang KH
on KH.idKhachHang = HD.idKhachHang
join dich_vu DV 
on DV.idDichVu = HD.idDichVu
join hop_dong_chi_tiet HDCT
on HDCT.idHopDong = HD.idHopDong
join dich_vu_di_kem DVDK
on DVDK.idDichVuDiKem = HDCT.idHopDongChiTiet
where  year(HD.ngayLamHopDong) = '2019' and month(HD.ngayLamHopDong) <=6); 


