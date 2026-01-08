# FlexiMart Data Architecture Project

**Student Name:** Anshul MIttal
**Student ID:** bitsom_ba_25071428  
**Email:** anshulm2011@gmail.com
**Date:** January 8, 2026

## Project Overview
Built complete ETL pipeline for FlexiMart sales data, implemented business intelligence queries, NoSQL product catalog analysis, and star schema data warehouse with OLAP analytics for sales performance tracking.

## Repository Structure
bitsom_ba_25071428-fleximart-data-architecture/
├── README.md ✅
├── .gitignore ✅
├── data/ (provided CSVs)
├── part1-database-etl/ ✅
│ ├── etl_pipeline.py ✅
│ ├── schema_documentation.md ✅
│ ├── business_queries.sql ✅
│ └── data_quality_report.txt ✅
├── part2-nosql/ ✅
│ ├── nosql_analysis.md ✅
│ ├── mongodb_operations.js
│ └── products_catalog.json
└── part3-datawarehouse/ ✅
├── star_schema_design.md
├── warehouse_schema.sql ✅
├── warehouse_data.sql ✅
└── analytics_queries.sql ✅

## Technologies Used
- Python 3.14.2, pandas, mysql-connector-python
- MySQL 8.0 / PostgreSQL 14
- MongoDB 6.0

## Setup Instructions

### Database Setup
```bash
# Create databases
mysql -u root -p -e "CREATE DATABASE fleximart;
CREATE DATABASE fleximart_dw;"

# Run Part 1 - ETL Pipeline
python part1-database-etl/etl_pipeline.py

# Run Part 1 - Business Queries
mysql -u root -p fleximart < part1-database-etl/business_queries.sql

# Run Part 3 - Data Warehouse
mysql -u root -p fleximart_dw < part3-datawarehouse/warehouse_schema.sql
mysql -u root -p fleximart_dw < part3-datawarehouse/warehouse_data.sql
mysql -u root -p fleximart_dw < part3-datawarehouse/analytics_queries.sql

### MongoDB Setup
mongosh < part2-nosql/mongodb_operations.js

## Key Learnings
Mastered ETL pipeline with data cleaning and MySQL loading
Implemented complex SQL joins, GROUP BY, and window functions
Understood star schema design principles for data warehousing

## Challenges Faced
Handling inconsistent CSV data formats - Used pandas for standardization
Complex aggregation queries - Practiced CTEs and window functions



