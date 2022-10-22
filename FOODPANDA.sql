create database if not exists FOODPANDA_DATABASE;
use FOODPANDA_DATABASE;


CREATE TABLE IF NOT EXISTS ADDRESS(
	ADDRESS_ID int not null auto_increment,
	STREET varchar(30),
	CITY varchar(30),
	PROVINCE varchar(50),
	primary key(ADDRESS_ID)
);
Create table if not exists DELIVERY_PERSON(
	DELIVERY_PERSON_ID int not null ,
	NAME varchar(100),
	PHONE varchar(50),
	VEHICLE varchar(50),
	primary key(DELIVERY_PERSON_ID)
    
);

create table if not exists RESTAURANT(
	RESTAURANT_ID int not null auto_increment,
	RESTAURANT_NAME varchar(30),
	WEBSITE varchar(50),
	PHONE varchar(30),
	ADDRESS_ID int,
	primary key (RESTAURANT_ID),
	foreign key ( ADDRESS_ID) references ADDRESS(ADDRESS_ID)
);

create table if not existS FOOD_ITEM(
	FOOD_ITEM_ID INT not null auto_increment,
	FOOD_NAME VARCHAR(30),
	UNIT_PRICE INT,
	RESTAURANT_ID INT,
	PRIMARY KEY (FOOD_ITEM_ID),
	foreign key (RESTAURANT_ID) references RESTAURANT( RESTAURANT_ID)
);

Create table if not exists CUSTOMER(
	CUSTOMER_ID int not null auto_increment,
	FIRST_NAME varchar(30),
	LAST_NAME varchar(50),
	EMAIL varchar(255),
	PHONE varchar(200),
	ADDRESS_ID int,
	primary key ( CUSTOMER_ID),
	foreign key ( ADDRESS_ID) references ADDRESS(ADDRESS_ID)
);

create table if not exists ORDERS(
	ORDER_ID  int not null auto_increment,
	DATE_ORDER datetime,
	PICK_UP boolean,
    check (PICK_UP >=0 and PICK_UP <=1),
	RESTAURANT_ID int,
	DELIVERY_PERSON_ID int,
	CUSTOMER_ID int,
	primary key ( ORDER_ID),
	foreign key (RESTAURANT_ID) references RESTAURANT(RESTAURANT_ID),
	foreign key (DELIVERY_PERSON_ID) references DELIVERY_PERSON( DELIVERY_PERSON_ID),
	foreign key(CUSTOMER_ID ) references CUSTOMER( CUSTOMER_ID)

);

select* from ORDERS;

create table ORDER_FOOD_ITEM(
	ORDER_ID int not null,
	FOOD_ITEM_ID int not null,
	QUANTITY int,
	foreign key (ORDER_ID) references ORDERS(ORDER_ID),
	foreign key ( FOOD_ITEM_ID) references FOOD_ITEM (FOOD_ITEM_ID),
	primary key ( ORDER_ID, FOOD_ITEM_ID)
);


insert into DELIVERY_PERSON( DELIVERY_PERSON_ID, NAME, PHONE, VEHICLE)
values
(0,'NOT PICK UP', '0',' NOT PICK UP'),
(1,'HO XUAN TY','0123-456-789','LAMBORGHINI URUS'),
(2,'DANG MINH QUAN','0999-999-999','SH'),
(3,'NGUYEN VAN BIEN','0987-654-321','CUB HYOSUNG'),
(4,'LE XUAN','0421-341-121','BICYCLE'),
(5,'NGUYEN HUU THANG','0243-433-663','WAVEALPHA');


insert into ADDRESS(STREET,CITY)
values ('LE HUU TRAC', 'DA NANG'),
('TO HIEN THANH', 'DA NANG'),
('NGO QUYEN', 'DA NANG'),
('PHAN BOI CHAU', 'DA NANG'),
('YEN LANG', 'DA NANG'),
('DONG DA', 'DA NANG'),
('TRAN PHU', 'DA NANG'),
('DIEN BIEN PHU', 'DA NANG'),
('HUNG VUONG', 'DA NANG');
update ADDRESS
set city =null
where ADDRESS_ID = 2 or ADDRESS_ID = 6 or ADDRESS_ID = 7;
select* from ADDRESS;

update ADDRESS
set province = 'QUANG NGAI'
where  ADDRESS_ID = 2 OR address_id =7;

update ADDRESS
set province = 'HA NOI'
where  ADDRESS_ID = 5;

update ADDRESS
set province = 'QUANG NAM'
where  ADDRESS_ID = 6;


insert into CUSTOMER(LAST_NAME, FIRST_NAME, EMAIL,PHONE, ADDRESS_ID)
values 
('A','TU', 'tu.a24@student.passerellesnumeriques.org','0324-342-234',2),
('A','QUANG', 'quang.a24@student.passerellesnumeriques.org','0234-234-234',3),
('A','TIEN', 'tien.a24@student.passerellesnumeriques.org','0246-373-345',1),
('CAO','TUYEN', 'tuyen.cao24@student.passerellesnumeriques.org','0977-235-345',4),
('PHAN','LUC', 'luc.phan24@student.passerellesnumeriques.org','0433-776-342',4);
insert into CUSTOMER(LAST_NAME, FIRST_NAME, EMAIL,PHONE, ADDRESS_ID)
values 
('HO','TY', 'ty.ho24@student.passerellesnumeriques.org','02649-259-151',6),
('LE','LUAN', 'luan.le24@student.passerellesnumeriques.org','0451-651-151',2);
update customer
set address_id = 7
where customer_id =7;


