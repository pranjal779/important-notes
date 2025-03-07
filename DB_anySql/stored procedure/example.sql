-- CREATE PROCEDURE procedure_name
-- AS
-- sql_statement
-- GO;

-- EXEC procedure_name;


-- example

CREATE PROCEDURE SelectAllCustomers
AS
SELECT * FROM Customers
GO;

EXEC SelectAllCustomers;
