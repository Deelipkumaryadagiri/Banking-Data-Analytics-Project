use banking_data;
-- Count total customers and transactions
SELECT count(customer_id)
from customers;
select count( customer_id)
 from transactions;

-- Find transactions per customer
select count(transactions.customer_id) as No_of_Transactions , customers.customer_name 
from transactions
left join customers on customers.customer_id = transactions.customer_id
group by transactions.customer_id
order by customers.customer_name ASC;

-- Identify high-value transactions
select customers.customer_name , transactions.transaction_amount
from transactions
left join customers on customers.customer_id = transactions.customer_id
order by transactions.transaction_amount desc;

-- Average Transaction Amount
SELECT AVG(transaction_amount) AS avg_transaction_amount
FROM transactions;

-- Fraud vs Non-Fraud Count
SELECT is_fraud, COUNT(*) AS transaction_count
FROM transactions
GROUP BY is_fraud;


 -- STEP 6: CUSTOMER SEGMENTATION
--    Objective:
--    - Group customers based on transaction behavior, value, and risk

-- Create customer-level summary for segmentation
CREATE VIEW customer_summary AS
SELECT
    customer_id,
    COUNT(*) AS total_transactions,
    SUM(transaction_amount) AS total_transaction_amount,
    AVG(transaction_amount) AS avg_transaction_amount,
    SUM(is_fraud) AS fraud_transaction_count
FROM transactions
GROUP BY customer_id;

-- Transaction frequency segmentation
SELECT
    customer_summary.customer_id,
    customers.customer_name,
    customer_summary.total_transactions,
    CASE
        WHEN total_transactions >= 20 THEN 'High Frequency'
        WHEN total_transactions BETWEEN 10 AND 19 THEN 'Medium Frequency'
        ELSE 'Low Frequency'
    END AS frequency_segment
FROM customer_summary
left join customers on customers.customer_id = customer_summary.customer_id;

-- Transaction value segmentation
SELECT
    customer_id,
    total_transaction_amount,
    CASE
        WHEN total_transaction_amount >= 500000 THEN 'High Value'
        WHEN total_transaction_amount BETWEEN 200000 AND 499999 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS value_segment
FROM customer_summary;

-- Risk-based segmentation
SELECT
    customer_id,
    fraud_transaction_count,
    CASE
        WHEN fraud_transaction_count > 0 THEN 'High Risk'
        ELSE 'Low Risk'
    END AS risk_segment
FROM customer_summary;

--    -- STEP 7: TRANSACTION TREND ANALYSIS
-- --    Objective:
--    - Identify transaction and fraud patterns over time

-- Monthly transaction volume
SELECT
    DATE_FORMAT(transaction_date, '%Y-%m') AS month,
    COUNT(*) AS transaction_count
FROM transactions
GROUP BY month
ORDER BY month;

-- Monthly transaction amount trend
SELECT
    DATE_FORMAT(transaction_date, '%Y-%m') AS month,
    SUM(transaction_amount) AS total_transaction_amount
FROM transactions
GROUP BY month
ORDER BY month;

-- Fraud vs non-fraud trend over time
SELECT
    DATE_FORMAT(transaction_date, '%Y-%m') AS month,
    is_fraud,
    COUNT(*) AS transaction_count
FROM transactions
GROUP BY month, is_fraud
ORDER BY month;



--    STEP 8: FRAUD & RISK INDICATOR ANALYSIS
--    Objective:
--    Detect suspicious and high-risk transaction behavior


-- Transactions with unusually high amount compared to customer average
SELECT
    t.transaction_id,
    t.customer_id,
    t.transaction_amount,
    cs.avg_transaction_amount
FROM transactions t
JOIN customer_summary cs
ON t.customer_id = cs.customer_id
WHERE t.transaction_amount > 3 * cs.avg_transaction_amount;

-- Multiple transactions by same customer in a single day
SELECT
    customer_id,
    DATE(transaction_date) AS transaction_day,
    COUNT(*) AS transaction_count
FROM transactions
GROUP BY customer_id, transaction_day
HAVING transaction_count >= 5;

-- Fraud rate by merchant category
SELECT
    merchant_category,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_transactions,
    ROUND(SUM(is_fraud) * 100.0 / COUNT(*), 2) AS fraud_rate
FROM transactions
GROUP BY merchant_category
ORDER BY fraud_rate DESC;

-- High risk customers based on fraud involvement
SELECT
    customer_id,
    fraud_transaction_count
FROM customer_summary
WHERE fraud_transaction_count >= 2;




