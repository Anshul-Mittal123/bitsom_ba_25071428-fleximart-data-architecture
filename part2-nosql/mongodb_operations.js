// Operation 1: Load Data
print("=== 1. Load products_catalog.json ===");
print("mongosh --file products_catalog.json");

// Operation 2: Basic Query  
print("=== 2. Electronics < ₹50,000 ===");
db.products.find(
  { category: "Electronics", price: { $lt: 50000 } }, 
  { name: 1, price: 1, stock: 1 }
);

// Operation 3: Review Analysis (avg rating >= 4.0)
print("=== 3. Products avg rating >= 4.0 ===");
db.products.aggregate([
  { $match: { $expr: { $gte: [{ $avg: "$reviews.rating" }, 4] } } }
]);

// Operation 4: Update Operation
print("=== 4. Add review to ELEC001 ===");
db.products.updateOne(
  { "product_id": "ELEC001" },
  { 
    $push: { 
      reviews: { 
        user: "U999", 
        rating: 4, 
        comment: "Good value", 
        date: new ISODate() 
      } 
    } 
  }
);

// Operation 5: Complex Aggregation
print("=== 5. Category average price ===");
db.products.aggregate([
  { $group: { 
    _id: "$category", 
    avg_price: { $avg: "$price" }, 
    product_count: { $sum: 1 } 
  }},
  { $sort: { avg_price: -1 } }
]);
