-- Use the correct database
USE NorthwellPracticeDWH;
GO

-- Insert initial data into DimProducts
-- Adding sample products to the DimProducts table for sales analysis
INSERT INTO DimProducts (ProductName)
VALUES 
('Product A'), -- Represents the first type of product
('Product B'), -- Represents the second type of product
('Product C'), -- Represents the third type of product
('Product D'); -- Represents the fourth type of product

-- Insert initial data into DimRegions
-- Adding regional data to associate with sales
INSERT INTO DimRegions (RegionName)
VALUES 
('North'), -- Northern sales region
('South'), -- Southern sales region
('East'),  -- Eastern sales region
('West');  -- Western sales region

-- Insert initial data into FactSales
-- Adding initial sales transactions for testing purposes
INSERT INTO FactSales (ProductID, RegionID, SaleDate, Revenue)
VALUES 
(1, 1, '2023-01-01', 5000.00), -- Sale of Product A in the North region
(2, 2, '2023-01-02', 3000.00), -- Sale of Product B in the South region
(3, 3, '2023-01-03', 4000.00), -- Sale of Product C in the East region
(4, 4, '2023-01-04', 2500.00); -- Sale of Product D in the West region
