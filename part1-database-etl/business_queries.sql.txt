-- Query 1: Customer Purchase History
SELECT CONCAT(c.first_name, ' ', c.last_name) customer_name, c.email, COUNT(o.order_id) total_orders, SUM(oi.subtotal) total_spent
FROM customers c JOIN orders o ON c.customer_id=o.customer_id JOIN order_items oi ON o.order_id=oi.order_id 
GROUP BY c.customer_id HAVING COUNT(o.order_id)>=2 AND SUM(oi.subtotal)>5000 ORDER BY total_spent DESC;

-- Query 2: Product Sales Analysis
SELECT p.category, COUNT(DISTINCT p.product_id) num_products, SUM(oi.quantity) total_quantity_sold, SUM(oi.subtotal) total_revenue
FROM products p JOIN order_items oi ON p.product_id=oi.product_id GROUP BY p.category HAVING SUM(oi.subtotal)>10000 ORDER BY total_revenue DESC;

-- Query 3: Monthly Sales Trend  
SELECT DATE_FORMAT(o.order_date,'%M') month_name, COUNT(o.order_id) total_orders, SUM(oi.subtotal) monthly_revenue,
SUM(SUM(oi.subtotal)) OVER(ORDER BY o.order_date ROWS UNBOUNDED PRECEDING) cumulative_revenue
FROM orders o JOIN order_items oi ON o.order_id=oi.order_id WHERE YEAR(o.order_date)=2024 
GROUP BY MONTH(o.order_date) ORDER BY MONTH(o.order_date);
