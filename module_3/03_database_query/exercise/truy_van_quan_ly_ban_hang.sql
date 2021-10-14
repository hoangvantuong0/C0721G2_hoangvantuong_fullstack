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

insert into customer
values (1, "Minh Quan", 10),
       (2, "Ngoc Oanh", 20),
       (3, "Hong Ha", 50);

insert into `order`
values (1, 1, '2006-3-21', null),
       (2, 2, '2006-3-23', null),
       (3, 1, '2006-3-16', null);
       
insert into product
values (1, "May Giat", 3),
(2, "Tu Lanh", 5),
(3, "Dieu Hoa", 7),
(4, "Quat", 1),
(5, "Bep Dien", 2);

insert into order_detail
values (1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(3, 1, 8),
(2, 5, 4),
(2, 3, 3);

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select `order`.oID, `order`.oDate, `order`.oTotalPrice
from `order`;


-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select `order`.customer_cID, customer.cName, product.pName
from customer
join `order`
on customer.cID = `order`.customer_cID
join order_detail 
on `order`.oID = order_detail.order_oID
join product
on order_detail.product_pID = product.pID;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select customer.cName
from customer
left join `order`
on customer.cID = `order`.customer_cID
where `order`.customer_cID is null;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng 
-- tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
select `order`.oID, `order`.oDate, sum(product.pPrice*order_detail.odQTY) as oTotalPrice
from `order`
join order_detail
on `order`.oID = order_detail.order_oID
join product
on order_detail.product_pID = product.pID
group by `order`.oID;


