# ITP-Project

create database project;

use project;

create table driver(
	fname varchar(45),
    lname varchar(45),
    nic varchar(45),
    email varchar(45),
    phone varchar(45),
	avatar varchar(255),
    path varchar(255) ,
    license varchar(45),
    dI varchar(45),
    dE varchar(45),
    part varchar(45),
    terms varchar(45),
    username varchar(45),
    password varchar(45));
    
    /*-------------------------*/
    
    create table guide(
	fname varchar(45),
    lname varchar(45),
    nic varchar(45),
    avatar varchar(255),
    path varchar(255) ,
    email varchar(45),
    phone varchar(45),
	language varchar(255),
    part varchar(45),
    license varchar(45),
    dI varchar(45),
    dE varchar(45),
    part1 varchar(45),
    terms varchar(45),
    username varchar(45),
    password varchar(45));
    
    /*-------------------*/

	create table staff(
    role varchar(50),
    fname varchar(45),
    lname varchar(45),
    nic varchar(45),
    phoneno varchar(45),
    email varchar(45),
    username varchar(45),
    password varchar(45) );

    /*-----------------------*/

    create table Cowner(
    fname varchar(45),
    lname varchar(45),
    nic varchar(45),
    phoneno varchar(45),
    email varchar(45),
    username varchar(45),
    password varchar(45) );
   
    insert into Cowner values("Mr. Manoj","Egodagama","850340322V","0777343434","manoj87ego@gamil.com","manoj85","123456M");
 
    /*----------------------------------*/
    
	create table vehicle(
    fname varchar(45),
    lname varchar(45),
    phone varchar(45),
    type varchar(20),
    status varchar(45),
    noPlate varchar(45),
    avatar varchar(255),
    path varchar(255),
    part varchar(45),
    features varchar(255),
    terms varchar(45),
    username varchar(45),
    password varchar(45));
    
   /*--------------------------*/ 
   
   create table lcustomer(
    fname varchar(45),
    lname varchar (45),
    nic varchar(45),
    avatar varchar(255),
    path varchar(255),
    phone varchar(10),
    gender varchar(10),
    email varchar(45),
    username varchar(45),
    password varchar(45));
      
   /*--------------------------*/
	
      create table fcustomer(
    fname varchar(45),
    lname varchar (45),
    pass varchar(45),
    avatar varchar(255),
    path varchar(255),
    phone varchar(10),
    gender varchar(10),
    email varchar(45),
    username varchar(45),
    password varchar(45));
   
   /*---------------------------*/ 
    
    create table travel(
		name varchar(100),
		details varchar(1000),
		avatar varchar(255),
		path varchar(255));

   /*--------------------------------*/
	
		CREATE TABLE `eventadmin` (
  `ideventadmin` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `nic` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `dob` date NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`ideventadmin`)
);

   /*------------------------------*/
   
		CREATE TABLE `events` (
  `idevents` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `discount` int(11) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`idevents`)
);


 /*-----------------------------*/

CREATE TABLE `requests` (
  `idrequests` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL,
  `reqname` varchar(150) NOT NULL,
  `email` varchar(45) NOT NULL,
  `hotel` varchar(45) NOT NULL,
  `date` datetime NOT NULL,
  `days` int(11) NOT NULL,
  `capacity` int(11) NOT NULL,
  `vehicle` varchar(45) NOT NULL,
  `noofvehicle` int(11) NOT NULL,
  `budget` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `hallname` varchar(45) NOT NULL,
  PRIMARY KEY (`idrequests`)
);

/*-----------------------------------*/

create table bad_debts(
Transaction_id varchar(10),
Business_name varchar(50),
Department varchar(20),
Amount varchar(20),
Date varchar(20));

/*-------------------------*/
create table business_payment(
Transaction_id varchar(10),
Type varchar(10),
Date varchar(20),
Amount varchar(20));

insert into business_payment values ('1','saman','2019-03-11','100000');
insert into business_payment values ('5','lavan','2019-02-28','8000');
insert into business_payment values ('7','ruvin','2019-04-01','20000');
insert into business_payment values ('19','sadun','2019-03-11','100000');

/*-------------------------*/
create table booking_payment(
Transaction_id varchar(10),
Business_name varchar(50),
Department varchar(20),
Amount varchar(20),
Date varchar(20),
Status varchar(15));

/*------------------------------------*/
create table driverbook(
username varchar(20),
dname varchar(20),
date varchar(10),
numd varchar(5),
price varchar(10),
amount varchar(20));

