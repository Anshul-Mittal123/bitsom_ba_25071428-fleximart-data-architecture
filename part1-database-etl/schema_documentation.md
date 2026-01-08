#### \# Database Schema Documentation



##### \## Entity-Relationship Description (Text Format)



\### ENTITY: customers

\*\*Purpose:\*\* Stores customer information

\*\*Attributes:\*\*

\- `customer_id`: Unique identifier (Primary Key, AUTO_INCREMENT)

\- `first_name`: Customer's first name (VARCHAR(50) NOT NULL)

\- `last_name`: Customer's last name (VARCHAR(50) NOT NULL)

\- `email`: Unique customer email (VARCHAR(100) UNIQUE NOT NULL)

\- `phone`: Contact number (VARCHAR(20))

\- `city`: Customer city (VARCHAR(50))

\- `registration_date`: Account creation date (DATE)



\*\*Relationships:\*\*

\- One customer can place \*\*MANY\*\* orders (1:M with orders table)



\### ENTITY: products

\*\*Purpose:\*\* Product catalog and inventory

\*\*Attributes:\*\*

\- `product_id`: Unique identifier (Primary Key, AUTO_INCREMENT)

\- `product_name`: Product name (VARCHAR(100) NOT NULL)

\- `category`: Product category (VARCHAR(50) NOT NULL)

\- `price`: Selling price (DECIMAL(10,2) NOT NULL)

\- `stock_quantity`: Available units (INT DEFAULT 0)



\*\*Relationships:\*\*

\- One product appears in \*\*MANY\*\* order_items (1:M)



\### ENTITY: orders

\*\*Purpose:\*\* Records customer purchases

\*\*Attributes:\*\*

\- `order_id`: Unique order ID (Primary Key, AUTO_INCREMENT)

\- `customer_id`: References customers (INT NOT NULL, Foreign Key)

\- `order_date`: Purchase date (DATE NOT NULL)

\- `total_amount`: Order total value (DECIMAL(10,2) NOT NULL)

\- `status`: Processing status (VARCHAR(20) DEFAULT 'Pending')



\*\*Relationships:\*\*

\- One order has \*\*MANY\*\* order_items (1:M)

\- One customer has \*\*MANY\*\* orders (M:1)



\### ENTITY: order_items

\*\*Purpose:\*\* Line items within orders (solves many-to-many)

\*\*Attributes:\*\*

\- `order_item_id`: Unique line ID (Primary Key, AUTO_INCREMENT)

\- `order_id`: References orders (INT NOT NULL, Foreign Key)

\- `product_id`: References products (INT NOT NULL, Foreign Key)

\- `quantity`: Units purchased (INT NOT NULL)

\- `unit_price`: Price per unit (DECIMAL(10,2) NOT NULL)

\- `subtotal`: Line total (quantity × unit_price) (DECIMAL(10,2) NOT NULL)



\## Normalization Explanation (3NF - 230 words)



\*\*Functional Dependencies:\*\*

customer_id → first_name, last_name, email, phone, city

product_id → product_name, category, price, stock_quantity

order_id → customer_id, order_date, total_amount, status

order_item_id → order_id, product_id, quantity, unit_price, subtotal





\*\*3NF Justification:\*\*

1\. \*\*1NF:\*\* All attributes atomic (no repeating groups)

2\. \*\*2NF:\*\* 1NF + no partial dependencies (order_items has full order_id, product_id dependency)

3\. \*\*3NF:\*\* 2NF + no transitive dependencies (customer_id doesn't depend on order_id)



\*\*Anomaly Prevention:\*\*

\- \*\*Update:\*\* Change customer email once (customers table), all orders automatically correct

\- \*\*Insert:\*\* Add new product without order data; new customer without purchase history

\- \*\*Delete:\*\* Delete order_items doesn't lose customer/product data



\*\*Result:\*\* Zero redundancy, maximum data integrity.



\## Sample Data Representation



\### customers (3 records)

| customer_id | first_name | last_name | email | phone | city | registration_date |

|-------------|------------|-----------|-------|-------|------|------------------|

| 1 | Amit | Sharma | amit@email.com | +919876543210 | Mumbai | 2024-01-15 |

| 2 | Priya | Patel | priya@email.com | +919812345678 | Delhi | 2024-02-01 |

| 3 | Raj | Kumar | raj@email.com | +918765432109 | Bangalore | 2024-01-20 |



\### products (3 records)  

| product_id | product_name | category | price | stock_quantity |

|------------|--------------|----------|-------|----------------|

| 1 | iPhone 15 | Electronics | 79999.00 | 25 |

| 2 | Nike AirMax | Footwear | 8999.00 | 50 |

| 3 | Dell Laptop | Electronics | 59999.00 | 15 |



\### orders (2 records)

| order_id | customer_id | order_date | total_amount | status |

|----------|-------------|------------|--------------|--------|

| 1 | 1 | 2024-01-20 | 88998.00 | Completed |

| 2 | 2 | 2024-02-05 | 8999.00 | Shipped |



\### order_items (3 records)

| order_item_id | order_id | product_id | quantity | unit_price | subtotal |

|---------------|----------|------------|----------|------------|----------|

| 1 | 1 | 1 | 1 | 79999.00 | 79999.00 |

| 2 | 1 | 3 | 1 | 8999.00 | 8999.00 |

| 3 | 2 | 2 | 1 | 8999.00 | 8999.00 |
