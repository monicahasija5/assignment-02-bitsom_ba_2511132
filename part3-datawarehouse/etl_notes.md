## ETL Decisions

### Decision 1 — Standardizing Date Formats
Problem: The raw dataset contained inconsistent date formats such as "29/08/2023", "12-12-2023", and "2023-02-05". This inconsistency makes it difficult to perform time-based analysis and join operations.

Resolution: All date values were converted into a standard ISO format "YYYY-MM-DD". This ensured consistency and allowed seamless integration with the dim_date table for time-based queries.

---

### Decision 2 — Normalizing Category Values
Problem: The category column had inconsistent casing and naming such as "electronics", "Electronics", "Grocery", and "Groceries". This could lead to incorrect aggregations and duplicate groupings during analysis.

Resolution: All category values were standardized to a consistent format: "Electronics", "Clothing", and "Groceries". This ensured accurate grouping and reporting in analytical queries.

---

### Decision 3 — Handling Missing Store City Values
Problem: The dataset contained multiple missing (NULL/blank) values in the "store_city" column. Missing city information can lead to incomplete geographical analysis and incorrect grouping of store performance.

Resolution: Missing store_city values were handled by assigning a placeholder such as "Unknown City" or by inferring the city based on the store_name where possible. This ensured consistent and complete data for analysis in the dim_store table.
