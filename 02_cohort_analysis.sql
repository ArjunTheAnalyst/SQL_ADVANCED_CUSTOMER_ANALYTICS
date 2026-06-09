SELECT '=== DISPLAY VIEW ===' AS info_message;
SELECT * FROM cohort_analysis;


-- CUSTOMER REVENUE BY COHORT (NOT ADJUSTED FOR TIME IN THE MARKET)
SELECT
	Cohort_Year,
	SUM(Customer_Daily_Net_Revenue) AS Cohort_Revenue,
	COUNT(DISTINCT CustomerKey) AS Customer_Count,
	ROUND(
	SUM(Customer_Daily_Net_Revenue)
	/
	COUNT(DISTINCT CustomerKey), 0)
	AS Avg_Revenue_Per_Customer
FROM
	cohort_analysis
GROUP BY
	Cohort_Year;


-- CUSTOMER REVENUE BY COHORT (ADJUSTED FOR TIME IN THE MARKET)
WITH customer_purchase_age AS
(SELECT
	CustomerKey,
	Customer_Daily_Net_Revenue,
	DATEDIFF(DAY, First_Purchase_Date, Order_Date) AS Days_Since_First_Purchase
FROM
	cohort_analysis),

revenue_distribution AS
(SELECT DISTINCT
	Days_Since_First_Purchase,
	SUM(Customer_Daily_Net_Revenue) OVER(PARTITION BY Days_Since_First_Purchase) AS Total_Revenue,
	(
	SUM(Customer_Daily_Net_Revenue) OVER(PARTITION BY Days_Since_First_Purchase)
	/
	SUM(Customer_Daily_Net_Revenue) OVER()
	) * 100
	AS Revenue_Percentage
FROM
	customer_purchase_age)

SELECT
	Days_Since_First_Purchase,
	Total_Revenue,
	Revenue_Percentage,
	SUM(Revenue_Percentage) OVER(ORDER BY Days_Since_First_Purchase)
	AS Cumulative_Revenue_Percentage
FROM
	revenue_distribution;


-- CUSTOMER REVENUE BY COHORT (ADJUSTED FOR TIME IN THE MARKET) - ONLY FIRST PURCHASE
SELECT
	Cohort_Year,
	SUM(Customer_Daily_Net_Revenue) AS Cohort_Revenue,
	COUNT(DISTINCT CustomerKey) AS Customer_Count,
	ROUND(
	SUM(Customer_Daily_Net_Revenue)
	/
	COUNT(DISTINCT CustomerKey), 0)
	AS Avg_Revenue_Per_Customer
FROM
	cohort_analysis
WHERE
	Order_Date = First_Purchase_Date
GROUP BY
	Cohort_Year;