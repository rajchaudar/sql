create database Managment;

use Managment;

CREATE TABLE Sales_Representative
(
    Rep_no INT PRIMARY KEY ,
    Name VARCHAR(255),
    Re_office VARCHAR(255),
    Quota DECIMAL(10, 2),
    Sales DECIMAL(10, 2)
);

CREATE TABLE Customers
(
    Cust_no INT PRIMARY KEY ,
    Company VARCHAR(255),
    Cust_Rep INT ,
    Credit_Limit DECIMAL(10, 2),
    FOREIGN KEY (Cust_Rep) REFERENCES Sales_Representative(Rep_no)
);

CREATE TABLE Orders
(
    Order_no INT PRIMARY KEY ,
    Cust INT ,
    Product VARCHAR(255),
    Quantity INT ,
    Amount DECIMAL(10, 2),
    Disc DECIMAL(10, 2),
    FOREIGN KEY (Cust) REFERENCES Customers(Cust_no)
);

INSERT INTO Sales_Representative
    (Rep_no, Name,
    Re_office, Quota, Sales)
VALUES
    (1, 'Vedant Patil', 'Sambhajinagar', 300000, 200000),
    (2, 'Vijay Patil', 'Sambhajinagar', 280000, 250000),
    (3, 'Viraj Kulye', 'Mumbai', 1200000, 1100000),
    (4, 'Omkar Avkale', 'Satara', 350000, 300000),
    (5, 'Amey Mojar', 'Satara', 1000000, 900000);

INSERT INTO Customers
    (Cust_no, Company, Cust_Rep,
    Credit_Limit)
VALUES(1, 'Alphabet', 1, 150000),
    (2, 'Tesla', 2, 210000),
    (3, 'BMW', 3, 900000),
    (4, 'Mercedez', 4, 250000),
    (5, 'Volvo', 5, 750000);

INSERT INTO Orders
    (Order_no, Cust, Product, Quantity,
    Amount, Disc)
VALUES
    (1, 1, 'Software', 120, 30000, 500),
    (2, 2, 'Hardware', 50, 20000, 300),
    (3, 3, 'Software', 200, 40000, 600),
    (4, 4, 'Consulting', 150, 50000, 700),
    (5, 5, 'Cloud Services', 100, 45000, 800),
    (6, 1, 'Hardware', 85, 250000, 400),
    (7, 2, 'Software', 120, 28000, 500);

SELECT c.Company AS Customer_Name, sr.Name AS Rep_Name,
    sr.Re_office AS Rep_Office_Number
FROM Customers c
    JOIN Sales_Representative sr ON c.Cust_Rep = sr.Rep_no;

select o.Order_no , o.Amount, sr.Name,
    c.Company as Customer_Name
from Orders o
    join Customers c on o.Cust = c.Cust_no
    join Sales_Representative sr on c.Cust_Rep = sr.Rep_no
where o.amount > 25000;

select Product
from Orders o join Customers c on o.Cust =
c.Cust_no
where Company = 'Alphabet';

SELECT c.Company, MAX(o.Disc) AS Max_Discount
FROM Orders o
    JOIN Customers c ON o.Cust = c.Cust_no
GROUP BY c.Company
ORDER BY Max_Discount DESC;

SELECT sr1.Name AS Rep1_Name,
    sr2.Name AS Rep2_Name, sr1.Re_office
FROM Sales_Representative sr1
    JOIN Sales_Representative sr2
    ON sr1.Re_office = sr2.Re_office
WHERE sr1.Rep_no < sr2.Rep_no;

select c.Company, c.Credit_Limit, sum(o.Disc) as
Total_Discount
from Orders o
    join Customers c on o.Cust = c.Cust_no
group by c.Company, c.Credit_Limit;

SELECT c.Company AS Customer_Name, c.Credit_Limit,
    sr.Name AS Rep_Name, sr.Sales AS Rep_Sales
FROM Customers c
    JOIN Sales_Representative sr ON c.Cust_Rep = sr.Rep_no;

SELECT o.Order_no, o.amount, c.Company 
AS Customer_Name, c.Credit_Limit
FROM Orders o
    JOIN Customers c ON o.Cust = c.Cust_no;

SELECT o.product,
    SUM(o.Amount) AS Total_Sale_Amount
FROM Orders o
GROUP BY o.Product
HAVING Total_Sale_Amount > 12000;

SELECT o.Amount, c.Company AS Customer_Name,
    sr.Name AS Rep_Name
FROM Orders o
    JOIN Customers c ON o.Cust = c.Cust_no
    JOIN Sales_Representative sr ON c.Cust_Rep = sr.Rep_no
WHERE o.Product = 'Software';

SELECT c.Company, c.Credit_Limit,
    SUM(o.Disc) AS Total_Discount
FROM Orders o
    JOIN Customers c ON o.Cust = c.Cust_no
GROUP BY c.Company, c.Credit_Limit;


