# **NorthwellPracticeDWH Project**

## **Project Overview**
The **NorthwellPracticeDWH** (Data Warehouse) project serves as a centralized repository designed to support analytics, reporting, and visualization for Data Analysts and Business Intelligence roles. It consolidates data from multiple sources to enable efficient querying, insightful analysis, and robust visualizations using tools like Power BI and Excel.

---

## **Purpose**
This project defines and implements the requirements for a star schema-based Data Warehouse to:
- Act as a structured and historical data repository.
- Facilitate ETL workflows for automated data ingestion and transformation.
- Provide aggregated and transformed data via SQL views, stored procedures, and dimensional modeling.
- Enable advanced visualizations with Power BI and Excel.
- Periodically integrate clean data from the real-time system for comprehensive reporting and analytics.

---

## **Key Features**
1. **Star Schema Design:**
   - Fact Tables for measurable metrics (e.g., Claims, Sales, Revenue).
   - Dimension Tables for contextual data (e.g., Payers, Employees, Products).
   - Historical data storage for trend analysis and forecasting.

2. **ETL Workflows:**
   - **SSIS**: Automates ingestion from CSVs, Excel files, APIs, and other sources into staging tables.
   - Data deduplication, cleaning, and typecasting during transformation.
   - **Python (Pandas/SQLAlchemy)**: Handles advanced data transformations and validations.
   - **SQL Server**: Supports aggregations and normalization for the star schema.

3. **Integration with Real-Time System:**
   - Periodic ETL jobs to extract non-fraudulent data from the real-time system’s **Delta Lake**.
   - Archive and store clean data in the DWH for long-term historical analysis.
   - Retain fraudulent claims in Delta Lake for audit and machine learning retraining.

4. **Logging Integration:**
   - Centralized **ETL_Log Table** in SQL Server for tracking ETL processes and their statuses.
   - **Python Logs** for detailed transformations, database connections, and error handling.
   - **SSIS Execution Logs** for high-level package monitoring and performance tracking.

5. **Reporting and Visualization:**
   - **Power BI Dashboards**: Real-time insights, KPIs, slicers, and filters.
   - **Excel Reports**: Ad hoc reporting and trend analysis with pivot tables.

---

## **Logging Strategy**

### **SQL Server: ETL_Log Table**
A centralized log table tracks all ETL processes executed within the data warehouse:
- **What it Logs**:
  - `ProcessName`: Name of the ETL task (e.g., LoadClaims, TransformToFact).
  - `Status`: Indicates success, failure, or in-progress.
  - `RecordsProcessed`: Number of rows affected during the ETL process.
  - `ErrorMessage`: Detailed error messages for failed processes.
- **Why It's Important**:
  - Centralized tracking for all ETL workflows.
  - Facilitates debugging and performance analysis.
  - Enables the creation of monitoring dashboards in Power BI.

### **Python Logging**
Python-based logging tracks the execution of transformations and database connections:
- **What it Logs**:
  - `pandas_transformations.log`: Logs transformations (e.g., merging, filtering, and saving CSVs).
  - `database_connection.log`: Logs database connection successes and failures.
- **Why It's Important**:
  - Fine-grained debugging for Python transformations.
  - Ensures database connections are reliable and secure.

### **SSIS Logging**
SSIS package execution logs capture high-level metadata:
- **What it Logs**:
  - Execution times and durations.
  - Number of rows processed in Data Flow tasks.
  - Errors during package execution.
- **Why It's Important**:
  - Tracks the performance of SSIS workflows.
  - Identifies errors in package control or data flow tasks.

---

## **SSIS Directory**
The SSIS packages for ETL workflows are maintained in the `NorthwellPracticeDWH_SSIS` directory. It includes:
- **Project-Specific Packages**: Contains individual SSIS packages for each project (e.g., Claims Data Analysis, Sales Data Analysis).
- **Shared Resources**: Includes shared logging frameworks, reusable connection configurations, and email notification packages.

Refer to the SSIS README in the `NorthwellPracticeDWH_SSIS` folder for further details.

---

## **Planned Use Cases**

### **Project 1: Claims Data Analysis Dashboard**
- **Workflow**:
  1. Load claims data into staging tables using SSIS.
  2. Transform data into fact and dimension tables (FactClaims, DimPayers, DimClaimStatus).
  3. Log each process in `ETL_Log`.
  4. Build Power BI visuals for trend analysis.
  5. Export summaries to Excel for manual analysis.

### **Project 2: Business Intelligence KPI Dashboard**
- **Workflow**:
  1. Use SSIS to ingest sales data.
  2. Transform into FactSales and dimension tables (DimProducts, DimRegions).
  3. Develop SQL views for KPIs (revenue, productivity).
  4. Build Power BI dashboards for performance metrics.

### **Project 3: Integration with Real-Time System**
- **Workflow**:
  1. Extract non-fraudulent data from Delta Lake in the real-time system.
  2. Archive clean data in SQL Server using ETL workflows.
  3. Retain only relevant historical data in Delta Lake for optimized performance.
  4. Visualize unified reports combining real-time and batch data in Power BI.

---

## **Implementation Plan**

### **Step 1: Environment Setup**
- Install required software:
  - SQL Server Developer Edition with SSIS and SSDT.
  - Power BI Desktop.
  - Python with Pandas and SQLAlchemy.
  - Excel with Power Query enabled.
- Verify connections:
  - Test SQL Server accessibility via SSMS.
  - Ensure Python connects to SQL Server using SQLAlchemy.

### **Step 2: Data Warehouse Setup**
1. **Schema Design:**
   - Create star schema with:
     - Fact Tables: FactClaims, FactSales, FactMonthlyRevenue, FactPreClaimEdits.
     - Dimension Tables: DimPayers, DimClaimStatus, DimEmployees, DimProducts, DimRegions, DimDepartments.
2. **Data Ingestion:**
   - Use SSIS to load raw data into staging tables.
   - Transform and load cleaned data into fact and dimension tables.
   - Log each ETL process into the `ETL_Log` table.
3. **Validation**:
   - Run SQL queries to confirm data integrity.

### **Step 3: Project-Specific Workflows**
- Implement SQL views and stored procedures for reusable transformations.
- Build Power BI dashboards and Excel reports for each project use case.

---

## **Tools and Datasets**

### **Software Requirements**
- SQL Server Developer Edition (with SSIS).
- Power BI Desktop.
- Microsoft Excel with Power Query.
- Python (Pandas, SQLAlchemy).

### **Sample Datasets**
- Claims and denial data (e.g., synthetic healthcare datasets).
- Sales data (e.g., product, region, revenue details).
- Employee productivity data (tasks, costs).
- External benchmarks from Kaggle and data.gov.

---

## **How to Run**
1. Clone or download the repository containing the SQL scripts and workflows.
2. Execute scripts in sequence:
   - Start with `CreateDatabase.sql` (in `Shared/CommonScripts/`).
   - Run table creation scripts in `CreateTables/`.
   - Load data using `PopulateData/` scripts.
3. Test queries and workflows in SSMS.
4. Use Power BI and Excel to visualize and analyze data.

---

## **Future Enhancements**
- Add Slowly Changing Dimensions (SCD) for historical tracking.
- Implement pre-aggregated tables for frequently used metrics.
- Migrate workflows to Azure for scalability.
- Integrate incremental real-time data updates from Delta Lake for up-to-date reporting.

---

## **Contributing**
Contributions are welcome! Please submit a pull request with details on changes or improvements.

---

## **Contact**
For questions or feedback, reach out to [dandredesir@gmail.com].

---

