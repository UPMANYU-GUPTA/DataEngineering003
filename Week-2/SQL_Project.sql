
USE superstore_db;
SELECT * FROM superstore
LIMIT 10;
SELECT COUNT(*) AS Total_Records
FROM superstore;
SELECT SUM(Sales) AS Total_Sales
FROM superstore;
SELECT SUM(Profit) AS Total_Profit
FROM superstore;
SELECT Category,
       SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY Category;
SELECT Region,
       SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Region;
SELECT `Customer Name`,
       SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY `Customer Name`
ORDER BY Total_Sales DESC
LIMIT 10;
SELECT `Product Name`,
       SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 10;
