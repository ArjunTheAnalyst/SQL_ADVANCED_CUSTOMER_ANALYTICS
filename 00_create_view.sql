DROP VIEW IF EXISTS cohort_analysis; -- FOR CLEAN RE-RUNS AND IDEMPOTENCY


CREATE VIEW cohort_analysis AS

SELECT DISTINCT
	Sales.CustomerKey,
	TRIM(Customer.[Name]) AS Customer_Name,
	TRIM(Customer.Country) AS Country,
	Customer.Age,
	Sales.[Order Date] AS Order_Date,
	ROUND(
	SUM((Sales.[Net Price] * Sales.Quantity) / Sales.[Exchange Rate]) OVER(PARTITION BY Sales.CustomerKey, Sales.[Order Date]), 0) AS Customer_Daily_Net_Revenue,
	COUNT(Sales.[Order Number]) OVER(PARTITION BY Sales.CustomerKey, Sales.[Order Date]) AS Customer_Daily_Order_Count,
	MIN(Sales.[Order Date]) OVER(PARTITION BY Sales.CustomerKey) AS First_Purchase_Date,
	YEAR(MIN(Sales.[Order Date]) OVER(PARTITION BY Sales.CustomerKey)) AS Cohort_Year
FROM
	Sales
INNER JOIN
	Customer
ON
	Sales.CustomerKey = Customer.CustomerKey;

SELECT '=== DISPLAY VIEW ===' AS info_message;
SELECT * FROM cohort_analysis;