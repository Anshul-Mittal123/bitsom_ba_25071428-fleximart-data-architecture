#### \# Database Schema Documentation



##### \## Entity-Relationship Description (Text Format)



\### ENTITY: customers

\*\*Purpose:\*\* Stores customer information

\*\*Attributes:\*\*

\- `customer\\\_id`: Unique identifier (Primary Key, AUTO\_INCREMENT)

\- `first\\\_name`: Customer's first name (VARCHAR(50) NOT NULL)

\- `last\\\_name`: Customer's last name (VARCHAR(50) NOT NULL)

\- `email`: Unique customer email (VARCHAR(100) UNIQUE NOT NULL)

\- `phone`: Contact number (VARCHAR(20))

\- `city`: Customer city (VARCHAR(50))

\- `registration\\\_date`: Account creation date (DATE)



\*\*Relationships:\*\*

\- One customer can place \*\*MANY\*\* orders (1:M with orders table)



\### ENTITY: products

\*\*Purpose:\*\* Product catalog and inventory

\*\*Attributes:\*\*

\- `product\\\_id`: Unique identifier (Primary Key, AUTO\_INCREMENT)

\- `product\\\_name`: Product name (VARCHAR(100) NOT NULL)

\- `category`: Product category (VARCHAR(50) NOT NULL)

\- `price`: Selling price (DECIMAL(10,2) NOT NULL)

\- `stock\\\_quantity`: Available units (INT DEFAULT 0)



\*\*Relationships:\*\*

\- One product appears in \*\*MANY\*\* order\_items (1:M)



\### ENTITY: orders

\*\*Purpose:\*\* Records customer purchases

\*\*Attributes:\*\*

\- `order\\\_id`: Unique order ID (Primary Key, AUTO\_INCREMENT)

\- `customer\\\_id`: References customers (INT NOT NULL, Foreign Key)

\- `order\\\_date`: Purchase date (DATE NOT NULL)

\- `total\\\_amount`: Order total value (DECIMAL(10,2) NOT NULL)

\- `status`: Processing status (VARCHAR(20) DEFAULT 'Pending')



\*\*Relationships:\*\*

\- One order has \*\*MANY\*\* order\_items (1:M)

\- One customer has \*\*MANY\*\* orders (M:1)



\### ENTITY: order\_items

\*\*Purpose:\*\* Line items within orders (solves many-to-many)

\*\*Attributes:\*\*

\- `order\\\_item\\\_id`: Unique line ID (Primary Key, AUTO\_INCREMENT)

\- `order\\\_id`: References orders (INT NOT NULL, Foreign Key)

\- `product\\\_id`: References products (INT NOT NULL, Foreign Key)

\- `quantity`: Units purchased (INT NOT NULL)

\- `unit\\\_price`: Price per unit (DECIMAL(10,2) NOT NULL)

\- `subtotal`: Line total (quantity × unit\_price) (DECIMAL(10,2) NOT NULL)



\## Normalization Explanation (3NF - 230 words)



\*\*Functional Dependencies:\*\*

customer\_id → first\_name, last\_name, email, phone, city

product\_id → product\_name, category, price, stock\_quantity

order\_id → customer\_id, order\_date, total\_amount, status

order\_item\_id → order\_id, product\_id, quantity, unit\_price, subtotal





\*\*3NF Justification:\*\*

1\. \*\*1NF:\*\* All attributes atomic (no repeating groups)

2\. \*\*2NF:\*\* 1NF + no partial dependencies (order\_items has full order\_id, product\_id dependency)

3\. \*\*3NF:\*\* 2NF + no transitive dependencies (customer\_id doesn't depend on order\_id)



\*\*Anomaly Prevention:\*\*

\- \*\*Update:\*\* Change customer email once (customers table), all orders automatically correct

\- \*\*Insert:\*\* Add new product without order data; new customer without purchase history

\- \*\*Delete:\*\* Delete order\_items doesn't lose customer/product data



\*\*Result:\*\* Zero redundancy, maximum data integrity \[web:1].



\## Sample Data Representation



\### customers (3 records)

| customer\_id | first\_name | last\_name | email | phone | city | registration\_date |

|-------------|------------|-----------|-------|-------|------|------------------|

| 1 | Amit | Sharma | amit@email.com | +919876543210 | Mumbai | 2024-01-15 |

| 2 | Priya | Patel | priya@email.com | +919812345678 | Delhi | 2024-02-01 |

| 3 | Raj | Kumar | raj@email.com | +918765432109 | Bangalore | 2024-01-20 |



\### products (3 records)  

| product\_id | product\_name | category | price | stock\_quantity |

|------------|--------------|----------|-------|----------------|

| 1 | iPhone 15 | Electronics | 79999.00 | 25 |

| 2 | Nike AirMax | Footwear | 8999.00 | 50 |

| 3 | Dell Laptop | Electronics | 59999.00 | 15 |



\### orders (2 records)

| order\_id | customer\_id | order\_date | total\_amount | status |

|----------|-------------|------------|--------------|--------|

| 1 | 1 | 2024-01-20 | 88998.00 | Completed |

| 2 | 2 | 2024-02-05 | 8999.00 | Shipped |



\### order\_items (3 records)

| order\_item\_id | order\_id | product\_id | quantity | unit\_price | subtotal |

|---------------|----------|------------|----------|------------|----------|

| 1 | 1 | 1 | 1 | 79999.00 | 79999.00 |

| 2 | 1 | 3 | 1 | 8999.00 | 8999.00 |

| 3 | 2 | 2 | 1 | 8999.00 | 8999.00 |



