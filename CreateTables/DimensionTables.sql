-- Use the correct database
USE NorthwellPracticeDWH;
GO

-- Dimension Table: Payers
IF NOT EXISTS (
    SELECT name 
    FROM sys.tables 
    WHERE name = 'DimPayers'
)
BEGIN
    -- The 'DimPayers' table stores information about payers for claims
    CREATE TABLE DimPayers (
        PayerID INT PRIMARY KEY IDENTITY(1,1), -- Unique identifier for each payer
        PayerName NVARCHAR(100) NOT NULL -- Name of the payer
    );
END;

-- Dimension Table: Claim Status
IF NOT EXISTS (
    SELECT name 
    FROM sys.tables 
    WHERE name = 'DimClaimStatus'
)
BEGIN
    -- The 'DimClaimStatus' table defines possible statuses for claims
    CREATE TABLE DimClaimStatus (
        StatusID INT PRIMARY KEY IDENTITY(1,1), -- Unique identifier for each status
        StatusName NVARCHAR(50) NOT NULL -- Name of the claim status (e.g., Approved, Denied)
    );
END;

-- Dimension Table: Employees
IF NOT EXISTS (
    SELECT name 
    FROM sys.tables 
    WHERE name = 'DimEmployees'
)
BEGIN
    -- The 'DimEmployees' table stores details about employees
    CREATE TABLE DimEmployees (
        EmployeeID INT PRIMARY KEY IDENTITY(1,1), -- Unique identifier for each employee
        Name NVARCHAR(100) NOT NULL, -- Full name of the employee
        Department NVARCHAR(50), -- Department the employee belongs to
        HireDate DATE, -- Date the employee was hired
        TasksCompleted INT DEFAULT 0 -- Total number of tasks completed by the employee
    );
END;

-- Dimension Table: Products
IF NOT EXISTS (
    SELECT name 
    FROM sys.tables 
    WHERE name = 'DimProducts'
)
BEGIN
    -- The 'DimProducts' table contains product details for sales analysis
    CREATE TABLE DimProducts (
        ProductID INT PRIMARY KEY IDENTITY(1,1), -- Unique identifier for each product
        ProductName NVARCHAR(100) NOT NULL -- Name of the product
    );
END;

-- Dimension Table: Regions
IF NOT EXISTS (
    SELECT name 
    FROM sys.tables 
    WHERE name = 'DimRegions'
)
BEGIN
    -- The 'DimRegions' table stores information about sales regions
    CREATE TABLE DimRegions (
        RegionID INT PRIMARY KEY IDENTITY(1,1), -- Unique identifier for each region
        RegionName NVARCHAR(50) NOT NULL -- Name of the region (e.g., North, South)
    );
END;

-- Dimension Table: Departments
IF NOT EXISTS (
    SELECT name 
    FROM sys.tables 
    WHERE name = 'DimDepartments'
)
BEGIN
    -- The 'DimDepartments' table stores department information for organizational analysis
    CREATE TABLE DimDepartments (
        DepartmentID INT PRIMARY KEY IDENTITY(1,1), -- Unique identifier for each department
        DepartmentName NVARCHAR(50) NOT NULL -- Name of the department
    );
END;
