create database A7Cur;

use A7Cur;

CREATE TABLE N_RollCall (Roll_no INT PRIMARY KEY,
Name VARCHAR(20),Division VARCHAR(20));

CREATE TABLE O_RollCall (Roll_no INT PRIMARY KEY,
Name VARCHAR(20),Division VARCHAR(20));

insert into N_RollCall(Roll_no,Name,Division)
Values (1,"Shivraj","A"),(2,"Viraj","A"),
(3,"Vedant","A"),(4,"Rohit","A");

insert into O_RollCall(Roll_no,Name,Division)
Values (1,"Shivraj","A"),(3,"Vedant","A");

DELIMITER //
CREATE PROCEDURE roll()
BEGIN
    DECLARE v_name VARCHAR(20);
    DECLARE v_roll_no INT ;
    DECLARE v_division VARCHAR(2);
    DECLARE done BOOLEAN DEFAULT FALSE;
    DECLARE cur_new_rollcall CURSOR FOR
    SELECT Roll_no, Name, Division FROM N_RollCall;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
        OPEN cur_new_rollcall;
        read_loop: LOOP
        FETCH cur_new_rollcall INTO v_roll_no, v_name, v_division;
        IF done THEN
        LEAVE read_loop;
        END IF;
            INSERT INTO O_RollCall(Roll_no,Name,Division)
            VALUES (v_roll_no, v_name, v_division)
        ON DUPLICATE KEY UPDATE
            Name = VALUES(Name),
            Division = VALUES(Division);
        END LOOP;
    CLOSE cur_new_rollcall;
    COMMIT ;
END;//

DELIMITER ;

CALL roll();

SELECT * FROM N_RollCall;
SELECT * FROM O_RollCall;


