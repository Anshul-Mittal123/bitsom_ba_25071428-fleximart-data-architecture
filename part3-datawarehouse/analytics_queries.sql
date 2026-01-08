-- Query 1: Monthly Sales Drill-Down Analysis
-- Business Scenario:"The CEO wants to see sales performance broken down by time periods. Start with yearly total, then quarterly, then monthly sales for 2024."
-- Demonstrates: Drill-down from Year to Quarter to Month

SELECT d.year, d.quarter, d.month_name, SUM(f.total_amount) total_sales, SUM(f.quantity_sold) total_quantity
FROM fact_sales f JOIN dim_date d ON f.date_key=d.date_key GROUP BY d.year, d.quarter, d.month ORDER BY d.year, d.quarter, d.month;

-- Query 2: Top 10 Products by Revenue
-- Business Scenario:"The product manager needs to identify top-performing products. Show the top 10 products by revenue, along with their category, total units sold, and revenue contribution percentage."
-- Includes: Revenue percentage calculation

SELECT p.product_name, p.category, SUM(f.quantity_sold) units_sold, SUM(f.total_amount) revenue,
ROUND(SUM(f.total_amount)*100 / SUM(SUM(f.total_amount)) OVER(), 1) revenue_percentage
FROM fact_sales f JOIN dim_product p ON f.product_key=p.product_key GROUP BY p.product_key ORDER BY revenue DESC LIMIT 10;

-- Query 3: Customer Segmentation
-- Business Scenario:"Marketing wants to target high-value customers. Segment customers into 'High Value' (>₹50,000 spent), 'Medium Value' (₹20,000-₹50,000), and 'Low Value' (<₹20,000). Show count of customers and total revenue in each segment."
-- Segments: High/Medium/Low value customers

SELECT 
  CASE 
    WHEN total_spent > 50000 THEN 'High Value'
    WHEN total_spent > 20000 THEN 'Medium Value'
    ELSE 'Low Value' 
  END customer_segment,
  COUNT(*) customer_count, 
  SUM(total_spent) total_revenue,
  ROUND(AVG(total_spent),0) avg_revenue
FROM (SELECT SUM(f.total_amount) total_spent, c.customer_key FROM fact_sales f JOIN dim_customer c ON f.customer_key=c.customer_key GROUP BY c.customer_key) t
GROUP BY CASE WHEN total_spent > 50000 THEN 'High Value' WHEN total_spent > 20000 THEN 'Medium Value' ELSE 'Low Value' END;
