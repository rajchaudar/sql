create database Company;

use Company;

create table Location
(
    Location_id int primary key,
    Location_name varchar(50) not null
);

create table Company
(
    Company_id int primary key,
    Company_name varchar(50) not null,
    Location_id int,
    foreign key (Location_id) references Location(Location_id)
);

create table Department
(
    Department_id int primary key,
    Department_name varchar(50) not null,
    Company_id int,
    foreign key (Company_id) references Company(Company_id)
);

create table Employee
(
    Employee_id int primary key,
    Employee_name varchar(50) not null,
    Salary int,
    Department_id int,
    foreign key (Department_id) references
Department(Department_id)
);

create table Project
(
    Project_id int primary key,
    Project_name varchar(50) not null
);

create table Assignment
(
    Assignment_id int primary key,
    Project_id int ,
    Employee_id int,
    foreign key (Project_id) references Project(Project_id),
    foreign key (Employee_id) references Employee(Employee_id)
);

show tables;

insert into Location
    (Location_id, Location_name)
values(1, "Maharastra"),
    (2, "Delhi");

insert into Company
    (Company_id, Company_name, Location_id)
values(101, "Rohit", 1),
    (102, "Radhey", 2),
    (103, "Vishwesh", 1);

insert into Department
    (Department_id, Department_name, Company_id)
values
    (1001, "Cto" , 101),
    (1002, "HR" , 103),
    (1003, "Sales", 102);

insert into Employee
    (Employee_id, Employee_name,Department_id, Salary)
values(3101008, "Viraj" , 1001, 50000),
    (3101028, "Omkar" , 1001, 40000),
    (3101018, "Shivraj", 1002, 100000),
    (3101043, "Vedant", 1003, 45000),
    (3101031, "Vijay", 1003, 59000);

insert into Project
    (Project_id, Project_name)
values(1, "Webclone"),
    (2, "Webredesign");

insert into Assignment
    (Assignment_id, Project_id,Employee_id)
values
    (1, 1, 3101008),
    (2, 1, 3101028),
    (3, 1, 3101018),
    (4, 2, 3101043),
    (5, 2, 3101031);

create view Employee_In_Department1
as
    select e.Employee_Id, e.Employee_Name, d.Department_Name
    from Employee e join Department d
        on e.Department_Id = d.Department_Id
    where d.Department_Name = 'Sales';

select *
from Employee_In_Department1;

CREATE INDEX EmployeeDeptIndex ON Department
(Department_id ASC, Company_id ASC);

SELECT INDEX_NAME, COLUMN_NAME, SEQ_IN_INDEX, CARDINALITY , SUB_PART , INDEX_TYPE
FROM INFORMATION_SCHEMA.STATISTICS
WHERE TABLE_NAME = 'Department' AND TABLE_SCHEMA = 'Company';

ALTER TABLE Assignment DROP FOREIGN KEY assignment_ibfk_2;

ALTER TABLE Employee MODIFY COLUMN Employee_id INT AUTO_INCREMENT;

alter table Employee auto_increment = 3101090;

ALTER TABLE Assignment ADD CONSTRAINT assignment_ibfk_2 FOREIGN KEY (Employee_id) REFERENCES Employee(Employee_id);

INSERT INTO Employee
    (Employee_name, Salary, Department_id)
VALUES
    ('Amey', 90000, 1003);

insert into Employee
    (Employee_name, Salary,Department_id)
values
    ('Atharva', 90000, 1003);

select *
from Employee;

select *
from Company;

select *
from Department;

select *
from Project;

select *
from Assignment;

select *
from Location;

