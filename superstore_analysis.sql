-- ============================================================
-- Superstore Sales Analysis
-- Tool: MySQL
-- Author: Preethi Vudugula
-- Dataset: Sample Superstore (2020-2023)
-- ============================================================

-- ─────────────────────────────────────────
-- QUICK REFERENCE: ORIGINAL QUERIES
-- (Simple versions — useful for fast checks)
-- ─────────────────────────────────────────

-- Total row count
SELECT COUNT(*) AS Total_Rows
FROM superstore;

-- Sales by Category (simple)
SELECT Category,
       ROUND(SUM(Sales), 2) AS Total_Sales
FROM superstore
GROUP BY Category
ORDER BY Total_Sales DESC;

-- Top 10 Customers by Sales
SELECT Customer_Name,
       ROUND(SUM(Sales), 2) AS Total_Sales
FROM superstore
GROUP BY Customer_Name
ORDER BY Total_Sales DESC
LIMIT 10;

-- Profit by Region (simple)
SELECT Region,
       ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY Region
ORDER BY Total_Profit DESC;

-- ═══════════════════════════════════════════
-- FULL ANALYSIS (with margins, trends, depth)
-- ═══════════════════════════════════════════

-- ─────────────────────────────────────────
-- STEP 1: CREATE DATABASE & TABLE
-- ─────────────────────────────────────────

CREATE DATABASE IF NOT EXISTS superstore_db;
USE superstore_db;

CREATE TABLE IF NOT EXISTS superstore (
    Row_ID        INT,
    Order_ID      VARCHAR(20),
    Order_Date    DATE,
    Ship_Date     DATE,
    Ship_Mode     VARCHAR(30),
    Customer_ID   VARCHAR(20),
    Customer_Name VARCHAR(100),
    Segment       VARCHAR(30),
    Country       VARCHAR(50),
    City          VARCHAR(50),
    State         VARCHAR(50),
    Postal_Code   VARCHAR(10),
    Region        VARCHAR(20),
    Product_ID    VARCHAR(20),
    Category      VARCHAR(30),
    Sub_Category  VARCHAR(30),
    Product_Name  VARCHAR(200),
    Sales         DECIMAL(10,4),
    Quantity      INT,
    Discount      DECIMAL(5,4),
    Profit        DECIMAL(10,4)
);

-- ─────────────────────────────────────────
-- STEP 2: OVERALL PERFORMANCE SUMMARY
-- ─────────────────────────────────────────

SELECT
    ROUND(SUM(Sales), 2)                          AS Total_Sales,
    ROUND(SUM(Profit), 2)                         AS Total_Profit,
    COUNT(DISTINCT Order_ID)                      AS Total_Orders,
    COUNT(DISTINCT Customer_ID)                   AS Total_Customers,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2)      AS Profit_Margin_Pct
FROM superstore;

-- ─────────────────────────────────────────
-- STEP 3: SALES & PROFIT BY REGION
-- ─────────────────────────────────────────

SELECT
    Region,
    ROUND(SUM(Sales), 2)                          AS Total_Sales,
    ROUND(SUM(Profit), 2)                         AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2)      AS Profit_Margin_Pct,
    COUNT(DISTINCT Order_ID)                      AS Orders
FROM superstore
GROUP BY Region
ORDER BY Total_Profit DESC;

-- ─────────────────────────────────────────
-- STEP 4: SALES & PROFIT BY CATEGORY
-- ─────────────────────────────────────────

SELECT
    Category,
    ROUND(SUM(Sales), 2)                          AS Total_Sales,
    ROUND(SUM(Profit), 2)                         AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2)      AS Profit_Margin_Pct
FROM superstore
GROUP BY Category
ORDER BY Total_Sales DESC;

-- ─────────────────────────────────────────
-- STEP 5: TOP 5 MOST PROFITABLE SUB-CATEGORIES
-- ─────────────────────────────────────────

SELECT
    Sub_Category,
    ROUND(SUM(Sales), 2)                          AS Total_Sales,
    ROUND(SUM(Profit), 2)                         AS Total_Profit
