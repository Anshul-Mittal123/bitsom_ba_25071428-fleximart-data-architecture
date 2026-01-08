# Part 3: Data Warehouse & Analytics

## Star Schema
fact_sales → dim_date, dim_product, dim_customer
Grain: Order line-item level

## Files
warehouse_schema.sql ✅ Star schema DDL
warehouse_data.sql ✅ 40 sales transactions
analytics_queries.sql ✅ 3 OLAP queries
star_schema_design.md ✅ Design documentation

## Key Queries
1. **Monthly drill-down:** Year→Quarter→Month sales
2. **Top 10 products:** Revenue + % contribution  
3. **Customer segments:** High/Medium/Low value

## Run
```sql
mysql fleximart_dw < warehouse_schema.sql
mysql fleximart_dw < warehouse_data.sql
