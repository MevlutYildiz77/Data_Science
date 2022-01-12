


create database Manufacturer;

use Manufacturer

create table product
(
prod_id int,
prod_name varchar(max),
quantity int
primary key(prod_id)
)

create table component 
(
comp_id int primary key,
comp_name varchar(max),
[description] varchar(max),
quantity int
);

create table supplier
(
supp_id int,
supp_name varchar(max),
isactive bit,
primary key (supp_id)
);


--------

create table receipt
(
prod_id int,
comp_id int,
primary key (prod_id, comp_id),
foreign key(prod_id) references product (prod_id),
foreign key (comp_id) references component (comp_id)
);



create table [order]
(
comp_id int,
supp_id int,
[date] date,
quantity int,
primary key (comp_id, supp_id),
foreign key (comp_id) references component (comp_id),
foreign key (supp_id) references supplier (supp_id)
);





