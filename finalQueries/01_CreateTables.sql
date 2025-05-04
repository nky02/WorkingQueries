-- Use or create the database
USE GroceryStoreDB;
GO

-- Drop tables in the correct order 
DROP TABLE IF EXISTS SalesDetails;
DROP TABLE IF EXISTS Reports;
DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Inventory;
DROP TABLE IF EXISTS Items;
GO

-- Create Items table
CREATE TABLE Items (
    iID INT PRIMARY KEY IDENTITY(1,1),
    iDesc NVARCHAR(50),
    iPrice DECIMAL(10,2),
    iQuantity INT,
    iCategory NVARCHAR(50)
);

-- Create Inventory table
CREATE TABLE Inventory (
    invID INT PRIMARY KEY IDENTITY(1,1),
    iID INT FOREIGN KEY REFERENCES Items(iID),
    invDate DATETIME,
    begInv INT,
    iOut INT
);

-- Create Sales table
CREATE TABLE Sales (
    salesID INT PRIMARY KEY IDENTITY(1,1),
    sDate DATETIME DEFAULT GETDATE()
);

-- Create SalesDetails table
CREATE TABLE SalesDetails (
    sdID INT PRIMARY KEY IDENTITY(1,1),
    invID INT FOREIGN KEY REFERENCES Inventory(invID),
    salesID INT FOREIGN KEY REFERENCES Sales(salesID),
    sQty INT DEFAULT 1
);

-- Create Reports table
CREATE TABLE Reports (
    reportId INT PRIMARY KEY IDENTITY(1,1),
    reportType NVARCHAR(50),
    reportDate DATE,
    totalSalesAmount DECIMAL(10, 2),
    totalItemsSold INT CHECK (totalItemsSold >= 0)
);
GO

-- Insert test data into Items table
INSERT INTO Items (iDesc, iPrice, iQuantity, iCategory)
VALUES  
    ('Piattos', 17.95, 50, 'snacks'),
    ('Mang Juan', 10.95, 60, 'snacks'),
    ('Mr. Chips', 15.95, 50, 'snacks'),
    ('Burger', 25, 60, 'snacks'),
    ('BBQ Fries', 23.50, 40, 'snacks'),
    ('Chocolate', 15, 60, 'snacks'),
    ('Coca-Cola', 15, 72, 'drinks'),
    ('Sprite', 15.75, 72, 'drinks'),
    ('Lemon', 15.95, 72, 'drinks'),
    ('Pineapple', 25, 72, 'drinks'),
    ('Orange', 19.50, 72, 'drinks'),
    ('C2', 15, 96, 'drinks'),
    ('Brewed Coffee', 39, 60, 'drinks'),
    ('Yakult', 13, 50, 'drinks'),
    ('Chilled Chicken', 180, 30,'meats'),
    ('Liempo', 175, 30, 'meats'),
    ('Chicken Leg Quarter', 131.45, 30, 'meats'),
    ('Pork Chop', 172.50, 20, 'meats'),
    ('Tuna 500g', 150.50, 20, 'meats'),
    ('Shrimp 1kg', 180, 10, 'meats'),
    ('Tilapia 100g', 120, 20, 'meats'),
    ('Chicken Wings 1kg', 120.50, 20, 'meats'),
    ('Bangus', 165.75, 20, 'meats'),
    ('Apple 1kg',76, 20,'fruits'),
    ('Grapes 1kg', 85.75, 15, 'fruits'),
    ('Mango 1kg', 67, 30, 'fruits'),
    ('Cabbage', 120, 20, 'vegetables'),
    ('Carrots', 140.50, 30,'vegetables'),
    ('Garlic', 125.50, 40, 'vegetables'),
    ('Tomato 1kg', 89, 15, 'vegetables'),
    ('Onions', 250, 40, 'vegetables'),
    ('Pizza', 35.75, 50, 'snacks');

GO

-- Insert inventory data for each item (iID corresponds to the order above)
INSERT INTO Inventory (iID, invDate, begInv, iOut)
VALUES
    (1, '2025-04-07', 50, 0),
    (2, '2025-04-07', 60, 0),
    (3, '2025-04-07', 50, 0),
    (4, '2025-04-07', 60, 0),
    (5, '2025-04-07', 40, 0),
    (6, '2025-04-07', 60, 0),
    (7, '2025-04-07', 72, 0),
    (8, '2025-04-07', 72, 0),
    (9, '2025-04-07', 72, 0),
    (10, '2025-04-07', 72, 0),
    (11, '2025-04-07', 72, 0),
    (12, '2025-04-07', 96, 0),
    (13, '2025-04-07', 60, 0),
    (14, '2025-04-07', 50, 0),
    (15, '2025-04-07', 30, 0),
    (16, '2025-04-07', 30, 0),
    (17, '2025-04-07', 30, 0),
    (18, '2025-04-07', 20, 0),
    (19, '2025-04-07', 20, 0),
    (20, '2025-04-07', 10, 0),
    (21, '2025-04-07', 20, 0),
    (22, '2025-04-07', 20, 0),
    (23, '2025-04-07', 20, 0),
    (24, '2025-04-07', 20, 0),
    (25, '2025-04-07', 15, 0),
    (26, '2025-04-07', 30, 0),
    (27, '2025-04-07', 20, 0),
    (28, '2025-04-07', 30, 0),
    (29, '2025-04-07', 40, 0),
    (30, '2025-04-07', 15, 0),
    (31, '2025-04-07', 40, 0),
    (32, '2025-04-07', 50, 0),
    (32, '2025-04-07', 50, 0);


GO
