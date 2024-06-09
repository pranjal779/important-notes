/*
The LIKE operator is used in a WHERE clause to search for a specified pattern in a column.

There are two wildcards often used in conjunction with the LIKE operator:

 The percent sign % represents zero, one, or multiple characters
 The underscore sign _ represents one, single character
*/

--Select all customers that starts with the letter "a":
SELECT * FROM Customers
WHERE CustomerName LIKE 'a%';


SELECT column1, column2, ...
FROM table_name
WHERE columnN LIKE pattern;

/*
The _ Wildcard
The _ wildcard represents a single character.

It can be any character or number, but each _ represents one, and only one, character.
Return all customers from a city that starts with 'L' followed by one wildcard character, then 'nd' and then two wildcard characters:*/
SELECT * FROM Customers
WHERE city LIKE 'L_nd__';

-- The % Wildcard
-- Return all customers from a city that contains the letter 'L':
SELECT * FROM Customers
WHERE city LIKE '%L%';

-- Return all customers that starts with 'La':
SELECT * FROM Customers
WHERE CustomerName LIKE 'La%';

-- Return all customers that starts with 'a' or starts with 'b':
SELECT * FROM Customers
WHERE CustomerName LIKE 'a%' OR CustomerName LIKE 'b%';

-- END with

SELECT * FROM Customers
WHERE CustomerName LIKE '%a';

-- Return all customers that starts with "b" and ends with "s":

SELECT * FROM Customers
WHERE CustomerName LIKE 'b%s';

/*
Contains
To return records that contains a specific letter or phrase, add the % both before and after the letter or phrase.

Example
Return all customers that contains the phrase 'or'
*/
SELECT * FROM Customers
WHERE CustomerName LIKE '%or%';

/*
Combine Wildcards
Any wildcard, like % and _ , can be used in combination with other wildcards.

Example
Return all customers that starts with "a" and are at least 3 characters in length:
*/
SELECT * FROM Customers
WHERE CustomerName LIKE 'a__%';

/*
Example
Return all customers that have "r" in the second position:
*/
SELECT * FROM Customers
WHERE CustomerName LIKE '_r%';

/*
Without Wildcard
If no wildcard is specified, the phrase has to have an exact match to return a result.

Example
Return all customers from Spain:
*/
SELECT * FROM Customers
WHERE Country LIKE 'Spain';
