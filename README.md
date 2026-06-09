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

# 📋 Analysis Performed
## 0️⃣ Customer Analytics View Creation

A reusable analytical view was created to serve as the foundation for all subsequent analyses.

The view includes:
 * Customer information

 * Customer demographics

 * Daily customer revenue

 * Daily order counts

 * First purchase date

 * Cohort assignment

###🎯 Objective

Create a centralized analytical dataset for customer lifecycle analysis.

## 1️⃣ Customer Lifetime Value (LTV) Segmentation

Customers are segmented using percentile thresholds based on their lifetime revenue contribution.

### Customer Segments
🟢 Low Value   : Bottom 25%<br>
🟡 Mid Value   : 	25th–75th Percentile<br>
🔴 High Value  : 	Top 25%

### Metrics Analyzed
 * Segment LTV

 * Revenue Contribution Percentage

 * Customer Count

 * Average Customer LTV

### 🎯 Business Value

Identify high-value customers and understand how revenue is distributed across customer segments.
