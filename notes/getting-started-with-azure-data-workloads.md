# Getting Started with Azure Data Workloads

Types of Data

* Structured data  
  * Students and Grades tables, i.e. CRM, ERP or admin systems  
  * Tabular in nature  
  * Table holds one type of data  
  * Each table has a primary key (field or set of fields to identify a record)  
  * Foreign keys are reference keys to other tables  
*  Unstructured data  
  * Videos, images, audio files  
  * Harder to interpret using a computer system  
  * Analysis of images \- gives structured or semi-structured data  
* Semi-structured data  
  * Has some observable structure  
  * Log files (follow some kind of format)  
  * XML data \- it can be interpreted using computerized systems  
  * Not tabular in nature

* Structured data  
  * CRM/ERP systems  
  * Admin systems  
  * Tabular  
    * Data is organized in tables

* Relational and Non-relational Databases  
  * Store data in tables  
  * Interacting with data using SQL  
  * All have schema that describe all tables, fields, field types and relationships  
  * Schema is enforced on write  
  * Examples  
    * Microsoft SQL Server \- high performance, AD integration  
    * MySQL \- free to use, open-source SQL  
    * PostgreSQL \- free but more complex  
* Non-relational databases  
  * No tables used  
  * Collections or containers used  
  * Don’t follow predefined schema  
  * Types  
    * Document databases (XML, JSON)  
    * Wide-column store  
    * Key-value store  
    * Graph databases  
  * Examples  
    * Redis (key-value, fast)  
    * Cassandra (free, open source, wide-column)  
    * Azure CosmosDB (key-value store), distributed around the world  
* Transactional vs. Analytical Workloads  
  * ACID properties  
  * Committing a transaction means it is final  
  * Two transactions mutating the same record  
  * ACID  
    * \*Atomicity \- unsplittable  
    * Consistency state \- consistent state before and after transaction  
    * \*Isolation \- all transactions should be executed  
    * Durability \- once transaction is committed, database should guarantee the data will persist  
    * Atomicity & Isolation are the most difficult  
  * Analytical workloads  
    * Low volume of reads  
    * Large amount of date  
    * Warehousing is also called OLAP (online analytical processing)

Batch & Streaming Data

* Batch data  
  * Often easier to implement  
  * Executed on schedule  
  * All data is stored for analytical querying  
  * You query the data after loading  
  * Easy joining of datasets  
  * **Efficiency opportunities**  
  * **Aligns with existing skills (with more traditional database schemas)**  
* Streaming data  
  * Near real-time answers  
  * Only results are stored, no other data  
  * Queries are predefined  
  * Combining datasets is more difficult  
* Globoticket website  
  * Site  
  * Azure Data Factory  
  * Azure SQL DB or Azure Synapse  
  * PowerBI  
* Courses on Reporting/PowerBI  
  * Building Your First Power BI Report  
  * Building your First Data Pipeline in Azure Data Factory  
  * Understanding Azure Stream Analytics  
* Sales reports using streaming data  
  * New update whenever an order is placed  
  * Azure Event Hub  
    * Can messages to more than 1 consumer  
      * Azure SQL DB  
      * Stream Analytics  
      * Understanding Azure Stream Analytics
