### **Banking Customer & Transaction Analysis Project**
## **Overview**

With the rapid growth of digital banking, fraudulent transactions have become a significant concern for financial institutions.
This project focuses on analyzing banking customer and transaction data to identify:

- Customer segments
- Transaction trends
- Risk indicators for fraud

It also includes calculation of key KPIs and dashboard visualizations to support data-driven decision-making.

### **Problem Statement**

With the rapid growth of digital banking, financial institutions face increasing challenges in monitoring customer behavior, transaction patterns, and potential fraudulent activities. This project aims to analyze banking customer and transaction data using SQL and Python to identify customer segments, transaction trends, and risk indicators. Additionally, KPI dashboards were developed to support data-driven decision-making.

### Folder Description
- **Database**: MySQL (SQL queries for aggregation, segmentation, and KPIs)

- **Python**: Pandas, NumPy, Matplotlib (EDA, visualizations, KPI validation)

- **Visualization / Dashboard**: Power BI / Tableau

- **Dataset**: Customers.csv, Accounts.csv, Transactions.csv

## Project Steps

### Step 1: Data Understanding
- Explored datasets to understand features, types, and relationships.
- Checked for missing values, duplicates, and inconsistencies.

### Step 2: Data Cleaning
- Converted date fields to proper formats.
- Handled missing or inconsistent values.
- Removed duplicates.

### Step 3: Database Setup
- Created `customers`, `accounts`, and `transactions` tables.
- Established primary and foreign keys.
- Imported CSVs using `LOAD DATA`.

### Step 4: Exploratory Data Analysis (EDA)
- Analyzed transaction distribution, device usage, and merchant categories.
- Visualized fraud vs non-fraud trends.
- Identified anomalies and patterns.

### Step 5: Customer Segmentation
- Segmented customers based on:
  - Transaction frequency (High / Medium / Low)
  - Transaction value (High / Medium / Low)
  - Risk (High-Risk / Low-Risk)

### Step 6: Transaction Trend Analysis
- Tracked daily and monthly transaction volumes.
- Analyzed transaction amount trends.
- Monitored fraud trends over time.

### Step 7: Fraud & Risk Indicator Analysis
- Identified suspicious patterns:
  - High transaction amounts relative to customer average
  - Multiple transactions in a short period
  - High-risk merchant categories and device types
- Created fraud summary and high-risk customer lists.

### Step 8: KPI Calculation & Validation
- Core KPIs:
  - Total Customers
  - Total Transactions
  - Total Transaction Value
  - Average Transaction Value
  - Fraud Rate (%)
  - High-Risk Customers Count
  - Transactions by Device Type
  - Transactions by Merchant Category
- Validated KPIs using SQL and Python (Jupyter Notebook).

### Step 9: Dashboard Visualization
- Created interactive charts and dashboards for:
  - Customer segmentation
  - Transaction trends
  - Fraud patterns
  - Device & merchant analysis
  
 ## Key Insights

- Most fraud occurs in high-value transactions.
- Certain merchant categories and devices show higher fraud risk.
- A small percentage of customers contribute the majority of transactions.
- Peak transaction periods identified for resource planning and monitoring.

## Future Improvements

- Implement real-time fraud detection using machine learning.
- Add geolocation and transaction location analysis.
- Automate daily KPI monitoring dashboards.

## Conclusion

This project demonstrates an end-to-end analysis of banking customer and transaction data to identify trends, customer segments, and potential fraud risks.

**Key takeaways:**

- **Customer Segmentation:** Categorized customers based on transaction behavior, value, and risk.  
- **Transaction Trend Analysis:** Revealed peak periods, spending patterns, and growth trends.  
- **Fraud & Risk Analysis:** Identified high-risk customers, merchant categories, and devices contributing to fraudulent activities.  
- **KPIs and Dashboard:** Provided actionable insights for management to monitor performance, detect anomalies, and make data-driven decisions.

Overall, this project showcases the ability to combine SQL, Python, and visualization tools to extract meaningful business insights, enhance fraud detection, and support strategic decision-making in digital banking.
