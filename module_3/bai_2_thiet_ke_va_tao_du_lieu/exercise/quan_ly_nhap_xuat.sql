drop database if exists quan_ly_nhap_xuat;
create database quan_ly_nhap_xuat;
use quan_ly_nhap_xuat;
create table phieu_xuat (
soPX int auto_increment primary key,
ngayXuat datetime
);
create table vat_tu (
maVTU int auto_increment primary key,
tenVTU varchar(50)
);
create table so_dien_thoai (
id int auto_increment primary key,
sdt int
);
create table phieu_nhap (
soPN int auto_increment primary key,
ngayNhap datetime
);
create table nha_cc (
maNCC int auto_increment primary key,
tenNCC varchar(50),
diaChi varchar(70),
so_dien_thoai_id int,
constraint fk_so_dien_thoai_id foreign key (so_dien_thoai_id) references so_dien_thoai(id)
);
create table don_dat_hang(
soDH int auto_increment primary key,
ngayDH datetime,
nha_cc_maNCC int,
foreign key (nha_cc_maNCC) references nha_cc(maNCC)
);
create table chi_tiet_phieu_xuat (
phieu_xuat_soPX int,
vat_tu_maVTU int,
dgXuat varchar(50),
slXuat varchar (50),
primary key (phieu_xuat_soPX, vat_tu_maVTU),
foreign key (phieu_xuat_soPX) references phieu_xuat(soPX),
foreign key (vat_tu_maVTU) references vat_tu(maVTU)
);
create table chi_tiet_phieu_nhap (
vat_tu_maVTU int,
phieu_nhap_soPN int,
dgNhap varchar (40),
slNhap varchar (40),
primary key (vat_tu_maVTU, phieu_nhap_soPN),
foreign key (vat_tu_maVTU) references vat_tu(maVTU),
foreign key (phieu_nhap_soPN) references phieu_nhap(soPN)
);
create table chi_tiet_don_dh (
vat_tu_maVTU int,
don_dat_hang_soDH int,
primary key (vat_tu_maVTU, don_dat_hang_soDH),
foreign key (vat_tu_maVTU) references vat_tu(maVTU),
foreign key (don_dat_hang_soDH) references don_dat_hang(soDH)
);