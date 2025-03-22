-- queries.sql
-- all the queries neded to be performed are executed in this file

USE pharmacy_db;

-- Retrieving Top-Selling Medicines per Region:
EXPLAIN ANALYZE
SELECT 
    u.region, 
    m.name AS medicine, 
    SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN orders o ON oi.order_id = o.id
JOIN users u ON o.customer_id = u.id
JOIN medicines m ON oi.medicine_id = m.id
GROUP BY u.region, m.name
ORDER BY u.region, total_sold DESC;

-- Calculating Inventory Turnover Rate:
EXPLAIN ANALYZE
SELECT 
    m.name AS medicine, 
    (SUM(oi.quantity) / NULLIF(m.stock, 0)) AS turnover_rate
FROM order_items oi
JOIN medicines m ON oi.medicine_id = m.id
GROUP BY m.id
ORDER BY turnover_rate DESC;

-- Identifying Frequent Customers Based on Purchase History:
EXPLAIN ANALYZE
SELECT 
    u.id, 
    u.full_name, 
    u.email, 
    COUNT(o.id) AS total_orders, 
    SUM(o.total_amount) AS total_spent
FROM users u
JOIN orders o ON u.id = o.customer_id
GROUP BY u.id
ORDER BY total_orders DESC, total_spent DESC;
