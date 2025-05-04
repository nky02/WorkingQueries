-- View for Available Items (items with positive stock)
CREATE VIEW AvailableItems AS
SELECT 
    i.iID,
    i.iDesc,
    i.iPrice,
    i.iQuantity,
    i.iCategory
FROM 
    Items i
WHERE 
    i.iQuantity > 0;
GO
SELECT * FROM Items;
GO

USE GroceryStoreDB;
GO

-- Add Pizza to Items table
INSERT INTO Items (iDesc, iPrice, iQuantity, iCategory)
VALUES ('Pizza', 35.75, 50, 'snacks');

-- Add Pizza to Inventory table
INSERT INTO Inventory (iID, invDate, begInv, iOut)
VALUES (32, '2025-04-07', 50, 0);
