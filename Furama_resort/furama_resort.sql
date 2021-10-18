drop database if exists furama_resort;
create database furama_resort;
use furama_resort;
create table vi_tri (
id_vi_tri int primary key,
ten_vi_tri varchar(45)
);
create table trinh_do (
id_trinh_do int primary key,
trinh_do varchar(45)
);
create table bo_phan (
id_bo_phan int primary key,
ten_bo_phan varchar(45)
);
create table nhan_vien (
id_nhan_vien int primary key,
ho_ten varchar(45),
id_vi_tri int,
id_trinh_do int,
id_bo_phan int,
ngay_sinh date,
so_cmnd varchar(45),
luong varchar(45),
sdt varchar(45),
email varchar(45),
dia_chi varchar(45),
foreign key (id_vi_tri) references vi_tri(id_vi_tri),
foreign key (id_trinh_do) references trinh_do(id_trinh_do),
foreign key (id_bo_phan) references bo_phan(id_bo_phan)
);
create table dich_vu_di_kem(
id_dich_vu_di_kem int primary key,
ten_dich_vu_di_kem varchar(45),
gia int,
don_vi int,
trang_thai_kha_dung varchar(45)
);

create table loai_khach (
id_loai_khach int primary key,
ten_loai_khach varchar (45)
);
create table khach_hang (
id_khach_hang int primary key,
id_loai_khach int,
ho_ten varchar (45),
ngay_sinh date,
so_cmnd varchar(45),
sdt varchar(45),
email varchar(45),
dia_chi varchar(45),
foreign key (id_loai_khach) references loai_khach(id_loai_khach)
);
create table kieu_thue (
id_kieu_thue int primary key,
ten_kieu_thue varchar(45),
gia int
);
create table loai_dich_vu (
id_loai_dich_vu int primary key,
ten_loai_dich_vu varchar(45)
);
create table dich_vu (
id_dich_vu int primary key,
ten_dich_vu varchar(45),
dien_tich int,
so_tang int,
so_nguoi_toi_da varchar(45),
chi_phi_thue varchar(45),
id_kieu_thue int,
id_loai_dich_vu int,
trang_thai varchar(45),
foreign key (id_kieu_thue) references kieu_thue(id_kieu_thue),
foreign key (id_loai_dich_vu) references loai_dich_vu(id_loai_dich_vu)
);
create table hop_dong (
id_hop_dong int primary key,
id_nhan_vien int,
id_khach_hang int,
id_dich_vu int,
ngay_lam_hop_dong date,
ngay_ket_thuc date,
tien_dat_coc int,
tong_tien int,
foreign key (id_nhan_vien) references nhan_vien(id_nhan_vien),
foreign key (id_khach_hang) references khach_hang(id_khach_hang),
foreign key (id_dich_vu) references dich_vu(id_dich_vu)
);
create table hop_dong_chi_tiet (
id_hop_dong_chi_tiet int primary key,
id_hop_dong int,
id_dich_vu_di_kem int,
so_luong int,
foreign key (id_dich_vu_di_kem) references dich_vu_di_kem(id_dich_vu_di_kem),
foreign key (id_hop_dong) references hop_dong(id_hop_dong)
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
(6,8,3,1),
(7,12,4,4),
(8,12,5,4),
(9,12,3,4),
(10,12,3,4),
(11,12,5,4);


-- 2. Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự.
select *
from nhan_vien
where (ho_ten like "H%" or ho_ten like "T%" or ho_ten like "K%") and char_length(ho_ten) <= 15;


-- 3. Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select *
from khach_hang as AGE
where (timestampdiff (year, ngay_sinh, curdate()) > 18 and timestampdiff (year, ngay_sinh, curdate()) <50) 
and (dia_chi ="Quảng Trị" or dia_chi = "Đà Nẵng");

-- 4. Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần.
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.				
select khach_hang.ho_ten as "họ tên khách hàng", khach_hang.id_khach_hang as "id khách hàng", 
loai_khach.ten_loai_khach as "loại khách", hop_dong.id_khach_hang as "id hợp đồng", count(hop_dong.id_khach_hang) as "số lần đặt"
from khach_hang 
join hop_dong
on khach_hang.id_khach_hang = hop_dong.id_khach_hang
join loai_khach
on khach_hang.id_loai_khach = loai_khach.id_loai_khach
where loai_khach.ten_loai_khach = "Diamond" 
group by  hop_dong.id_khach_hang 
order by count(hop_dong.id_khach_hang) asc;

-- 5.	Hiển thị id_khach_hang, ho_ten, ten_loai_khach, id_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
-- (Với tong_tien được tính theo công thức như sau: chi_phi_thue + so_luong*Gia, với so_luong và Giá là từ bảng DichVuDiKem) 
-- cho tất cả các Khách hàng đã từng đặt phỏng. (Những Khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
select KH.id_khach_hang, KH.ho_ten, HD.id_hop_dong, DV.ten_dich_vu, HD.ngay_lam_hop_dong, HD.ngay_ket_thuc, 
(DV.chi_phi_thue + DVDK.gia*HDCT.so_luong) as "Tổng tiền"
from khach_hang KH
left join hop_dong HD
on HD.id_khach_hang = KH.id_khach_hang
left join loai_khach LK
on KH.id_khach_hang = LK.id_loai_khach
left join dich_vu DV
on HD.id_dich_vu = DV.id_dich_vu
left join kieu_thue KT
on DV.id_kieu_thue = KT.id_kieu_thue
left join hop_dong_chi_tiet HDCT
on HDCT.id_hop_dong = HD.id_hop_dong
left join dich_vu_di_kem DVDK
on DVDK.id_dich_vu_di_kem = HDCT.id_dich_vu_di_kem;

-- 6.	Hiển thị id_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại Dịch vụ 
-- chưa từng được Khách hàng thực hiện đặt từ quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3).
select DV.id_dich_vu, DV.ten_dich_vu, DV.dien_tich, DV.chi_phi_thue, LDV.ten_loai_dich_vu as "loại dịch vụ"
from dich_vu DV
right join loai_dich_vu LDV
on DV.id_loai_dich_vu = LDV.id_loai_dich_vu
right join hop_dong HD
on DV.id_dich_vu = HD.id_dich_vu
where (year(HD.ngay_lam_hop_dong) > '2019') or ((year(HD.ngay_lam_hop_dong) = 2019) and month(HD.ngay_lam_hop_dong) >3) or DV.id_dich_vu is null;

-- 7.	Hiển thị thông tin id_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả 
-- các loại dịch vụ đã từng được Khách hàng đặt phòng trong năm 2018 nhưng chưa từng được Khách hàng đặt phòng trong năm 2019.
select DV.id_dich_vu, DV.ten_dich_vu, DV.dien_tich, DV.so_nguoi_toi_da, DV.chi_phi_thue, LDV.ten_loai_dich_vu
from dich_vu DV
right join loai_dich_vu LDV
on LDV.id_loai_dich_vu = DV.id_loai_dich_vu
right join hop_dong HD
on HD.id_dich_vu = DV.id_dich_vu
where (year(HD.ngay_lam_hop_dong) = 2018) and not (year(HD.ngay_lam_hop_dong) < 2018 or (year(HD.ngay_lam_hop_dong) > 2018));

-- 8.	Hiển thị thông tin ho_tenKhachHang có trong hệ thống, với yêu cầu HoThenKhachHang không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên
-- cách 1
select KH.id_khach_hang, KH.ho_ten, count(KH.id_khach_hang)
from khach_hang KH
left join hop_dong HD
on HD.id_khach_hang = KH.id_khach_hang
group by KH.id_khach_hang;

-- cách 2
select distinct KH.id_khach_hang, KH.ho_ten
from khach_hang KH
left join hop_dong HD
on HD.id_khach_hang = KH.id_khach_hang;

-- cách 3
select KH.id_khach_hang, KH.ho_ten
from khach_hang KH;

-- 9. Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2019 
-- thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

select HD.ngay_lam_hop_dong, count(HD.ngay_lam_hop_dong) as 'Tổng'
from hop_dong HD
join dich_vu DV
on HD.id_dich_vu = DV.id_dich_vu
where year(HD.ngay_lam_hop_dong) = '2019'
group by month(HD.ngay_lam_hop_dong);


-- 10.	Hiển thị thông tin tương ứng với từng Hợp đồng thì đã sử dụng bao nhiêu Dịch vụ đi kèm. 
-- Kết quả hiển thị bao gồm id_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luongDichVuDiKem 
-- (được tính dựa trên việc count các id_hop_dong_chi_tiet).
select HD.id_hop_dong, HD.ngay_lam_hop_dong, HD.ngay_ket_thuc, HD.tien_dat_coc, DVDK.ten_dich_vu_di_kem, HDCT.so_luong as 'số lượng dịch vụ đi kèm'
from hop_dong HD
join hop_dong_chi_tiet HDCT
on HDCT.id_hop_dong = HD.id_hop_dong
join dich_vu_di_kem DVDK
on DVDK.id_dich_vu_di_kem = HDCT.id_dich_vu_di_kem
group by HDCT.id_hop_dong_chi_tiet;

-- 11.	Hiển thị thông tin các Dịch vụ đi kèm đã được sử dụng bởi những Khách hàng
-- có ten_loai_khachHang là “Diamond” và có địa chỉ là “Vinh” hoặc “Quảng Ngãi”.

select DVDK.ten_dich_vu_di_kem, KH.ho_ten, DVDK.gia
from dich_vu_di_kem DVDK
join hop_dong_chi_tiet HDCT
on HDCT.id_dich_vu_di_kem
join hop_dong HD
on HDCT.id_hop_dong = HD.id_hop_dong
join khach_hang KH
on HD.id_khach_hang = KH.id_khach_hang
join loai_khach LK
on LK.id_loai_khach = KH.id_khach_hang
where LK.ten_loai_khach = "Diamond" 
and (KH.dia_chi = "Quảng Ngãi" or KH.dia_chi = "Quảng Ngãi");

-- 12.	Hiển thị thông tin id_hop_dong, TenNhanVien, TenKhachHang, SoDienThoaiKhachHang, ten_dich_vu, so_luongDichVuDikem 
-- (được tính dựa trên tổng Hợp đồng chi tiết), tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 
-- 3 tháng cuối năm 2019 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2019.
select HD.id_hop_dong, NV.ho_ten, KH.ho_ten, KH.sdt, DV.ten_dich_vu, HDCT.so_luong, HD.tien_dat_coc
from hop_dong HD
join nhan_vien NV
on HD.id_nhan_vien = NV.id_nhan_vien
join khach_hang KH
on KH.id_khach_hang = HD.id_khach_hang
join dich_vu DV
on DV.id_dich_vu = HD.id_dich_vu
join hop_dong_chi_tiet HDCT
on HDCT.id_hop_dong = HD.id_hop_dong
where year(HD.ngay_lam_hop_dong) = '2019' and month(HD.ngay_lam_hop_dong) > 9
and HD.id_dich_vu not in (
select HD.id_hop_dong
from hop_dong HD
join khach_hang KH
on KH.id_khach_hang = HD.id_khach_hang
join dich_vu DV 
on DV.id_dich_vu = HD.id_dich_vu
join hop_dong_chi_tiet HDCT
on HDCT.id_hop_dong = HD.id_hop_dong
join dich_vu_di_kem DVDK
on DVDK.id_dich_vu_di_kem = HDCT.id_hop_dong_chi_tiet
where  year(HD.ngay_lam_hop_dong) = '2019' and month(HD.ngay_lam_hop_dong) <=6); 

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).