/*--------------------------------------*/
create table vehicleBook(
username varchar(20),
vname varchar(20),
type varchar(20),
date varchar(10),
numd varchar(5),
price varchar(10),
amount varchar(20));

/*------------------------------------*/
create table tourguidebook(
username varchar(20),
gname varchar(20),
date varchar(10),
numd varchar(5),
price varchar(10),
amount varchar(20));

/*------------------------------------*/
create table platinum(
pname varchar(50),
pid varchar(10),
person varchar(10),
view varchar(50),
bed varchar(10),
avatar varchar(255),
path varchar(255),
d1 varchar(1000),
d2 varchar(1000),
d3 varchar(1000),
d4 varchar(1000),
d5 varchar(1000),
d6 varchar(1000),
d7 varchar(1000));

drop table platinum;
/*-----------------------------------*/

create table gold(
pname varchar(100),
pid varchar(10),
person varchar(10),
view varchar(50),
bed varchar(10),
avatar varchar(255),
path varchar(255),
d1 varchar(1000),
d2 varchar(1000),
d3 varchar(1000),
d4 varchar(1000),
d5 varchar(1000));

/*-----------------------------------*/
create table silver(
pname varchar(100),
pid varchar(10),
person varchar(10),
view varchar(50),
bed varchar(10),
avatar varchar(255),
path varchar(255),
d1 varchar(1000),
d2 varchar(1000),
d3 varchar(1000));

/*------------------------------------*/

create table adventure(
part varchar(45),
name varchar(45),
contact_no varchar(45),
avatar varchar(255),
path varchar(255),
Details varchar(5000),
avb varchar(10),
username varchar(20),
password varchar(20) 
);
/*--------------------------------*/

create table owner(
Fname varchar(40),
Lname varchar(45),
Address varchar(45),
NIC varchar(45),
Gender varchar(45),
DOB varchar(45),
Email varchar(45),
PhoneNo int,
UserName varchar(45),
Password varchar(45)
 );
 
 /*----------------------------------*/
 
 create table hotel10(
 name varchar(45),
 imagelocation varchar(45),
 pool varchar(100),
 rooms varchar(100));
 
 insert into hotel10 values ('saman','null','pool available','10');
 insert into hotel10 values ('araliya','nim','pool available','40');
 insert into hotel10 values ('nil manel','no','pool available','20');
/*------------------------------------*/
create table spa(
nema varchar(45),
id varchar(45) primary key,
imagelocation varchar(45),
facials varchar(100),
waxing varchar(100),
body varchar(100),
massage varchar(100),
tinting varchar(100),
address varchar(100),
username varchar(45),
password varchar(45));

 /*-----------------------------------*/
	use project;
    
    select * from driver;
    select * from lcustomer;
    select * from fcustomer;
    select * from driverbook;  
    select * from guide;
	select * from tourguidebook;
	select * from vehicle;
    select * from vehiclebook;
    select * from staff;
    select * from Cowner;
    select * from lcustomer;
    select * from fcustomer; 
    select * from travel;
	select * from eventadmin;
	select * from events; 
	select * from requests;
    select * from bad_debts;
    select * from business_payment;
    select * from booking_payment;
    select * from platinum;
    select * from gold;
    select * from silver;
    select * from adventure;
    select * from owner;
    select * from hotel10;
	select * from spa;
   
	select * from foreign_vehicle_booking; 
	select * from local_vehicle_booking;
	select * from service_count;
	select * from customer_count;
   
   
   select username
   from vehiclebook
   where date < current_date();
	
    
    select current_date();
   
   
   
   
   
   
   
   
   
   
 /*****************************************/  
   create view foreign_vehicle_booking
   as 
   select f.fname,f.phone,f.email,v.vname,v.date,v.numd,v.amount
   from fcustomer f , vehiclebook v
   where f.username=v.username;
   
   select  * from foreign_vehicle_booking;
   
   create view local_vehicle_booking
   as 
   select l.fname,l.phone,l.email,v.vname,v.date,v.numd,v.amount
   from lcustomer l , vehiclebook v
   where l.username=v.username;

   select * from local_vehicle_booking;
  
 /***************************************/
 create view service_count
 as
 select 'vehicle owners' as category, count(*) from vehicle
 union
 select 'drivers' as category, count(*) from driver
 union 
 select 'tour guides' as category, count(*) from guide;
 
 select * from service_count;

/****************************************/   
   create view customer_count
   as
    SELECT 'Foreign count' AS Type, COUNT(*) FROM fcustomer
	UNION
	SELECT 'Local count' AS Type, COUNT(*) FROM lcustomer;

   select * from customer_count;
