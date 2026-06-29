CREATE DATABASE superstore_week3;
USE superstore_week3;
USE superstore_week3;

RENAME TABLE `sample - superstore` TO superstore_raw;
CREATE TABLE customers AS
SELECT DISTINCT
    `Customer ID`,
    `Customer Name`
FROM superstore_raw;
CREATE TABLE orders AS
SELECT DISTINCT
    `Order ID`,
    `Customer ID`,
    Sales
FROM superstore_raw;
CREATE TABLE products AS
SELECT DISTINCT
    `Product ID`,
    `Product Name`,
    Category,
    `Sub-Category`
FROM superstore_raw;
SELECT *
FROM superstore_raw
WHERE Sales >
(
SELECT AVG(Sales)
FROM superstore_raw
);
SELECT *
FROM superstore_raw s1
WHERE Sales =
(
SELECT MAX(Sales)
FROM superstore_raw s2
WHERE s1.`Customer ID` = s2.`Customer ID`
);
WITH customer_sales AS
(
    SELECT
        `Customer ID`,
        SUM(Sales) AS Total_Sales
    FROM superstore_raw
    GROUP BY `Customer ID`
)
SELECT *
FROM customer_sales;
SELECT
    `Customer ID`,
    Sales,
    ROW_NUMBER() OVER(ORDER BY Sales DESC) AS Row_No
FROM superstore_raw;
SELECT
    `Customer ID`,
    SUM(Sales) AS Total_Sales,
    RANK() OVER(ORDER BY SUM(Sales) DESC) AS Customer_Rank
FROM superstore_raw
GROUP BY `Customer ID`;
WITH customer_sales AS
(
    SELECT
        `Customer ID`,
        SUM(Sales) AS Total_Sales
    FROM superstore_raw
    GROUP BY `Customer ID`
)

SELECT
    c.`Customer Name`,
    cs.Total_Sales,
    RANK() OVER(ORDER BY cs.Total_Sales DESC) AS Customer_Rank
FROM customer_sales cs
JOIN customers c
ON cs.`Customer ID` = c.`Customer ID`;
SELECT
    `Customer ID`,
    SUM(Sales) AS Total_Sales
FROM superstore_raw
GROUP BY `Customer ID`
ORDER BY Total_Sales DESC
LIMIT 10;
SELECT
    `Customer ID`,
    SUM(Sales) AS Total_Sales
FROM superstore_raw
GROUP BY `Customer ID`
HAVING SUM(Sales) < 1000;
