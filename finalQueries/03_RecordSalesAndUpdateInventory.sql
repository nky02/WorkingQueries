-- Insert Sales Data
INSERT INTO Sales (sDate)
VALUES (GETDATE());
GO

-- Insert SalesDetails Data
INSERT INTO SalesDetails (invID, salesID, sQty)
VALUES
    (1, 1, 5),
    (2, 1, 3),
    (3, 1, 2),
    (7, 1, 10),
    (8, 1, 5);
GO

-- Update Inventory Based on SalesDetails
UPDATE inv
SET begInv = begInv - sd.sQty,
    iOut = iOut + sd.sQty
FROM Inventory inv
JOIN SalesDetails sd ON inv.invID = sd.invID
WHERE sd.salesID = 1;
GO
