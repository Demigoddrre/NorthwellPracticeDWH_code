---

## **SSIS Package Creation Steps in Visual Studio Community**

### **1. Set Up the Environment**
1. Open **Visual Studio Community**.
2. Create or open an SSIS Project for your ETL workflows:
   - Use the **Integration Services Project** template.
   - Save the project in a directory named `ClaimsETL_Project1`.

---

### **2. Create the SSIS Packages**
You will need the following packages for the **Claims Data Analysis Project**:

1. **LoadClaims.dtsx**: For loading data into staging tables.
2. **TransformClaims.dtsx**: For transforming data from staging to fact and dimension tables.
3. **LoadToFactDim.dtsx**: For final loading into the star schema.

---

### **3. Configure Connection Managers**
1. **Add a Flat File Connection Manager**:
   - Right-click **Connection Managers** at the bottom of the SSIS Designer and select **New Flat File Connection Manager**.
   - Configure it to read the source CSV files (e.g., `Claims.csv` and `ClaimStatus.csv`) from your directory.

2. **Add an OLE DB Connection Manager**:
   - Right-click **Connection Managers** and select **New OLE DB Connection Manager**.
   - Configure it to connect to your `NorthwellPracticeDWH` database in SQL Server.

3. **(Optional)** Add a Logging Connection:
   - If you are writing execution details to `ETL_Log`, configure another OLE DB connection manager pointing to the database.

---

### **4. Build the LoadClaims.dtsx Package**
**Purpose**: Load raw data from flat files into staging tables.

1. **Control Flow**:
   - Drag a **Data Flow Task** from the SSIS Toolbox to the Control Flow canvas.
   - Name it `Load Claims Data`.

2. **Data Flow**:
   - Double-click the **Data Flow Task** to configure it:
     - **Flat File Source**:
       - Add a Flat File Source pointing to `Claims.csv`.
       - Configure column mappings.
     - **OLE DB Destination**:
       - Add an OLE DB Destination pointing to `dbo.Stg_Claims`.
       - Map the columns from the source to the destination table.

3. **Logging**:
   - Add a **Script Task** (if needed) to log the status of the data load to the `ETL_FileTracking` table.

4. **Error Handling**:
   - Configure error outputs for the Flat File Source and OLE DB Destination to log errors or redirect rows to a file.

---

### **5. Build the TransformClaims.dtsx Package**
**Purpose**: Perform transformations from staging tables to fact and dimension tables.

1. **Control Flow**:
   - Drag a **Data Flow Task** to the Control Flow canvas.
   - Name it `Transform Claims Data`.

2. **Data Flow**:
   - **OLE DB Source**:
     - Point to the `dbo.Stg_Claims` table.
   - **Transformation Tasks**:
     - Use **Derived Column Transformation** to calculate any derived fields, such as `ProcessingDuration`.
     - Use **Lookup Transformation** to enrich claims data with information from `Stg_Payers` and `Stg_ClaimStatus`.
   - **OLE DB Destination**:
     - Write the transformed data into `FactClaims` and related dimensions (`DimPayers`, `DimClaimStatus`).

3. **Logging**:
   - Add a Script Task or SQL Task to log the transformation process to `ETL_Log`.

4. **Error Handling**:
   - Configure error outputs for transformations to track rejected rows or log errors.

---

### **6. Build the LoadToFactDim.dtsx Package**
**Purpose**: Finalize the loading of transformed data into the star schema.

1. **Control Flow**:
   - Drag a **Data Flow Task** to the Control Flow canvas.
   - Name it `Load Fact and Dimension Data`.

2. **Data Flow**:
   - Use OLE DB Sources to extract transformed data from staging tables.
   - Use OLE DB Destinations to load data into fact (`FactClaims`) and dimension tables (`DimPayers`, `DimClaimStatus`).

3. **Validation**:
   - Add SQL Tasks to validate data integrity after loading.

4. **Logging**:
   - Add tasks to log the status and row counts into `ETL_Log`.

---

### **7. Add Package Logging**
1. **Enable Logging**:
   - Right-click the Control Flow area and select **Logging**.
   - Enable logging for tasks and configure the provider (e.g., text file, database).
2. **Write Logs**:
   - Configure logs to write execution details to `ClaimsETLLog.log` for file-based logs or directly to the `ETL_Log` table.

---

### **8. Test and Validate the Packages**
1. Test each package individually to ensure:
   - Data is being loaded accurately into staging tables.
   - Transformations are correctly implemented.
   - Data is loaded correctly into fact and dimension tables.
2. Validate the logs to ensure process statuses, errors, and row counts are being recorded properly.

---

### **9. Deploy and Schedule the ETL Workflow**
1. **Deployment**:
   - Deploy the packages to the SSIS Catalog on your SQL Server instance.
2. **Scheduling**:
   - Use SQL Server Agent to create jobs and schedule the execution of SSIS packages.
   - Configure the job steps to include appropriate logging and error handling.

---