# 📊 Advanced Customer Lifecycle Analytics with SQL
## 📖 Project Overview

This project applies advanced SQL analytics techniques to understand customer behavior, revenue generation, retention, and lifetime value.

Using transactional retail data, the analysis explores how customers contribute revenue over time, how they can be segmented based on value, and how retention and churn vary across acquisition cohorts.

The project demonstrates practical applications of SQL for customer analytics and business intelligence.

## 📄 Data Source Information

This project uses the **Contoso V2 100K** retail dataset, containing transactional sales and customer data spanning **2015–2024**.

The dataset includes:
  * 🛒 Sales transactions and order history

  * 👥 Customer information and demographics

  * 💰 Revenue and pricing data

  * 🌍 Geographic attributes

  * 📅 Purchase dates and customer activity timelines

> Note: The dataset is not included in this repository. The project focuses on demonstrating analytical techniques and business problem-solving using SQL.

## 🛠️ SQL Concepts Demonstrated
### 🔹 Data Query Language (DQL)

  * SELECT

  * DISTINCT

  * WHERE

  * ORDER BY

  * GROUP BY

  * HAVING

### 🔹 Joins

  * INNER JOIN

### 🔹 Common Table Expressions (CTEs)

  * Multi-step analytical transformations

  * Query modularization

  * Query readability and maintainability

### 🔹 Window Functions

  * ROW_NUMBER()

  * SUM() OVER()

  * COUNT() OVER()

  * AVG() OVER()

  * MIN() OVER()

  * PERCENTILE_CONT()

### 🔹 Analytical Techniques

  * Cohort Analysis

  * Customer Segmentation

  * Lifetime Value (LTV) Analysis

  * Revenue Distribution Analysis

  * Churn Analysis

  * Retention Analysis
Running Totals
Percentile-Based Classification

## 📋 Analysis Performed
### 0️⃣ Customer Analytics View Creation

Created a reusable analytical view that serves as the foundation for all subsequent analyses.

The view includes:
 * Customer information

 * Customer demographics

 * Daily customer revenue

 * Daily order counts

 * First purchase date

 * Cohort assignment

#### 🎯 Business Objective

Create a centralized analytical dataset for customer lifecycle analysis.

### 1️⃣ Customer Lifetime Value (LTV) & Segmentation Analysis

Calculated customer lifetime value and segmented customers using percentile-based thresholds.

#### Customer Segments
🟢 Low Value   : Bottom 25%<br>
🟡 Mid Value   : 	25th–75th Percentile<br>
🔴 High Value  : 	Top 25%

#### Metrics Analyzed
 * Customer Lifetime Value (LTV)

 * Revenue Contribution by Segment

 * Customer Distribution by Segment

 * Average Customer LTV

#### 🎯 Business Value

Identify high-value customers and understand how revenue is distributed across customer segments.

### 2️⃣ Cohort Revenue Analysis

Evaluated customer acquisition cohorts to understand revenue generation patterns over time.

#### Metrics Analyzed
 * Cohort Revenue

 * Customer Count

 * Average Revenue Per Customer

 * First-Purchase Revenue

 * Revenue by Customer Age

 * Cumulative Revenue Contribution

#### 🎯 Business Value

Measure customer monetization patterns and compare the long-term performance of acquisition cohorts.

### 3️⃣ Customer Retention & Churn Analysis

Classified customers based on purchasing activity and measured retention performance across cohorts.

#### Metrics Analyzed
 * Active Customers
 * Churned Customers
 * Cohort Retention Distribution
 * Cohort Churn Percentage

#### 🎯 Business Objective

Understand customer retention trends and identify long-term attrition patterns across acquisition cohorts.

## ❓ Key Business Questions Answered
### 💰 Customer Value

 * Which customers generate the highest lifetime value?

 * How concentrated is revenue among customer segments?

### 📈 Cohort Performance

 * Which customer cohorts generate the most revenue?

 * How does customer value vary across acquisition years?

### 📊 Revenue Analysis

 * How quickly do customers generate revenue after acquisition?

 * What percentage of total revenue is generated throughout the customer lifecycle?

### 🔄 Retention & Churn

 * What proportion of customers become inactive?

 * Which cohorts demonstrate the strongest retention performance?

## 🚀 Skills Demonstrated
 * ✅ Advanced SQL
 * ✅ Customer Analytics
 * ✅ Customer Lifetime Value (LTV) Analysis
 * ✅ Customer Segmentation
 * ✅ Cohort Analysis
 * ✅ Revenue Analytics
 * ✅ Retention Analysis
 * ✅ Churn Analysis
 * ✅ Window Functions
 * ✅ Common Table Expressions (CTEs)
 * ✅ Business Intelligence
 * ✅ Analytical Problem Solving

## 🎯 Learning Outcomes

This project demonstrates how SQL can be used to solve real-world customer analytics problems by transforming transactional data into meaningful business insights.

Key learnings include:

 * Measuring customer lifetime value

 * Segmenting customers based on revenue contribution

 * Evaluating cohort performance

 * Analyzing customer retention and churn

 * Understanding customer monetization patterns

 * Applying advanced SQL techniques for business analysis

## ⭐ Conclusion

The goal of this project is to showcase practical SQL skills through customer-focused business analytics, demonstrating how structured querying techniques can be used to support data-driven decision-making.
