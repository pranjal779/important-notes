-- Create Table Using Another Table
-- A copy of an existing table can also be created using CREATE TABLE.

-- The new table gets the same column definitions. All columns or specific columns can be selected.

-- If you create a new table using an existing table, the new table will be filled with the existing values from the old table.

-- Syntax
-- CREATE TABLE new_table_name AS
--     SELECT column1, column2,...
--     FROM existing_table_name
--     WHERE ....;
-- The following SQL creates a new table called "TestTable" (which is a copy of the "Customers" table): 

CREATE TABLE TestTable AS
SELECT customername, contactname
FROM customers;
