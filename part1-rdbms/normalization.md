## Anomaly Analysis

### Insert Anomaly

An insert anomaly occurs when we cannot insert data about one entity without inserting data about another unrelated entity.

Example from dataset:

All existing rows combine product and order information, such as:
ORD1000 | C002 | Priya Sharma | priya@gmail.com | Delhi | P001 | Laptop | Electronics | 55000 | 2 | 21/05/23 | SR03 | Ravi Kumar | ravi@corp.com	| South Zone, MG Road, Bangalore - 560001


If we want to add a new product (e.g., P009 - Keyboard),
We cannot insert this unless we also provide order details like 
order_id, customer_id, customer_name, customer_email, customer_city, quantity, order_date, sales_rep_id, sales_rep_name, sales_rep_email, office_address

---

### Update Anomaly

An update anomaly occurs when the same data is repeated in multiple rows and must be updated in all places.

Example from dataset:
Customer Rohan Mehta (C001) appears in multiple rows such as:
ORD1004,ORD1006,ORD1012,ORD1019,ORD1034

Column involved: customer_city

If his city changes from Mumbai to Delhi, we must update all rows.
If one row is missed, data becomes inconsistent.

---

### Delete Anomaly

A delete anomaly occurs when deleting a record also deletes important unrelated information.

Example:
ORD1185	| C003 | Amit Verma	| amit@gmail.com | Bangalore | P008 | Webcam | Electronics | 2100 | 1 | 15/06/23 | SR03 | Ravi Kumar | ravi@corp.com	| South Zone, MG Road, Bangalore - 560001

Columns involved: product_id, product_name, category, unit_price

If this row is deleted, the product "Webcam" information is also lost.

Thus, deleting an order leads to unintended loss of product data.

---

## Normalization Justification

While keeping all data in a single table may seem simpler initially, it leads to significant data redundancy and integrity issues. In the given dataset, customer details such as name, email, and city are repeated across multiple rows for every order. Similarly, product and sales representative information is duplicated, which increases storage usage and the risk of inconsistencies.

For example, if a customer like Priya Sharma changes her city from Delhi to Gurgaon, the update must be made in multiple rows. Missing even one row would result in inconsistent data. This demonstrates an update anomaly. Likewise, deleting a single order could result in the loss of important product or sales representative information, leading to a delete anomaly. Additionally, inserting a new product without an associated order is not possible in the current structure, which is an insert anomaly.

By normalizing the data into separate tables such as customers, products, sales_reps, orders, and order_items, redundancy is eliminated and each entity is stored only once. Relationships between entities are maintained using foreign keys, ensuring data integrity and consistency.

Thus, normalization is not over-engineering but a necessary design practice that improves scalability, maintainability, and accuracy of the database system.