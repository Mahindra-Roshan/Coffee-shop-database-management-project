create database coffeeshop;
use coffeeshop;

#staffs inn the coffeeshop

create table staff
(
staffid int primary key,
firstname varchar(50),
lastname varchar(50),
position varchar(50),
startdate date,
location varchar(50)
);

#branches of the coffeeshop

create table salesoutlet
(
salesoutlet_id int primary key,
salesoutlet_type varchar(50),
address varchar(50),
city varchar(30),
telephone varchar(20),
postalcode int,
manager int
);

#customer table.

create table customer
(
customerid int primary key,
customername varchar(50),
email varchar(50),
registerdate date,
cardnumber varchar(50),
dateofbirth date,
gender varchar(1)
);

#now the sales details table

create table salesdetails
(
salesdetails_id int primary key,
transaction_id int,
product_id int,
quantity int,
price double
);

# for  the products table

create table products
(
product_id int primary key,
product_name varchar(40),
description varchar(50),
product_price double,
product_type_id int
);

#product types to categorise

create table producttype
(
product_type_id int primary key,
product_type varchar(30),
product_category varchar(40)
);

#transaction table

create table salestransaction
(
transaction_id int primary key,
transaction_date date,
transaction_time datetime,
salesoutlet_id int,
staffid int,
customerid int,
foreign key (staffid) references staff (staffid)
);

#products updated with adding a foreign key withtype id

alter table products add foreign key (product_type_id) references producttype(product_type_id);


#sales details is updated by adding a foreign key product id

alter table salesdetails add foreign key (product_id) references products(product_id);


#adding transaction id in the sales details

alter table salesdetails add foreign key (transaction_id) references salestransaction(transaction_id);


#altering the salestransaction table  by adding customer id and sales outllet id.

alter table salestransaction add foreign key (customerid) references customer(customerid);

alter table salestransaction add foreign key (salesoutlet_id) references salesoutlet(salesoutlet_id);


#i made a mistake by using double instead of decimal so corrected,

ALTER TABLE salesdetails 
MODIFY price DECIMAL(10,2);

ALTER TABLE products 
MODIFY product_price DECIMAL(10,2);

#also the transaction_time can be as time instead of datetime,

alter table salestransaction modify transaction_time time;


#data i added,

INSERT INTO customer (customerid, customername, email, registerdate, cardnumber, dateofbirth, gender) VALUES 
(1, 'Mahindra Roshan', 'mahindraroshan413@gmail.com', '2024-01-01', '4567-8901-2345', '2004-09-12', 'M'),
(2, 'Sanjay Kapoor', 'sanjay.kapoor@example.com', '2023-10-15', '5678-9012-3456', '1998-11-02', 'M'),
(3, 'Ananya Iyer', 'ananya.iyer@example.com', '2024-02-05', '1234-5678-9012', '2000-04-18', 'F'),
(4, 'Rajesh Balakrishnan', 'rajesh.bala@example.com', '2023-12-25', '2345-6789-0123', '1995-06-09', 'M'),
(5, 'Aarav Nair', 'aarav.nair@example.com', '2024-03-17', '3456-7890-1234', '1997-01-20', 'M'),
(6, 'Meera Sharma', 'meera.sharma@example.com', '2023-08-30', '9876-5432-1098', '2001-09-22', 'F'),
(7, 'Priya Varma', 'priya.varma@example.com', '2024-01-10', '8765-4321-0987', '1999-03-15', 'F'),
(8, 'Raghav Joshi', 'raghav.joshi@example.com', '2023-11-01', '7654-3210-9876', '1998-07-11', 'M'),
(9, 'Devika Menon', 'devika.menon@example.com', '2023-09-21', '6543-2109-8765', '2002-12-30', 'F'),
(10, 'Skibidi Bop', 'skibidi.bop@example.com', '2024-04-01', '5432-1098-7654', '1995-05-25', 'M'),
(11, 'Cameraman', 'cameraman@example.com', '2024-01-31', '4321-0987-6543', '1988-10-10', 'M'),
(12, 'TV Woman', 'tvwoman@example.com', '2023-07-14', '3210-9876-5432', '1996-02-28', 'F'),
(13, 'Speaker Man', 'speakerman@example.com', '2023-11-22', '2109-8765-4321', '1993-11-11', 'M'),
(14, 'Anushka Reddy', 'anushka.reddy@example.com', '2024-02-28', '1098-7654-3210', '1994-04-16', 'F'),
(15, 'Arjun Das', 'arjun.das@example.com', '2023-12-10', '0987-6543-2109', '1997-08-08', 'M'),
(16, 'Kavya Rao', 'kavya.rao@example.com', '2024-01-20', '8765-4321-0987', '2000-01-01', 'F'),
(17, 'Gopal Swaminathan', 'gopal.swami@example.com', '2023-10-05', '7654-3210-9876', '1991-09-12', 'M'),
(18, 'Skibidi Toilet', 'skibidi.toilet@example.com', '2024-03-25', '6543-2109-8765', '2003-07-07', 'M'),
(19, 'Harini Chandra', 'harini.chandra@example.com', '2024-02-15', '5432-1098-7654', '1999-05-01', 'F'),
(20, 'Siddharth Patel', 'sid.patel@example.com', '2023-09-09', '4321-0987-6543', '1995-03-03', 'M');

select * from customer;


