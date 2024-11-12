create database Property_Dealer;

use property_dealer;

create table Branch
(
    Branchno int primary key,
    street varchar(50),
    city varchar(50),
    postcode int
);

create table Staff
(
    Staff_no int primary key,
    fname varchar(50),
    lname varchar(50),
    position varchar(50),
    gender varchar(10),
    DOB date,
    salary int,
    Branchno int,
    foreign key (Branchno) references Branch(Branchno)
);

create table PropertyForRent
(
    Property_no int primary key,
    street varchar(50),
    city varchar(50),
    postcode int,
    type varchar(10),
    rooms int,
    rent int,
    ownerno int,
    Staff_no int,
    branchno int,
    foreign key (Staff_no) references Staff(Staff_no),
    foreign key (branchno) references Branch(branchno)
);

create table Client
(
    CUID int primary key,
    fname varchar(50),
    lname varchar(50),
    rent int
);

create table PrivateOwner
(
    OUID int primary key,
    fname varchar(50),
    lname varchar(50),
    address varchar(50)
);

insert into Branch
    (Branchno, street, city, postcode)
values(1, "West Bypass", "Pune", 414223),
    (2, "Narhe Road", "Mumbai", 402345),
    (3, "Katraj", "satara", 414141),
    (4, "Hinjewadi", "Wakad", 423103);

insert into Staff
    (Staff_no, fname, lname, position, gender, DOB, salary, Branchno)
values(101, "Swaraj", "Nangare", "Investor", "M", "2003-5-13", 800000, 1),
    (102, "Om", "Mane", "Client", "M", "2003-6-2", 200000, 2),
    (103, "Sushant", "Gaikwad", "Manager", "M", "2003-6-12", 300000, 3),
    (104, "Sita", "Rani", "Cto", "F", "2004-2-2", 300000, 2),
    (105, "Radha", "Rani", "Ceo", "F", "2004-8-31", 400000, 1),
    (106, "Atharva", "Shinde", "Devloper", "M", "2003-8-15", 100000, 3),
    (107, "Pratik", "Kakade", "Sales", "M", "2002-2-7", 400000, 1);

insert into PropertyForRent
    (Property_no, street, city, postcode,
    type, rooms, rent, ownerno, Staff_no, branchno)
values(1, "Maha Bank", "Narhe", '411041', "apartment", 3, 32000, 201, 101, 1),
    (2, 'Venkatesh Sharvil', 'Ramnagar', '410042', 'Villa', 5, 30000, 202, 102, 2),
    (3, 'Abhiruchi Palace', 'Ambegaon', '413130', 'Bungalow', 4, 20000, 203, 103, 3);

insert into PrivateOwner
    (OUID, fname, lname, address)
values(201, "Rohit", "Sawant", "Nalakas, Satana"),
    (202, "Radhey", "Chitte", "Sriramnagar,Dhule"),
    (203, "Vishwesh", "Joshi", "Near Kasaba, Jalna");

insert into Client
    (CUID, fname, lname, rent)
values(301, "Vijay", "Patil", 10000),
    (302, "Vedant", "Patil", 24000),
    (303, "Viraj", "Kulye", 50000),
    (304, "Shivraj", "Chaudar", 90000);

select *
from Staff;

update Staff set lname = "Ambre" where( Staff_no = 106);

select *
from Staff;


select *
from Branch;

select *
from Staff
where fname like '%a%a%' or lname like '%a%a%';

select branchno , max(salary) as maxsalary
from Staff
group by branchno
order by maxsalary desc;

select *
from Client;

select *
from PrivateOwner;

select Client.CUID, Client.fname, Client.lname
from Client, PrivateOwner
where (Client.fname = PrivateOwner.fname) and (Client.lname = PrivateOwner.lname);

select P .OUID, P .fname, P .lname
from PrivateOwner P left
    join Client C on P .fname = C.fname
where C.fname is null;

insert into PrivateOwner
    (OUID, fname, lname, address)
values(204, 'Shivraj', 'Chaudar', 'Pune ,INDIA');

select *
from PrivateOwner;

select *
from PrivateOwner
where fname like '__c%';

select *
from Staff
where position in ('Salesman','Saleswomen');

select *
from Client
where (rent > 10000);