select HDCT.id_dich_vu_di_kem, DVDK.id_dich_vu_di_kem, DVDK.ten_dich_vu_di_kem, DVDK.gia, DVDK.don_vi, DVDK.trang_thai_kha_dung, count(HDCT.id_dich_vu_di_kem)
from hop_dong_chi_tiet HDCT
join dich_vu_di_kem DVDK
on HDCT.id_dich_vu_di_kem = DVDK.id_dich_vu_di_kem
group by HDCT.id_dich_vu_di_kem
having count(HDCT.id_dich_vu_di_kem) >= all
(select count(HDCT.id_dich_vu_di_kem)
from hop_dong_chi_tiet HDCT
join dich_vu_di_kem DVDK
on HDCT.id_dich_vu_di_kem = DVDK.id_dich_vu_di_kem
group by HDCT.id_dich_vu_di_kem
);

-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm IDHopDong, 
-- TenLoaiDichVu, TenDichVuDiKem, SoLanSuDung.

select HD.id_hop_dong, HDCT.id_dich_vu_di_kem, DVDK.ten_dich_vu_di_kem,  sum(HDCT.so_luong) as Tong
from hop_dong HD
join hop_dong_chi_tiet HDCT
on HDCT.id_hop_dong = HD.id_hop_dong
join dich_vu_di_kem DVDK
on DVDK.id_dich_vu_di_kem = HDCT.id_dich_vu_di_kem
group by DVDK.ten_dich_vu_di_kem
having tong = 1;

-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm IDNhanVien, HoTen, TrinhDo, TenBoPhan, SoDienThoai,
-- DiaChi mới chỉ lập được tối đa 3 hợp đồng từ năm 2018 đến 2019.

select NV.id_nhan_vien, NV.ho_ten, NV.id_trinh_do, NV.id_bo_phan, NV.sdt, NV.dia_chi, HD.ngay_lam_hop_dong, count(HD.ngay_lam_hop_dong) as Tong
from nhan_vien NV
join hop_dong HD
on HD.id_nhan_vien = NV.id_nhan_vien
where year(HD.ngay_lam_hop_dong) = '2019' or year(HD.ngay_lam_hop_dong) = '2018'
group by HD.ngay_lam_hop_dong
having Tong <=3;

-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2017 đến năm 2019.

-- SET SQL_SAFE_UPDATES = 0;
delete from nhan_vien NV
where NV.id_nhan_vien not in
(select HD.id_nhan_vien
from hop_dong HD
where year(HD.ngay_lam_hop_dong) between '2017' and '2019'); 
