Create Database TRIGGER;

use TRIGGER;

Create table Library (id INT PRIMARY KEY ,
Bookname Varchar(50),Publisher Varchar(50),
Section Varchar(50));

INSERT INTO Library (id, bookname, publisher, section)
VALUES(1,'TOC','Technical','Engg'),
(2,'CNS','Techknowledge','Engg'),
(3,'DBMS','Techguru','IT'),
(4,'SPM','Amol','ENTC'),
(5,'SPOS','Geeta','Comp'),
(6,'AIML','Comp','ENTC');

CREATE TABLE LibraryAudit (id INT ,Pre_book_name VARCHAR(50),
Pre_Publisher VARCHAR(50),Pre_Section VARCHAR(50),Status VARCHAR(50));

DELIMITER //

CREATE TRIGGER Before_update
BEFORE UPDATE ON Library
FOR EACH ROW
BEGIN
    INSERT INTO LibraryAudit(id, Pre_book_name, Pre_Publisher, Pre_Section,Status)
    VALUES (OLD.id, OLD.bookname, OLD.publisher, OLD.section,'Before Update');
END //

CREATE TRIGGER After_update
AFTER UPDATE ON Library
FOR EACH ROW
BEGIN
    INSERT INTO LibraryAudit(id, Pre_book_name, Pre_Publisher, Pre_Section,Status)
    VALUES (NEW.id, NEW.bookname, NEW.publisher, NEW.section,'After Update');
END //

CREATE TRIGGER before_delete
BEFORE DELETE ON Library
FOR EACH ROW
BEGIN
    INSERT INTO LibraryAudit(id, Pre_book_name, Pre_Publisher, Pre_Section,Status)
    VALUES (OLD.id, OLD.bookname, OLD.publisher, OLD.section,'Deleted');
END //

DELIMITER ;

UPDATE Library SET section = 'Literature' WHERE id = 4;

select * from LibraryAudit;

delete from Library where(id = 5);

select * from LibraryAudit;

select * from Library;


