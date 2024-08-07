Create Database Library;


use Library;


CREATE TABLE Borrower(Rollin INT PRIMARY KEY ,
Name VARCHAR(50),Date_of_issue DATE,
Name_of_book VARCHAR(50),Status VARCHAR(50));


CREATE TABLE Fine(roll_no INT PRIMARY KEY ,
Date DATE,Amount INT);

show tables;

INSERT INTO Borrower(Rollin, Name, Date_of_issue, Name_of_book,Status)
VALUES(18, 'Shivraj', '2024-07-10', 'CNS', "issued"),
(20, 'Viraj', '2024-07-20', 'DBMS', 'issued'),
(32, 'Vedant', '2024-07-15', 'STC', 'issued'),
(10, 'Radhey', '2024-08-06', 'SPM', 'issued');


select * from Borrower;

DELIMITER //

CREATE PROCEDURE Finecal(IN roll_no INT , IN book_name CHAR(20))
BEGIN
    DECLARE V_DOI DATE;
    DECLARE noofdays INT ;
    DECLARE fine DOUBLE;
    DECLARE f1 INT DEFAULT 0;

    -- Handler when no record
    DECLARE CONTINUE HANDLER FOR NOT FOUND
    SET f1 = 1;

    -- Fetch dates of issued books
    SELECT Date_of_issue
    INTO V_DOI
    FROM Borrower
    WHERE Rollin = roll_no AND Name_of_book = book_name;

    -- If the record  found
    IF f1 = 1 THEN
    SELECT 'Record not found' AS Message;

ELSE
    -- Calculate the number of overdue days
    SET noofdays=DATEDIFF(CURDATE(), V_DOI);

    -- Calculate the fine based on the number of overdue days
    IF noofdays >= 15 AND noofdays <= 30 THEN
    SET fine=((noofdays - 15) * 50) + 150;
    ELSE
    SET fine=0;
    END IF;

    -- Output the fine amount
    SELECT fine AS FineAmount;

    -- Update the status of the book in the Borrower table
    UPDATE Borrower
    SET Status = 'Return'
    WHERE Rollin = roll_no AND Name_of_book = book_name;

    -- Insert the fine record into the Fine table
    INSERT INTO Fine
    (roll_no, Date, Amount)
    VALUES(roll_no, CURDATE(), fine);
    END IF;
END //

DELIMITER ;

CALL Finecal (18,'CNS');

CALL Finecal (20,'DBMS');

CALL Finecal (10,'SPM');

CALL Finecal (32,'STC');


select * from Fine;


select * from Borrower;


