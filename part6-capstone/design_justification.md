## Storage Systems
To meet the four project goals, I have implemented a multi-tier storage strategy:

Data Lake (Amazon S3/Azure Blob): This serves as the landing zone for Goal 4 (Stream and store real-time vitals). Given the high velocity of ICU sensor data, the Data Lake provides the necessary elastic scale to ingest raw telemetry without the overhead of schema enforcement, ensuring no critical patient data is dropped during spikes.

Data Warehouse (Snowflake/BigQuery): This system fulfills Goal 1 (Readmission Risk) and Goal 3 (Monthly Reports). By transforming raw EHR and billing data into structured, modeled tables (using Star Schema), we provide the high-performance environment required for complex SQL joins and historical trend analysis used by hospital management.

Vector Database (Pinecone/Milvus): This addresses Goal 2 (Plain English Queries). By storing embeddings of unstructured doctor notes, it enables semantic search. This allows the system to understand clinical context—linking "cardiac event" to "myocardial infarction"—which traditional relational databases cannot do.

## OLTP vs OLAP Boundary
The boundary in this design is established at the Ingestion Layer. The OLTP (Online Transactional Processing) side consists of the source systems—the EHR, Billing, and ICU devices—where data is created and updated in real-time to support daily hospital operations.

The OLAP (Online Analytical Processing) side begins once data passes through the Batch and Streaming Ingestion engines into the Storage Layer. Specifically, the Data Lake acts as the "buffer," but the true analytical boundary is the ETL/ELT process that moves data into the Data Warehouse and Vector Database. Once data enters these systems, it is treated as "read-only" for the purpose of generating insights, risk scores, and reports, ensuring that heavy analytical queries do not slow down the live clinical systems.

## Trade-offs
A significant trade-off in this design is Architectural Complexity vs. Functional Capability. By utilizing three distinct storage systems, we introduce "Data Silos" that require complex synchronization. For example, if a patient’s record is updated in the EHR, that change must propagate to the Data Lake, then the Warehouse, and finally be re-embedded in the Vector Database.

Mitigation: To mitigate the risk of data inconsistency, I would implement a Medallion Architecture (Bronze/Silver/Gold) within the Data Lakehouse framework. By using a unified metadata layer (like Unity Catalog or Apache Iceberg), we can manage access and schema consistency across all three storage types from a single plane, reducing the operational burden on the engineering team while maintaining high data integrity.