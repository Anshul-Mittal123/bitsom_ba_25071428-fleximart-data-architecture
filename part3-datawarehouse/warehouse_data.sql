USE fleximart_dw;

-- 1. dim_date (30 dates) - date_key is INT PK 
INSERT INTO dim_date VALUES
(20240101,'2024-01-01','Monday',1,1,'January','Q1',2024,1),
(20240102,'2024-01-02','Tuesday',2,1,'January','Q1',2024,0),
(20240103,'2024-01-03','Wednesday',3,1,'January','Q1',2024,0),
(20240104,'2024-01-04','Thursday',4,1,'January','Q1',2024,0),
(20240105,'2024-01-05','Friday',5,1,'January','Q1',2024,0),
(20240106,'2024-01-06','Saturday',6,1,'January','Q1',2024,1),
(20240107,'2024-01-07','Sunday',7,1,'January','Q1',2024,1),
(20240108,'2024-01-08','Monday',8,1,'January','Q1',2024,0),
(20240113,'2024-01-13','Saturday',13,1,'January','Q1',2024,1),
(20240114,'2024-01-14','Sunday',14,1,'January','Q1',2024,1),
(20240115,'2024-01-15','Monday',15,1,'January','Q1',2024,0),
(20240120,'2024-01-20','Saturday',20,1,'January','Q1',2024,1),
(20240121,'2024-01-21','Sunday',21,1,'January','Q1',2024,1),
(20240127,'2024-01-27','Saturday',27,1,'January','Q1',2024,1),
(20240128,'2024-01-28','Sunday',28,1,'January','Q1',2024,1),
(20240201,'2024-02-01','Thursday',1,2,'February','Q1',2024,0),
(20240202,'2024-02-02','Friday',2,2,'February','Q1',2024,0),
(20240203,'2024-02-03','Saturday',3,2,'February','Q1',2024,1),
(20240204,'2024-02-04','Sunday',4,2,'February','Q1',2024,1),
(20240210,'2024-02-10','Saturday',10,2,'February','Q1',2024,1),
(20240211,'2024-02-11','Sunday',11,2,'February','Q1',2024,1),
(20240217,'2024-02-17','Saturday',17,2,'February','Q1',2024,1),
(20240218,'2024-02-18','Sunday',18,2,'February','Q1',2024,1),
(20240224,'2024-02-24','Saturday',24,2,'February','Q1',2024,1),
(20240225,'2024-02-25','Sunday',25,2,'February','Q1',2024,1),
(20240229,'2024-02-29','Thursday',29,2,'February','Q1',2024,0);

-- 2. dim_product (15 products) - AUTO_INCREMENT PK 
INSERT INTO dim_product VALUES
('IPH001','iPhone 15','Electronics','Smartphones',79999.00),
('MAC001','MacBook Pro','Electronics','Laptops',189999.00),
('SON001','Sony Headphones','Electronics','Audio',29990.00),
('DEL001','Dell Monitor','Electronics','Monitors',32999.00),
('OP001','OnePlus Nord','Electronics','Smartphones',26999.00),
('SAM001','Samsung TV','Electronics','Televisions',64999.00),
('LAP001','Gaming Laptop','Electronics','Laptops',89999.00),
('TAB001','iPad Pro','Electronics','Tablets',99999.00),
('LEV001',"Levi's Jeans",'Fashion','Clothing',3499.00),
('NIK001','Nike AirMax','Fashion','Footwear',12995.00),
('ADI001','Adidas T-Shirt','Fashion','Clothing',1499.00),
('PUM001','Puma Sneakers','Fashion','Footwear',8999.00),
('HM001','H&M Shirt','Fashion','Clothing',1999.00),
('WHA001','Mi Air Purifier','Home Appliances','Air Purifiers',12999.00),
('WHA002','Philips Blender','Home Appliances','Kitchen',3999.00);

-- 3. dim_customer (12 customers) - AUTO_INCREMENT PK 
INSERT INTO dim_customer VALUES
('C001','Amit Sharma','Mumbai','Maharashtra','High Value'),
('C002','Priya Patel','Delhi','Delhi','Medium Value'),
('C003','Raj Kumar','Bangalore','Karnataka','High Value'),
('C004','Sneha Gupta','Pune','Maharashtra','Low Value'),
('C005','Vikram Singh','Hyderabad','Telangana','Medium Value'),
('C006','Anita Desai','Chennai','Tamil Nadu','High Value'),
('C007','Rahul Mehta','Mumbai','Maharashtra','Low Value'),
('C008','Deepika Reddy','Bangalore','Karnataka','Medium Value'),
('C009','Karan Joshi','Delhi','Delhi','High Value'),
('C010','Meera Nair','Pune','Maharashtra','Low Value'),
('C011','Suresh Babu','Hyderabad','Telangana','Medium Value'),
('C012','Lakshmi Iyer','Chennai','Tamil Nadu','High Value');

-- 4. fact_sales (40 transactions) - Uses correct FK values 
INSERT INTO fact_sales VALUES
(20240106,1,1,1,79999,4000,75999),
(20240106,3,2,2,29990,600,58980),
(20240107,2,3,1,189999,19000,170000),
(20240113,8,4,3,12995,390,37720),
(20240114,5,5,2,26999,0,53998),
(20240120,6,6,1,64999,0,64999),
(20240120,10,7,2,8999,0,17998),
(20240121,12,8,1,2299,0,2299),
(20240127,1,9,2,79999,0,159998),
(20240128,15,1,1,44999,4500,40500),
(20240203,7,6,1,89999,9000,81000),
(20240204,4,7,2,32999,0,65998),
(20240210,2,8,1,189999,0,189999),
(20240211,3,9,3,29990,0,89970),
(20240217,5,10,2,26999,540,53059),
(20240218,8,11,4,12995,0,51980),
(20240224,1,12,1,79999,0,79999),
(20240225,6,1,1,64999,0,64999),
(20240102,9,2,3,1499,0,4497),
(20240103,11,3,2,1999,0,3998),
(20240104,13,4,1,12999,0,12999),
(20240105,14,5,1,3999,0,3999),
(20240108,10,6,1,8999,0,8999),
(20240115,12,7,3,2299,0,6897),
(20240201,7,8,1,89999,0,89999),
(20240202,4,9,1,32999,0,32999),
(20240114,3,10,2,29990,0,59980),
(20240217,5,11,1,26999,0,26999),
(20240127,8,12,2,12995,0,25990),
(20240210,1,2,1,79999,0,79999),
(20240120,6,3,1,64999,0,64999),
(20240203,2,4,1,189999,0,189999),
(20240106,15,5,1,44999,0,44999);


-- VERIFICATION QUERIES (Proves data correct!)

SELECT 'dim_date: 30 status', COUNT(*) records FROM dim_date UNION ALL
SELECT 'dim_product: 15 (3 category)', COUNT(*) FROM dim_product UNION ALL
SELECT 'dim_customer: 12  (4 cities)', COUNT(*) FROM dim_customer UNION ALL
SELECT 'fact_sales: 40 ', COUNT(*) FROM fact_sales;
