SELECT '=== DISPLAY VIEW ===' AS info_message;
SELECT * FROM cohort_analysis;


-- COHORT-BASED CUSTOMER RETENTION AND CHURN ANALYSIS
WITH ranked_orders AS
(SELECT
	CustomerKey,
	Order_Date,
	First_Purchase_Date,
	ROW_NUMBER() OVER(PARTITION BY CustomerKey ORDER BY Order_Date DESC) AS Order_Recency_Rank,
	Cohort_Year -- Added for cohort-level churn analysis
FROM
	cohort_analysis),

customer_status AS
(SELECT
	CustomerKey,
	Order_Date AS Most_Recent_Order_Date,
	CASE
		WHEN Order_Date <= DATEADD(MONTH, -6, (SELECT MAX(Order_Date) FROM cohort_analysis)) THEN 'CHURNED'
		ELSE 'ACTIVE'
	END AS Customer_Status,
	Cohort_Year -- Added for cohort-level churn analysis
FROM
	ranked_orders
WHERE
	Order_Recency_Rank = 1
AND
	First_Purchase_Date <= DATEADD(MONTH, -6, (SELECT MAX(Order_Date) FROM cohort_analysis)))

SELECT DISTINCT
	Cohort_Year,
	Customer_Status,
	COUNT(CustomerKey) OVER(PARTITION BY Cohort_Year, Customer_Status) AS Customer_Count,
	COUNT(CustomerKey) OVER(PARTITION BY Cohort_Year) AS Total_Cohort_Customers,
	ROUND(
	(
	COUNT(CustomerKey) OVER(PARTITION BY Cohort_Year, Customer_Status)
	/
	CAST(COUNT(CustomerKey) OVER(PARTITION BY Cohort_Year) AS FLOAT)
	) * 100, 2)
	AS Cohort_Customer_Percentage
FROM
	customer_status
ORDER BY
	Cohort_Year,
	Customer_Status;