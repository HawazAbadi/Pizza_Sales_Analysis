

--CREATE DATABASE Pizza_DA

--EXEC sp_rename 'dbo.[pizza_sales_excel_file.xlsx - pizza_sales]', 'pizza_sales';

SELECT * FROM [dbo].[pizza_sales]

--Total Revenue – Sum of all pizza order prices.
SELECT SUM(total_price) AS TOTAL_REVENUE FROM [dbo].[pizza_sales]

--Average Order Value – Total revenue ÷ number of orders.
SELECT SUM(total_price) / COUNT(DISTINCT order_id)AS Avg_Order_Valuee FROM [dbo].[pizza_sales]

--Total Pizzas Sold – Sum of all pizza quantities sold.
SELECT SUM(quantity) AS Total_pizza_Sold FROM [dbo].[pizza_sales]

SELECT COUNT(DISTINCT order_id) AS Total_Order FROM [dbo].[pizza_sales]

-- Total Orders – Count of all orders placed.
SELECT SUM(quantity) / COUNT(DISTINCT order_id) FROM [dbo].[pizza_sales]

-- Average Pizzas per Order – Total pizzas sold ÷ number of orders.

SELECT CAST(CAST(SUM(quantity)AS DECIMAL (10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL (10,2)) AS DECIMAL (10,2)) AS Avg_Pizza_Per_Order FROM [dbo].[pizza_sales]


-- DAILY TRAND FOR TOTAL ORDERS

SELECT DATENAME(DW, ORDER_DATE) AS Order_Day, COUNT(DISTINCT order_id) AS Total_orders FROM [dbo].[pizza_sales]
GROUP BY DATENAME(DW, ORDER_DATE)

-- MONTHLY TRAND FOR TOTAL ORDERS

SELECT DATENAME(MONTH, order_date) AS Month_Name, COUNT(DISTINCT order_id) AS Total_Orders
FROM [dbo].[pizza_sales]
GROUP BY DATENAME(MONTH, order_date), MONTH(order_date)
ORDER BY MONTH(order_date);

--- PERCENTAGE OF SALES BY PIZZA CATEGORY

SELECT pizza_category,SUM(total_price) AS Total_Sales, SUM(total_price) * 100.0 / (SELECT SUM(total_price) FROM [dbo].[pizza_sales] WHERE MONTH(order_date) = 1) AS PCT
FROM [dbo].[pizza_sales]
WHERE MONTH(order_date) = 1
GROUP BY pizza_category
ORDER BY PCT DESC;

-- PERCENTAGE OF SALES BY PIZZA SIZE

SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2))  AS Total_Sales, CAST(SUM(total_price) * 100.0 / (SELECT SUM(total_price) FROM [dbo].[pizza_sales]) AS DECIMAL(10,2)) AS PCT
FROM [dbo].[pizza_sales]
WHERE DATEPART(QUARTER, order_date) = 1
GROUP BY pizza_size
ORDER BY PCT DESC;

-- TOTAL PIZZAS SOLD BY PIZZA CATEGORY
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM [dbo].[pizza_sales]
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

-- TOP 5 BEST SELLERS BY REVENUE
SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM [dbo].[pizza_sales]
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

-- TOP 5 BEST TOTAL QUANTITY 
SELECT TOP 5 
    pizza_name,
    SUM(quantity) AS Total_Quantity
FROM [dbo].[pizza_sales]
GROUP BY pizza_name
ORDER BY Total_Quantity DESC;

-- TOP 5 BEST TOTAL ORDERS
SELECT TOP 5 
    pizza_name,
    COUNT(DISTINCT order_id) AS Total_Orders
FROM [dbo].[pizza_sales]
GROUP BY pizza_name
ORDER BY Total_Orders DESC;


-- BOTTOM 5 BEST SELLERS BY REVENUE, TOTAL QUANTITY AND TOTAL ORDERS
-- Bottom 5 Best Sellers by Revenue
SELECT TOP 5 
    pizza_name,
    SUM(total_price) AS Total_Revenue
FROM [dbo].[pizza_sales]
GROUP BY pizza_name
ORDER BY Total_Revenue ASC;

-- Bottom 5 by Quantity
SELECT TOP 5 
    pizza_name,
    SUM(quantity) AS Total_Quantity
FROM [dbo].[pizza_sales]
GROUP BY pizza_name
ORDER BY Total_Quantity ASC;


-- ===================================================
