-- =========================
-- DIM DATE TABLE
-- =========================
CREATE TABLE dim_date (
    date_id DATE PRIMARY KEY,
    year INT,
    month INT,
    day INT
);

INSERT INTO dim_date VALUES
('2023-08-29', 2023, 8, 29),
('2023-12-12', 2023, 12, 12),
('2023-02-05', 2023, 2, 5),
('2023-02-20', 2023, 2, 20),
('2023-01-15', 2023, 1, 15),
('2023-08-09', 2023, 8, 9),
('2023-03-31', 2023, 3, 31),
('2023-10-26', 2023, 10, 26),
('2023-12-08', 2023, 12, 8),
('2023-08-15', 2023, 8, 15);


-- =========================
-- DIM STORE TABLE
-- =========================
CREATE TABLE dim_store (
    store_id INT AUTO_INCREMENT PRIMARY KEY,
    store_name VARCHAR(100),
    store_city VARCHAR(50)
);

INSERT INTO dim_store (store_name, store_city) VALUES
('Chennai Anna', 'Chennai'),
('Delhi South', 'Delhi'),
('Bangalore MG', 'Bangalore'),
('Pune FC Road', 'Pune'),
('Mumbai Central', 'Mumbai');


-- =========================
-- DIM PRODUCT TABLE
-- =========================
CREATE TABLE dim_product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
);

INSERT INTO dim_product (product_name, category) VALUES
('Speaker', 'Electronics'),
('Tablet', 'Electronics'),
('Phone', 'Electronics'),
('Smartwatch', 'Electronics'),
('Atta 10kg', 'Groceries'),
('Jeans', 'Clothing'),
('Biscuits', 'Groceries'),
('Jacket', 'Clothing'),
('Laptop', 'Electronics'),
('Milk 1L', 'Groceries');


-- =========================
-- FACT TABLE
-- =========================
CREATE TABLE fact_sales (
    sales_id INT AUTO_INCREMENT PRIMARY KEY,
    date_id DATE,
    store_id INT,
    product_id INT,
    units_sold INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);


-- =========================
-- INSERT FACT DATA (CLEANED)
-- =========================
INSERT INTO fact_sales (date_id, store_id, product_id, units_sold, unit_price) VALUES
('2023-08-29', 1, 1, 3, 49262.78),
('2023-12-12', 1, 2, 11, 23226.12),
('2023-02-05', 1, 3, 20, 48703.39),
('2023-02-20', 2, 2, 14, 23226.12),
('2023-01-15', 1, 4, 10, 58851.01),
('2023-08-09', 3, 5, 12, 52464.00),
('2023-03-31', 4, 4, 6, 58851.01),
('2023-10-26', 4, 6, 16, 2317.47),
('2023-12-08', 3, 7, 9, 27469.99),
('2023-08-15', 3, 4, 3, 58851.01);