insert into RESTAURANT(RESTAURANT_NAME, WEBSITE,PHONE, ADDRESS_ID)
values
('BONG', 'BONGRESTAURANT.VN','0666-666-666',5),
('CONG', 'CONGBAONGON.VN','0234-324-987',6),
('SKY VIEW ', 'SKYVIEW.VN','0234-824-090',8),
('RED SKY', 'REDSKYRESTAURANT.VN','0654-464-478',7),
('PODORAMA', 'PODORAMA.VN','0712-983-879',9);
select*from RESTAURANT;

insert into FOOD_ITEM(FOOD_NAME, UNIT_PRICE,RESTAURANT_ID)
values('BUN CHA CA',50000, 5),
('COM GA', 88000, 5),
('BANH BEO',85000, 4),
('BEEFSTEAK',199000, 4),
('LONG XAO NGHE',99000, 3),
('YEN SAO',89000, 3),
('BUN HAI SAN',80000, 2),
('MY QUANG',30000, 1);
select*from FOOD_ITEM ;


insert into ORDERS(DATE_ORDER, PICK_UP,RESTAURANT_ID, DELIVERY_PERSON_ID, CUSTOMER_ID)
values('2022-08-01 17:30:02', 1 ,4, 1,4),
('2022-08-02 8:06:02', 1 ,1,1,2),
('2022-08-15 20:10:02', 1 ,3, 2,1),
('2022-08-15 21:10:02', 0 ,5,0,3),
('2022-08-06 21:10:02',0, 5,0,3),
('2022-08-17 17:10:02',1,2,4,2),
('2022-08-17 17:30:02',1,2,5,5),
('2022-08-17 20:10:02',0 ,1,0,5),
('2022-08-18 20:10:02',1,3,3,1);
insert into ORDERS(DATE_ORDER, PICK_UP,RESTAURANT_ID, DELIVERY_PERSON_ID, CUSTOMER_ID)
values('2022-08-19 19:10:02',0,2,3,6),
('2022- 08- 19 19:13:02',0,2,2,7);

delete from ORDERS where PICK_UP = 0;


select * from ORDERS;
delete from ORDERS where PICK_UP=1;

insert into ORDER_FOOD_ITEM (ORDER_ID, FOOD_ITEM_ID, QUANTITY)
values
(1,4,2),
(2,8,3),
(3,5,2),
(4,2,2),
(5,2,4),
(6,7,5),
(7,2,3),
(8,8,7),

(9,6,10);
delete from ORDER_FOOD_ITEM where quantity =10;

insert into ORDER_FOOD_ITEM (ORDER_ID, FOOD_ITEM_ID, QUANTITY)
values
(8,1,7),
(9,6,4),
(9,4,6),
(9,5,6);
insert into ORDER_FOOD_ITEM (ORDER_ID, FOOD_ITEM_ID, QUANTITY)
values
(10,7,3),
(11,7,5);
select * from ORDER_FOOD_ITEM

-- Q1 Show the food name and the price of the food item which price is greater or equal than 40000


select food_name , unit_price 
from food_item 
where unit_price >= 40000;


-- Q2 Write SQL query to get all food item that has price less or equal then 70000, and make the food name ordered as alphabet (A-Z)
select * from food_item 
where unit_price <=70000 order by food_name asc;
-- Q3 Write SQL to display all records of food_item table that has price range (less or equal than 50000) or (greater or equal than 90000). 
select * from food_item 
where unit_price <= 50000 or unit_price>=90000;



-- Q4 By using customers table, show all details about customers living in Quang Nam, in one of the following streets: Dong Da , Tran Phu
select customer.customer_id, customer.first_name, customer.last_name, customer.email, customer.phone, customer.address_id 
from customer ,address
where province = 'QUANG NAM' and street in ('DONG DA', 'TRAN PHU') and customer.address_id = address.address_id;


-- Q5 Display all information of all customers that are from the same street as the restaurants:
select customer.customer_id, customer.first_name, customer.last_name, customer.email, customer.phone, customer.address_id 
from customer, restaurant
where customer.address_id = restaurant.address_id;



select customer_id, first_name, last_name, email, phone, address_id 
from customer, restaurant
where customer.address_id = restaurant.address_id;

-- Question 6: Show Firstname, Lastname and Email of Customer ordered by Firstname in ascending

select first_name, last_name,email from Customer order by first_name asc;

select food_name, unit_price from Food_item order by food_name asc, unit_price desc;

select* from customer where first_name !="LUC";


select * from food_item where unit_price between 30000 and 70000;


select* from customer where first_name like "T%";


select order_id, date_order,pick_up 
from orders
 where pick_up !=0 and date_order > '2022-08-01 00:00:00' and date_order < '2022-08-16 00:00:00' 




-- Q1 Hiển thị thông tin Customer mua hàng ít nhất một lần