FROM superstore
GROUP BY Sub_Category
ORDER BY Total_Profit DESC
LIMIT 5;

-- ─────────────────────────────────────────
-- STEP 6: BOTTOM 5 SUB-CATEGORIES (LOSS-MAKERS)
-- ─────────────────────────────────────────

SELECT
    Sub_Category,
    ROUND(SUM(Sales), 2)                          AS Total_Sales,
    ROUND(SUM(Profit), 2)                         AS Total_Profit
FROM superstore
GROUP BY Sub_Category
ORDER BY Total_Profit ASC
LIMIT 5;

-- ─────────────────────────────────────────
-- STEP 7: PERFORMANCE BY CUSTOMER SEGMENT
-- ─────────────────────────────────────────

SELECT
    Segment,
    ROUND(SUM(Sales), 2)                          AS Total_Sales,
    ROUND(SUM(Profit), 2)                         AS Total_Profit,
    COUNT(DISTINCT Customer_ID)                   AS Customers,
    ROUND(SUM(Sales) / COUNT(DISTINCT Order_ID), 2) AS Avg_Order_Value
FROM superstore
GROUP BY Segment
ORDER BY Total_Profit DESC;

-- ─────────────────────────────────────────
-- STEP 8: MONTHLY SALES TREND
-- ─────────────────────────────────────────

SELECT
    DATE_FORMAT(Order_Date, '%Y-%m')              AS Month,
    ROUND(SUM(Sales), 2)                          AS Monthly_Sales,
    ROUND(SUM(Profit), 2)                         AS Monthly_Profit
FROM superstore
GROUP BY Month
ORDER BY Month;

-- ─────────────────────────────────────────
-- STEP 9: IMPACT OF DISCOUNT ON PROFIT
-- ─────────────────────────────────────────

SELECT
    CASE
        WHEN Discount = 0            THEN 'No Discount'
        WHEN Discount BETWEEN 0 AND 0.2 THEN 'Low (0-20%)'
        WHEN Discount BETWEEN 0.2 AND 0.4 THEN 'Medium (20-40%)'
        ELSE 'High (40%+)'
    END                                           AS Discount_Tier,
    COUNT(*)                                      AS Orders,
    ROUND(SUM(Sales), 2)                          AS Total_Sales,
    ROUND(SUM(Profit), 2)                         AS Total_Profit,
    ROUND(AVG(Profit), 2)                         AS Avg_Profit_Per_Order
FROM superstore
GROUP BY Discount_Tier
ORDER BY Total_Profit DESC;

-- ─────────────────────────────────────────
-- STEP 10: TOP 10 CUSTOMERS BY REVENUE
-- ─────────────────────────────────────────

SELECT
    Customer_Name,
    Segment,
    Region,
    ROUND(SUM(Sales), 2)                          AS Total_Sales,
    ROUND(SUM(Profit), 2)                         AS Total_Profit,
    COUNT(DISTINCT Order_ID)                      AS Orders
FROM superstore
GROUP BY Customer_Name, Segment, Region
ORDER BY Total_Sales DESC
LIMIT 10;

-- ─────────────────────────────────────────
-- STEP 11: TOP 10 STATES BY PROFIT
-- ─────────────────────────────────────────

SELECT
    State,
    Region,
    ROUND(SUM(Sales), 2)                          AS Total_Sales,
    ROUND(SUM(Profit), 2)                         AS Total_Profit
FROM superstore
GROUP BY State, Region
ORDER BY Total_Profit DESC
LIMIT 10;

-- ─────────────────────────────────────────
-- STEP 12: SHIPPING MODE ANALYSIS
-- ─────────────────────────────────────────

SELECT
    Ship_Mode,
    COUNT(Order_ID)                               AS Total_Orders,
    ROUND(SUM(Sales), 2)                          AS Total_Sales,
    ROUND(AVG(DATEDIFF(Ship_Date, Order_Date)), 1) AS Avg_Ship_Days
FROM superstore
GROUP BY Ship_Mode
ORDER BY Total_Orders DESC;
