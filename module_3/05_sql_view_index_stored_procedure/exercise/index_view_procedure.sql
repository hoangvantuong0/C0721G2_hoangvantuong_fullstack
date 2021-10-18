drop database if exists products;
create database products;
use products;

create table products (
id_product int auto_increment primary key,
product_code varchar(45),
product_name varchar(45),
product_price int,
product_amount int,
product_description varchar(70),
product_status bit
);
insert into products (product_code, product_name ,product_price,product_amount,product_description,product_status)
values 
('pr101', 'product1', 10000, 10, 'good quality', 1),
('pr102', 'product2', 20000, 11, 'good quality', 1),
('pr103', 'product3', 30000, 12, 'good quality', 0),
('pr104', 'product4', 40000, 13, 'bad quality', 1),
('pr105', 'product5', 50000, 14, 'good quality', 0),
('pr106', 'product6', 60000, 15, 'good quality', 1),
('pr107', 'product7', 70000, 16, 'good quality', 0),
('pr108', 'product8', 80000, 17, 'good quality', 1),
('pr110', 'product9', 90000, 18, 'good quality', 1),
('pr111', 'product10', 11000, 19, 'good quality', 0),
('pr112', 'product11', 12000, 20, 'good quality', 1),
('pr113', 'product12', 13000, 21, 'bad quality', 0),
('pr114', 'product13', 14000, 22, 'good quality', 1),
('pr115', 'product14', 15000, 23, 'good quality', 0),
('pr116', 'product15', 16000, 24, 'good quality', 1),
('pr117', 'product16', 17000, 25, 'good quality', 0),
('pr118', 'product17', 18000, 26, 'good quality', 1),
('pr119', 'product18', 19000, 27, 'good quality', 0),
('pr120', 'product19', 20000, 28, 'good quality', 1),
('pr121', 'product20', 21000, 29, 'good quality', 0),
('pr122', 'product21', 10000, 10, 'good quality', 1),
('pr123', 'product22', 20000, 11, 'good quality', 1),
('pr124', 'product23', 30000, 12, 'good quality', 0),
('pr125', 'product24', 40000, 13, 'bad quality', 1),
('pr126', 'product25', 50000, 14, 'good quality', 0),
('pr127', 'product26', 60000, 15, 'good quality', 1),
('pr128', 'product27', 70000, 16, 'good quality', 0),
('pr129', 'product28', 80000, 17, 'good quality', 1),
('pr130', 'product29', 90000, 18, 'good quality', 1),
('pr131', 'product30', 141000, 19, 'good quality', 0),
('pr132', 'product31', 112000, 40, 'good quality', 1),
('pr133', 'product32', 123000, 51, 'good quality', 0),
('pr134', 'product33', 124000, 72, 'bad quality', 1),
('pr135', 'product34', 15000, 13, 'good quality', 0),
('pr136', 'product35', 16000, 84, 'good quality', 1),
('pr137', 'product36', 171000, 29, 'good quality', 0),
('pr138', 'product37', 158000, 36, 'good quality', 1),
('pr139', 'product38', 149000, 87, 'bad quality', 0),
('pr140', 'product39', 230000, 98, 'good quality', 1),
('pr141', 'product40', 261000, 39, 'good quality', 0);

-- Bước 3:
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
-- So sánh câu truy vấn trước và sau khi tạo index

explain select * from products where product_code = 'pr119';

alter table products add unique index idx_product_code (product_code);
explain select * from products where product_code = 'pr119';

-- .........................
select * from products where product_name ='product2' or product_price = '20000';

alter table products add unique index idx_product_name_price (product_name, product_price);
explain select * from products where product_name ='product2' or product_price = '20000';
-- .........................


-- Bước 4:
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
-- Tiến hành sửa đổi view
-- Tiến hành xoá view

create view products_view as
select product_code, product_name, product_price, product_status
from products;

create or replace view products_view as
select product_code, product_name, product_price, product_description, product_status
from products
where product_name = 'product12';

drop view products_view;


-- Bước 5:
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
-- Tạo store procedure thêm một sản phẩm mới
-- Tạo store procedure sửa thông tin sản phẩm theo id
-- Tạo store procedure xoá sản phẩm theo id

delimiter //
create procedure findAllProducts()
begin
select *
from products;
end //
delimiter ;

call findAllProducts();

delimiter //
create procedure add_a_new_product(product_code1 varchar(45), product_name1 varchar(45), product_price1 int, product_amount1 int, product_description1 varchar(70) , product_status1 bit)
begin
insert into products (product_code, product_name ,product_price,product_amount,product_description,product_status)
values (product_code1, product_name1, product_price, product_amount, product_description1, product_status1);
end //
delimiter ;

call add_a_new_product('pr250', 'product251', 143000, 20, 'good quality', 1);


delimiter //
create procedure edit_product (new_id int, new_code varchar(45), new_name varchar(45),
new_price int, new_amount int, new_description varchar(70), new_status bit)
 begin
update products
set product_code = new_code,
product_name = new_name,
product_price = new_price,
product_amount = new_amount,
product_description = new_description,
product_status = new_status
where id_product = new_id;
 end //
 delimiter ;

call edit_product(7,'pr01', 'product1', 11000, 1, 'good quality', 1);

delimiter //
create procedure delete_product (new_id int)
 begin
delete 
from products
where id_product = new_id ;
 end //
delimiter ;
call delete_product(7);




