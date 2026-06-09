SELECT '=== DISPLAY VIEW ===' AS info_message;
SELECT * FROM cohort_analysis;


--CUSTOMER LIFETIME VALUE (LTV) SEGMENTATION USING PERCENTILE THRESHOLDS
WITH customer_ltv AS
(SELECT
	CustomerKey,
	SUM(Customer_Daily_Net_Revenue) AS Customer_LTV
FROM
	cohort_analysis
GROUP BY
	CustomerKey),

ltv_thresholds AS
(SELECT DISTINCT
	PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY Customer_LTV) OVER() AS P25_LTV,
	PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY Customer_LTV) OVER() AS P75_LTV
FROM
	customer_ltv),

customer_segments AS
(SELECT
	customer_ltv.CustomerKey,
	customer_ltv.Customer_LTV,
	CASE
		WHEN customer_ltv.Customer_LTV <= ltv_thresholds.P25_LTV THEN '1 - LOW_VALUE'
		WHEN customer_ltv.Customer_LTV <= ltv_thresholds.P75_LTV THEN '2 - MID_VALUE'
		ELSE '3 - HIGH_VALUE'
	END AS Customer_Segment
FROM
	customer_ltv
CROSS JOIN
	ltv_thresholds)

SELECT DISTINCT
	Customer_Segment,
	SUM(Customer_LTV) OVER(PARTITION BY Customer_Segment) AS Segment_LTV,
	ROUND(
	(
	SUM(Customer_LTV) OVER(PARTITION BY Customer_Segment)
	/
	SUM(Customer_LTV) OVER()
	)
	* 100, 2) AS Segment_LTV_Percentage,
	COUNT(CustomerKey) OVER(PARTITION BY Customer_Segment) AS Customer_Count,
	ROUND(
	AVG(Customer_LTV) OVER(PARTITION BY Customer_Segment), 2) AS Average_Customer_LTV
FROM
	customer_segments
ORDER BY
	Customer_Segment;