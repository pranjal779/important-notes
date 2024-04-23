[Count Distinct](https://www.w3schools.com/sql/sql_distinct.asp)  
By using the DISTINCT keyword in a function called COUNT, we can return the number of different countries.

Example
```MySQL
SELECT COUNT(DISTINCT Country) FROM Customers;
```
Note: The COUNT(DISTINCT column_name) is not supported in Microsoft Access databases.

Here is a workaround for MS Access:

Example
```sql
SELECT Count(*) AS DistinctCountries
FROM (SELECT DISTINCT Country FROM Customers);
```
