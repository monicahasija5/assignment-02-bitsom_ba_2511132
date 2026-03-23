## Architecture Recommendation

I would recommend using a Data Lakehouse architecture for the food delivery startup.

A Data Lakehouse combines the flexibility of a Data Lake with the performance and structure of a Data Warehouse, making it ideal for handling diverse data types. In this case, the startup collects structured data (payment transactions), semi-structured data (customer reviews), and unstructured data (images and GPS logs). A traditional Data Warehouse would struggle with unstructured data like images, while a Data Lake alone lacks strong query performance and data governance.

First, a Data Lakehouse can store all types of data in their raw format, including text, images, and logs, without requiring predefined schemas. This is important because the startup is growing fast and data formats may evolve.

Second, it provides efficient querying and analytics capabilities using technologies like SQL, enabling business teams to generate insights such as delivery performance, customer behavior, and sales trends.

Third, it supports scalability and cost efficiency. Large volumes of data like GPS logs and images can be stored cheaply, while still being accessible for analysis when needed.

Additionally, a Lakehouse supports advanced use cases like machine learning, which is useful for recommendation systems, fraud detection, and route optimization.

Therefore, a Data Lakehouse offers the best balance between flexibility, scalability, and analytical performance for this use case.