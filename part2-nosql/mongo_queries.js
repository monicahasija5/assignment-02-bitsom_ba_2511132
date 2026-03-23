// OP1: insertMany() — insert all 3 documents
db.products.insertMany([
  {
    _id: 1,
    product_name: "iPhone 15",
    category: "Electronics",
    price: 80000,
    brand: "Apple",
    specs: {
      warranty_years: 1,
      voltage: "220V",
      battery: "3500mAh"
    },
    features: ["5G", "OLED Display", "Face ID"]
  },
  {
    _id: 2,
    product_name: "Men's T-Shirt",
    category: "Clothing",
    price: 1200,
    brand: "H&M",
    size_options: ["S", "M", "L", "XL"],
    material: "Cotton",
    colors: ["Black", "White", "Blue"]
  },
  {
    _id: 3,
    product_name: "Organic Milk",
    category: "Groceries",
    price: 60,
    brand: "Amul",
    expiry_date: new Date("2024-12-20"),
    nutritional_info: {
      calories: 150,
      protein: "8g",
      fat: "5g"
    },
    storage: "Refrigerated"
  }
]);


// OP2: find() — Electronics with price > 20000
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});


// OP3: find() — Groceries expiring before 2025-01-01
db.products.find({
  category: "Groceries",
  expiry_date: { $lt: new Date("2025-01-01") }
});


// OP4: updateOne() — add discount_percent
db.products.updateOne(
  { _id: 1 },
  { $set: { discount_percent: 10 } }
);


// OP5: createIndex() — index on category
db.products.createIndex({ category: 1 });

// This index improves query performance when filtering by category,
// especially for large datasets.