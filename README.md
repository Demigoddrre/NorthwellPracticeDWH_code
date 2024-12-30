# NorthwellPracticeDWH Project

## **Project Overview**
The **NorthwellPracticeDWH** (Data Warehouse) project is a centralized repository designed to support analytics, reporting, and visualization for Data Analyst and Business Intelligence Analyst roles. This data warehouse consolidates data from multiple sources, enabling efficient querying, insightful analysis, and robust visualizations through tools like Power BI and Excel.

---

## **Purpose**
This project defines and implements the requirements for a star schema-based Data Warehouse to:
- Serve as a structured and historical data repository.
- Support ETL workflows for automated data ingestion and transformation.
- Provide aggregated and transformed data through SQL views, stored procedures, and dimensional modeling.
- Facilitate advanced visualizations with Power BI and Excel.

---

## **Key Features**
1. **Star Schema Design:**
   - Fact Tables for measurable metrics (e.g., Claims, Sales, Revenue).
   - Dimension Tables for contextual data (e.g., Payers, Employees, Products).
   - Historical data storage for trend analysis and forecasting.

2. **ETL Workflows:**
   - **SSIS** for automated ingestion from CSVs, Excel, and APIs into staging tables.
   - Deduplication, cleaning, and typecasting during transformation.
   - **Python (Pandas/SQLAlchemy):** For advanced data transformations and validations.
   - **SQL Server:** Aggregations and normalization to fit the star schema.

3. **Reporting and Visualization:**
   - **Power BI Dashboards:** Real-time insights, KPIs, slicers, and filters.
   - **Excel Reports:** Ad hoc reporting and trend analysis with pivot tables.

---

## **Planned Use Cases**

### **Project 1: Claims Data Analysis Dashboard**
- **Workflow:**
  1. Load claims data into staging tables using SSIS.
  2. Transform data into fact and dimension tables (FactClaims, DimPayers, DimClaimStatus).
  3. Create SQL views for monthly trends and denial rates.
  4. Build Power BI visuals for trend analysis.
  5. Export summaries to Excel for manual analysis.

### **Project 2: Business Intelligence KPI Dashboard**
- **Workflow:**
  1. Use SSIS to ingest sales data.
  2. Transform into FactSales and dimension tables (DimProducts, DimRegions).
  3. Develop SQL views for KPIs (revenue, productivity).
  4. Build Power BI dashboards for performance metrics.

### **Project 3: Pre-Claim Edits Workflow Optimization**
- **Workflow:**
  1. Ingest pre-claim edit data via SSIS.
  2. Analyze edit types and resolution times using SQL views.
  3. Create Power BI Gantt charts for workflow visualization.

### **Project 4: Hospital Revenue Analysis**
- **Workflow:**
  1. Ingest revenue data into staging tables via SSIS.
  2. Load cleaned data into FactMonthlyRevenue and DimDepartments.
  3. Visualize departmental trends using Power BI.

### **Project 5: SQL Server Performance Tuning**
- **Workflow:**
  1. Ingest large datasets into FactSales.
  2. Optimize queries using execution plans.
  3. Perform analysis using Python for outlier detection.

### **Project 6: Employee Productivity and Cost Analysis**
- **Workflow:**
  1. Use SSIS to ingest task and cost data.
  2. Analyze productivity trends using DimEmployees and DimDepartments.
  3. Build Power BI visuals for cost-efficiency trends.

### **Project 7: Claims Denial Trends Reporting**
- **Workflow:**
  1. Ingest denial data via SSIS.
  2. Analyze denial patterns using FactClaims and DimClaimStatus.
  3. Create payer-specific KPIs in Power BI.

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
   - Start with `CreateDatabase.sql`.
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

