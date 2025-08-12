# Sales Trend Analysis Using Aggregations

## 📌 Project Overview
This project analyzes **monthly revenue** and **order volume** from the `online_sales` dataset using SQL aggregations.  
It is part of the **Task 6** assignment for sales trend reporting.

 🛠 Tools & Technologies
- **MySQL Workbench** – For database management and running SQL queries  
- **CSV Dataset** – `online_sales.csv` containing:
  - `order_date`
  - `amount`
  - `product_id`
  - `order_id`

 📂 Steps Performed

1️⃣ Import Data into MySQL
- Used **Table Data Import Wizard** in MySQL Workbench.
- Created table `online_sales` from CSV file.

 2️⃣ Convert Date Column
sql
ALTER TABLE online_sales ADD COLUMN order_date_new DATE;
UPDATE online_sales
SET order_date_new = STR_TO_DATE(order_date, '%m/%d/%Y')
WHERE order_date IS NOT NULL;

3️⃣ Monthly Sales Trend Query
sql
Copy
Edit
SELECT 
    YEAR(order_date_new) AS sales_year,
    MONTH(order_date_new) AS sales_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders

* Learning Outcomes
Imported and cleaned data in MySQL.

Used SUM() and COUNT(DISTINCT) for aggregation.

Grouped & sorted data by Year and Month.


 Files in Repository
* README.md – Project documentation

* sales.sql – SQL queries used for analysis.

* online_sales.csv – Source dataset.

FROM online_sales
GROUP BY sales_year, sales_month
ORDER BY sales_year, sales_month;
