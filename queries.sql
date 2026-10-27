-- ============================================================================
-- Project: Sample Superstore Sales & Profitability Analysis
-- Author: Lithish Kumar G
-- Description: Advanced SQL analytical queries exploring retail sales performance,
--              customer segment profitability, regional metrics, and ranking.
-- ============================================================================

-- 1. High-Level Performance Metrics by Region & Category
SELECT 
    Region,
    Category,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin_Pct
FROM superstore_sales
GROUP BY Region, Category
ORDER BY Region, Total_Sales DESC;


-- 2. Ranking Top Performing Sub-Categories within Each Region (Window Function)
WITH RankedSubCategories AS (
    SELECT 
        Region,
        Sub_Category,
        ROUND(SUM(Sales), 2) AS SubCategory_Sales,
        ROUND(SUM(Profit), 2) AS SubCategory_Profit,
        DENSE_RANK() OVER (
            PARTITION BY Region 
            ORDER BY SUM(Profit) DESC
        ) AS Profit_Rank_In_Region
    FROM superstore_sales
    GROUP BY Region, Sub_Category
)
SELECT 
    Region,
    Sub_Category,
    SubCategory_Sales,
    SubCategory_Profit,
    Profit_Rank_In_Region
FROM RankedSubCategories
WHERE Profit_Rank_In_Region <= 3
ORDER BY Region, Profit_Rank_In_Region;


-- 3. Customer Segment Profitability & Discount Impact (CASE Expressions & Subquery)
SELECT 
    Segment,
    Discount_Tier,
    COUNT(Order_ID) AS Total_Transactions,
    ROUND(AVG(Sales), 2) AS Avg_Order_Value,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(AVG(Discount) * 100, 1) AS Avg_Discount_Pct
FROM (
    SELECT 
        Order_ID,
        Segment,
        Sales,
        Profit,
        Discount,
        CASE 
            WHEN Discount = 0 THEN 'No Discount (0%)'
            WHEN Discount > 0 AND Discount <= 0.20 THEN 'Low Discount (1-20%)'
            WHEN Discount > 0.20 AND Discount <= 0.50 THEN 'Moderate Discount (21-50%)'
            ELSE 'High Discount (>50%)'
        END AS Discount_Tier
    FROM superstore_sales
) AS DiscountSegments
GROUP BY Segment, Discount_Tier
HAVING SUM(Sales) > 1000
ORDER BY Segment, Total_Profit DESC;


-- 4. Identifying Loss-Making Product Sub-Categories with High Sales Volume (HAVING Clause)
SELECT 
    Category,
    Sub_Category,
    ROUND(SUM(Sales), 2) AS Gross_Sales,
    ROUND(SUM(Profit), 2) AS Net_Loss,
    ROUND(AVG(Discount) * 100, 1) AS Average_Discount
FROM superstore_sales
GROUP BY Category, Sub_Category
HAVING SUM(Profit) < 0
ORDER BY Net_Loss ASC;


-- 5. Cumulative Running Sales by Region over Time (Window Function)
SELECT 
    Order_Date,
    Region,
    Sales,
    ROUND(SUM(Sales) OVER (
        PARTITION BY Region 
        ORDER BY Order_Date 
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ), 2) AS Running_Total_Sales
FROM superstore_sales
LIMIT 50;
