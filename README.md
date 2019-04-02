# ITP-Project

Owner Registration DB

part,
name,
price,
contact_no,
hotel_id  - pk(primary key)/nn(not null),
address,
UserName,
Password



*data base name = itp
*table name = owner
*database username = root
*database password = root

-----------------------------

Hotel Registration DB

part,
name,
hotel_id -pk/nn,
imagelocation,
facilities,
activities,
food,
re_services,
cleaning_services,
pool,
rooms,
address,
UserName,
password,



*data base name = itp
*table name = hotel10
*database username = root
*database password = root


--------------------------------------------------------------

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
    
-------------------------------------------

create table tourguide(
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
    

    
