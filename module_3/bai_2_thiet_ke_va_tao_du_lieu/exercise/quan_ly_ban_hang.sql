drop database if exists quan_ly_ban_hang;
create database quan_ly_ban_hang;
use quan_ly_ban_hang;
create table customer (
cID int auto_increment primary key,
cName varchar (30),
cAge int
);
create table `order`(
oID int auto_increment primary key,
customer_cID int,
oDate datetime,
oTotalPrice int,
foreign key (customer_cID) references customer(cID)
);
create table product (
pID int auto_increment primary key,
pName varchar (40),
pPrice int
);
create table order_detail (
order_oID int,
product_pID int,
odQTY int,
primary key (order_oID, product_pID),
foreign key (order_oID) references `order`(oID),
foreign key (product_pID) references product (pID)
);