---

# NorthwellPracticeDWH Project

## **Project Overview**
The **NorthwellPracticeDWH** (Data Warehouse) project serves as a centralized repository designed to support analytics, reporting, and visualization for Data Analyst and Business Intelligence Analyst roles. It consolidates data from multiple sources to enable efficient querying, insightful analysis, and robust visualizations using tools like Power BI and Excel.

---

## **Purpose**
This project defines and implements the requirements for a star schema-based Data Warehouse to:
- Act as a structured and historical data repository.
- Facilitate ETL workflows for automated data ingestion and transformation.
- Provide aggregated and transformed data via SQL views, stored procedures, and dimensional modeling.
- Enable advanced visualizations with Power BI and Excel.

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

3. **Reporting and Visualization:**
   - **Power BI Dashboards**: Real-time insights, KPIs, slicers, and filters.
   - **Excel Reports**: Ad hoc reporting and trend analysis with pivot tables.

---

## **SSIS Directory**
The SSIS packages for ETL workflows are maintained in a separate repository located in the `NorthwellPracticeDWH_SSIS` directory. This directory includes:
- **Project-Specific Packages**: Contains individual SSIS packages for each project (e.g., Claims Data Analysis, Sales Data Analysis).
- **Shared Resources**: Includes shared logging frameworks, reusable connection configurations, and email notification packages.

Refer to the SSIS README in the `NorthwellPracticeDWH_SSIS` folder for further details.

---

## **Planned Use Cases**

### **Project 1: Claims Data Analysis Dashboard**
- **Workflow**:
  1. Load claims data into staging tables using SSIS.
  2. Transform data into fact and dimension tables (FactClaims, DimPayers, DimClaimStatus).
  3. Create SQL views for monthly trends and denial rates.
  4. Build Power BI visuals for trend analysis.
  5. Export summaries to Excel for manual analysis.

### **Project 2: Business Intelligence KPI Dashboard**
- **Workflow**:
  1. Use SSIS to ingest sales data.
  2. Transform into FactSales and dimension tables (DimProducts, DimRegions).
  3. Develop SQL views for KPIs (revenue, productivity).
  4. Build Power BI dashboards for performance metrics.

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
3. **Validation:**
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

---

## **Contributing**
Contributions are welcome! Please submit a pull request with details on changes or improvements.

---

## **Contact**
For questions or feedback, reach out to [Your Email/Contact Information].

---
