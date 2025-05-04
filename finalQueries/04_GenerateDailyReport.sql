-- Insert Daily Report based on Sales
INSERT INTO Reports (reportType, reportDate, totalSalesAmount, totalItemsSold)
SELECT 
    'daily',
    CONVERT(DATE, s.sDate),
    SUM(i.iPrice * sd.sQty),
    SUM(sd.sQty)
FROM Sales s
JOIN SalesDetails sd ON sd.salesID = s.salesID
JOIN Inventory inv ON sd.invID = inv.invID
JOIN Items i ON inv.iID = i.iID
WHERE CONVERT(DATE, s.sDate) = CONVERT(DATE, GETDATE())
GROUP BY CONVERT(DATE, s.sDate);
GO
