# Star Schema Design Documentation

## Section 1: Schema Overview

**FACT TABLE: fact_sales**  
**Grain:** One row per product per order line item  
**Business Process:** Sales transactions

**Measures (Numeric Facts):**
- `quantity_sold`: Number of units sold
- `unit_price`: Price per unit at time of sale  
- `discount_amount`: Discount applied
- `total_amount`: Final amount (quantity × unit_price - discount)

**Foreign Keys:**
- `date_key` → `dim_date`
- `product_key` → `dim_product`  
- `customer_key` → `dim_customer`

**DIMENSION TABLE: dim_date**  
**Purpose:** Date dimension for time-based analysis  
**Type:** Conformed dimension
**Attributes:**
- `date_key` (PK): Surrogate key (integer, format: YYYYMMDD)
- `full_date`: Actual date
- `day_of_week`: Monday, Tuesday, etc.
- `month`: 1-12
- `month_name`: January, February, etc.  
- `quarter`: Q1, Q2, Q3, Q4
- `year`: 2023, 2024, etc.
- `is_weekend`: Boolean

**DIMENSION TABLE: dim_product**  
**Purpose:** Product attributes for sales analysis  
**Type:** Slowly changing dimension
**Attributes:**
- `product_key` (PK): Surrogate key (AUTO_INCREMENT)
- `product_id`: Source system ID
- `product_name`: Product description
- `category`: Electronics, Fashion, Home Appliances
- `subcategory`: Smartphones, Laptops, etc.
- `unit_price`: Snapshot price at sale time

**DIMENSION TABLE: dim_customer**  
**Purpose:** Customer segmentation and geography  
**Type:** Customer dimension
**Attributes:**
- `customer_key` (PK): Surrogate key (AUTO_INCREMENT)
- `customer_id`: Source system ID
- `customer_name`: Full name
- `city`: Geographic location
- `state`: State/region  
- `customer_segment`: High/Medium/Low value

## Section 2: Design Decisions

**Granularity:** Transaction line-item level chosen because business needs product-level analysis ("iPhone vs TV sales"). Order-header grain would aggregate products, losing detail. Line-item enables category rollups while preserving granularity.

**Surrogate Keys:** Used instead of natural keys (product_id) to handle Slowly Changing Dimensions Type 2. Product price changes over time captured as new dimension rows. Natural keys would overwrite history. Integer surrogates faster for joins.

**Drill-down/Roll-up Support:** Date hierarchy (Year→Quarter→Month→Day) enables drill-down analysis. Product hierarchy (Product→Category→Subcategory) supports roll-up. Conformed date dimension consistent across facts. is_weekend flag enables weekend vs weekday slicing. Customer segments enable targeting analysis.

## Section 3: Sample Data Flow

**Source Transaction:**  

Order #101, Customer "John Doe", Product "Laptop", Qty: 2, Price: 50000

Becomes in Data Warehouse:
fact_sales: {
  date_key: 20240115,
  product_key: 5,
  customer_key: 12,
  quantity_sold: 2,
  unit_price: 50000,
  total_amount: 100000
}

**dim_date:**
date_key: 20240120, full_date: '2024-01-20', day_of_week: 'Saturday', month: 1, month_name: 'January', quarter: 'Q1', year: 2024 is_weekend: TRUE

**dim_customer:**
product_key: 1, product_id: 'IPH001', product_name: 'iPhone 15', category: 'Electronics', subcategory: 'Smartphones', unit_price: 79999.00

**dim_customer:**
customer_key: 1, customer_id: 'C001', customer_name: 'Amit Sharma', city: 'Mumbai', state: 'Maharashtra', customer_segment: 'High Value'