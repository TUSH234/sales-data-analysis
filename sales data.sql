USE xyz;
SELECT * FROM `online_sales` LIMIT 10;

ALTER TABLE online_sales 
ADD COLUMN order_date_new DATE;

SET SQL_SAFE_UPDATES = 0;

UPDATE online_sales
SET order_date_new = STR_TO_DATE(order_date, '%m/%d/%Y')
WHERE order_date IS NOT NULL;

SET SQL_SAFE_UPDATES = 1; -- Turn it back on

ALTER TABLE online_sales 
DROP COLUMN order_date;

ALTER TABLE online_sales 
CHANGE COLUMN order_date_new order_date DATE;


SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM online_sales
GROUP BY
    YEAR(order_date), MONTH(order_date)
ORDER BY year, month;


SELECT * FROM `online_sales`;