CREATE DATABASE EcommerceDB;
USE EcommerceDB;

CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    City VARCHAR(30)
);

CREATE TABLE Products (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(50),
    Price DOUBLE,
    Stock INT
);

CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Product_ID INT,
    Quantity INT,
    Order_Date DATE
);

INSERT INTO Customers VALUES
(1, 'Ayesha', 'ayesha@gmail.com', 'Mumbai'),
(2, 'Rahul', 'rahul@gmail.com', 'Pune'),
(3, 'Sneha', 'sneha@gmail.com', 'Delhi'),
(4, 'Arjun', 'arjun@gmail.com', 'Bangalore'),
(5, 'Neha', 'neha@gmail.com', 'Hyderabad'),
(6, 'Rohan', 'rohan@gmail.com', 'Chennai'),
(7, 'Priya', 'priya@gmail.com', 'Kolkata'),
(8, 'Amit', 'amit@gmail.com', 'Mumbai'),
(9, 'Kiran', 'kiran@gmail.com', 'Pune'),
(10, 'Meena', 'meena@gmail.com', 'Jaipur');

INSERT INTO Products VALUES
(101, 'Laptop', 55000, 10),
(102, 'Mobile', 25000, 20),
(103, 'Headphones', 3000, 50),
(104, 'Keyboard', 1500, 40),
(105, 'Mouse', 800, 60),
(106, 'Monitor', 12000, 15),
(107, 'Smartwatch', 7000, 25),
(108, 'Tablet', 30000, 12),
(109, 'Power Bank', 2000, 35),
(110, 'Charger', 1000, 45);

INSERT INTO Orders VALUES
(1001, 1, 101, 1, '2024-01-10'),
(1002, 2, 102, 2, '2024-01-12'),
(1003, 3, 103, 3, '2024-01-15'),
(1004, 4, 104, 1, '2024-01-18'),
(1005, 5, 105, 2, '2024-01-20'),
(1006, 6, 106, 1, '2024-01-22'),
(1007, 7, 107, 1, '2024-01-25'),
(1008, 8, 108, 1, '2024-01-28'),
(1009, 9, 109, 2, '2024-02-01'),
(1010, 10, 110, 3, '2024-02-05');

SELECT COUNT(*) AS Total_Customers FROM Customers;

SELECT COUNT(*) AS Total_Products FROM Products;

SELECT Customer_ID, COUNT(*) AS Total_Orders
FROM Orders
GROUP BY Customer_ID;

SELECT Product_ID, SUM(Quantity) AS Total_Sold
FROM Orders
GROUP BY Product_ID;

SELECT Product_Name, Price
FROM Products
WHERE Price > 20000;

SELECT *
FROM Orders
WHERE Order_Date > '2024-01-12';

SELECT Product_Name, Price
FROM Products
ORDER BY Price DESC;

SELECT *
FROM Customers
WHERE City = 'Mumbai';

START TRANSACTION;
DELETE FROM Orders WHERE Order_ID = 1004;
ROLLBACK;

