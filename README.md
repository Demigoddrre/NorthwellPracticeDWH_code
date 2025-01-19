# **NorthwellPracticeDWH Project**  

## **Project Overview**  
The **NorthwellPracticeDWH** (Data Warehouse) project is an end-to-end data solution designed to encompass the entire data lifecycle. This project integrates critical aspects of cloud infrastructure, data architecture, system analysis, business intelligence, machine learning, and web applications to provide a comprehensive learning experience.  

The project serves as a centralized repository to support analytics, reporting, and visualization for Data Analysts, Business Intelligence Analysts, and other data-driven roles. It consolidates data from multiple sources to enable efficient querying, insightful analysis, robust visualizations, and predictive analytics.  

### **Project Scope**
This project was designed and built from the ground up to address the lack of pre-existing infrastructure for advanced data workflows. Its focus spans:  
- **Cloud Infrastructure Architecture**: Designing scalable infrastructure for data ingestion and storage.  
- **Data Architecture**: Developing a star schema-based data warehouse for high-performance querying and historical analysis.  
- **System Analysis and Design**: Translating business requirements into technical specifications and actionable solutions.  
- **Data Pipeline Engineering**: Building robust ETL workflows using SQL Server Integration Services (SSIS), Python, and SQL.  
- **Business Intelligence and Data Transformation**: Creating interactive dashboards using Power BI and Excel.  
- **Machine Learning Integration**: Establishing pipelines to integrate machine learning models and generate actionable insights.  
- **Full-Stack Web Architecture**: Creating scenarios where data from web applications serves as a source for the warehouse.  

This project represents a real-world simulation of the challenges and workflows involved in a professional data ecosystem.  

---  

## **Purpose**
This project defines and implements the requirements for a star schema-based Data Warehouse to:  
- Act as a structured and historical data repository.  
- Facilitate ETL workflows for automated data ingestion and transformation.  
- Provide aggregated and transformed data via SQL views, stored procedures, and dimensional modeling.  
- Enable advanced visualizations with Power BI and Excel.  
- Integrate clean data from a real-time system for comprehensive reporting and analytics.  

---  

## **Key Features**
1. **Star Schema Design**:  
   - Fact Tables for measurable metrics (e.g., Claims, Sales, Revenue).  
   - Dimension Tables for contextual data (e.g., Payers, Employees, Products).  
   - Historical data storage for trend analysis and forecasting.  

2. **ETL Workflows**:  
   - **SSIS**: Automates ingestion from CSVs, Excel files, APIs, and other sources into staging tables.  
   - Data deduplication, cleaning, and typecasting during transformation.  
   - **Python (Pandas/SQLAlchemy)**: Handles advanced data transformations and validations.  
   - **SQL Server**: Supports aggregations and normalization for the star schema.  

3. **Integration with Real-Time System**:  
   - Periodic ETL jobs to extract non-fraudulent data from the real-time system’s **Delta Lake**.  
   - Archive and store clean data in the DWH for long-term historical analysis.  
   - Retain fraudulent claims in Delta Lake for audit and machine learning retraining.  

4. **Logging Integration**:  
   - Centralized **ETL_Log Table** in SQL Server for tracking ETL processes and their statuses.  
   - **Python Logs** for detailed transformations, database connections, and error handling.  
   - **SSIS Execution Logs** for high-level package monitoring and performance tracking.  

5. **Reporting and Visualization**:  
   - **Power BI Dashboards**: Real-time insights, KPIs, slicers, and filters.  
   - **Excel Reports**: Ad hoc reporting and trend analysis with pivot tables.  

---  

## **Planned Use Cases**
### **Project 1: Claims Data Analysis Dashboard**
- Load claims data into staging tables using SSIS.  
- Transform data into fact and dimension tables (FactClaims, DimPayers, DimClaimStatus).  
- Log each process in `ETL_Log`.  
- Build Power BI visuals for trend analysis.  

### **Project 2: Business Intelligence KPI Dashboard**
- Ingest sales data via SSIS.  
- Transform into FactSales and dimension tables (DimProducts, DimRegions).  
- Create SQL views for KPIs and build Power BI dashboards for insights.  

### **Project 3: Integration with Real-Time System**
- Extract non-fraudulent data from **Delta Lake** in the real-time system.  
- Archive clean data in SQL Server using ETL workflows.  
- Retain historical data in Delta Lake for audit and machine learning retraining.  
- Visualize unified reports combining real-time and batch data.  

---  

## **Logging Strategy**  
### **SQL Server: ETL_Log Table**
Tracks all ETL processes, capturing `ProcessName`, `Status`, `RecordsProcessed`, and `ErrorMessage`.  
Enables centralized monitoring and debugging for all workflows.  

### **Python Logging**
Provides granular details of transformations and database connections via:  
- `pandas_transformations.log`: Logs data processing steps.  
- `database_connection.log`: Logs connection issues and successes.  

### **SSIS Logging**
Captures execution metadata for SSIS workflows, including execution times, row counts, and errors, stored in `ClaimsETLLog.log`.  

---  

## **Future Enhancements**
- Implement machine learning workflows for anomaly detection and KPI forecasting.  
- Automate incremental real-time data ingestion via SSIS.  
- Migrate workflows to Azure for scalability and centralized monitoring.  

---

## **Contributing**
Contributions are welcome! Please submit a pull request with details on changes or improvements.

---

## **Contact**
For questions or feedback, reach out to [dandredesir@gmail.com].

---

