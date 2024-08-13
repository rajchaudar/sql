Create database Assignment5a;


use Assignment5a;


Create Table student(Roll_no int Primary key,
Name varchar(50),Marks int ,Category Varchar(50));


select * from student;

insert into student(Roll_no,Name,Marks)
Values(18,"Shivraj",950),(63,"Vraj",840),(29,"Chinmay",860),
(56,"Vedant",990),(30,"Rohit",1400);

select * from student;

-- DELIMITER //

CREATE PROCEDURE categorize_students()
BEGIN
    UPDATE student
    SET Category = 'Distinction'
    WHERE marks >= 990 AND marks <= 1500;
    UPDATE student
    SET Category = 'First Class'
    WHERE marks >= 900 AND marks <= 989;
    UPDATE student
    SET Category = 'Higher Second Class'
    WHERE marks >= 825 AND marks <= 899;
    UPDATE student
    SET Category = 'Not Categorized'
    WHERE marks < 825;
END //

-- DELIMITER ;

call categorize_students();


select * from student;

drop DATABASE Assignment5a;