#### **# NoSQL Analysis Report**



##### \## Section A: RDBMS Limitations (150 words)



###### Problem 1: Diverse Product Attributes

* Laptops need RAM/processor fields, shoes need size/color/material. Relational tables require **fixed columns** - adding new product types means ALTER TABLE every time.



###### Problem 2: Frequent Schema Changes

* New product categories (drones, smartwatches) require schema modifications, causing downtime and migration complexity.



###### Problem 3: Nested Customer Reviews  

* Storing reviews requires separate reviews table with foreign keys. Querying "product + all reviews" needs complex JOINs, slow performance.



##### \## Section B: MongoDB Benefits (150 words)



###### 1.Flexible Schema

* Documents store laptops with RAM field, shoes with size field - **no schema changes needed**.



###### 2.Embedded Documents

* Reviews stored directly in product document:

```json

{

&nbsp; "name": "iPhone",

&nbsp; "reviews": \[{"user": "John", "rating": 5}]

}



* Single query gets product + reviews.



###### 3.Horizontal Scalability

* Add servers easily for growing product catalog vs MySQL vertical scaling limits.



##### \## Section C: Trade-offs (100 words)



###### What are two disadvantages of using MongoDB instead of MySQL for this product catalog?

1\. No ACID Transactions: MongoDB eventual consistency vs MySQL ACID. Inventory updates might have brief inconsistencies.

2\. Complex Queries Harder: No SQL JOINs - need multiple queries or data duplication for relationships.



Verdict: Perfect for fleximart's diverse product catalog despite trade-offs.

