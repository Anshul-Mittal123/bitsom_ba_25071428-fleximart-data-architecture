DROP DATABASE IF EXISTS fleximart;
CREATE DATABASE fleximart;
USE fleximart;

-- 1. CUSTOMERS (matches CSV)
CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,  -- C001, C002...
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    city VARCHAR(50),
    registration_date DATE
);

-- 2. PRODUCTS (matches CSV)
CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY,  -- P001, P002...
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT DEFAULT 0
);

-- 3. ORDERS (header-level)
CREATE TABLE orders (
    order_id VARCHAR(10) PRIMARY KEY,    -- T001, T002...
    customer_id VARCHAR(10) NOT NULL,
    transaction_date DATE NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- 4. ORDER_ITEMS (line-level from sales_raw.csv)
CREATE TABLE order_items (
    transaction_id VARCHAR(10) PRIMARY KEY,
    order_id VARCHAR(10) NOT NULL,
    product_id VARCHAR(10) NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);