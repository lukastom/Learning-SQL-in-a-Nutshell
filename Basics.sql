-- Single line comment

/* Multi-line comment
 */

 /* ----- NAMING CONVENTIONS -----
  • choose one:
    • snake_case
    • PascalCase
 */
 
/* ----- BASIC INFORMATION -----
 • database > tables > columns, rows
 • PRIMARY KEYS = column with unique values (no NULL values) like ID column (values 1, 2, 3, ...)
 • SQL = Structured Query Language
 • installation of MySQL on a Windows computer:
   • old way: XAMPP (includes PHPmyAdmin and MySQL)
   • new way: Laragon
*/

-- CREATING EXAMPLE DATABASE

CREATE DATABASE company;

/*
 • INT = Integer = medium integer data type. Range is from -2147483648 to 2147483647 (it is SIGNED as default).
   • (10) has nothing to do with number range. It is "display width" metadata in result set, that can be used
     e.g. to display spaces before the number by an application (if needed). It is now deprecated.
 • VARCHAR = Variable Characters = string data type, 50 = maximum length (only the actual length will consume memory). Can be from 0 to 65535.
 • AUTO_INCREMENT will automatically fill in the PRIMARY KEY column with incremented number (1, 2, 3...). This column is by default NOT NULL.
 • NOT NULL = the column can not have any NULL values.
 • company.customers = FQN (fully qualified name) = name that specifies all the parts of an object
*/

CREATE TABLE company.customers (
  id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  city VARCHAR(30),
  zipcode INT(10),
  age INT(3),
  salary INT (10),
  PRIMARY KEY (id)
);

SHOW DATABASES;

-- USE [database name] - selects a database
USE company;

SHOW TABLES;
SHOW COLUMNS FROM customers;

/* ----- VALUES FOR EACH COLUMN -----
 • Field = column name
 • Type = column data type
 • Null = indicates whether the column can contain NULL values (YES/NO)
 • Key = indicates whether the column is indexed
 • Default = default value assigned to the column
 • Extra = displays special information about columns (ex.: AUTO_INCREMENT)
 */

-- use single quotes ' for strings and dates
   -- (usage of double quotes " is discouraged because their functionality depends on SQL mode server setting)
INSERT INTO customers (first_name, last_name, city, zipcode, age, salary) VALUES ('John', 'Smith', 'New York', '10199', 35, 2000);
-- use backticks ` if there is a space in the column name (which would be a bad practice) or the name is reserved SQL word
INSERT INTO `customers` (`first_name`, `last_name`, `city`, `zipcode`, `age`, `salary`) VALUES ('David', 'Williams', 'Los Angeles', '90052', 23, 1500);
INSERT INTO customers (first_name, last_name, city, zipcode, age, salary) VALUES ('Chloe', 'Anderson', 'Chicago', '60607', 27, 3000);
INSERT INTO customers (first_name, last_name, city, zipcode, age, salary) VALUES ('Emily', 'Adams', 'Houston', '77201', 34, 4500);
INSERT INTO customers (first_name, last_name, city, zipcode, age, salary) VALUES ('James', 'Roberts', 'Philadelphia', '19104', 31, 2000);
INSERT INTO customers (first_name, last_name, city, zipcode, age, salary) VALUES ('Andrew', 'Thomas', 'New York', '', 45, 2500);
INSERT INTO customers (first_name, last_name, city, zipcode, age, salary) VALUES ('Daniel', 'Harris', 'New York', '', 30, 3000);
INSERT INTO customers (first_name, last_name, city, zipcode, age, salary) VALUES ('Charlotte', 'Walker', 'Chicago', '', 35, 3500);
INSERT INTO customers (first_name, last_name, city, zipcode, age, salary) VALUES ('Samuel', 'Clark', 'San Diego', '', 20, 4000);
INSERT INTO customers (first_name, last_name, city, zipcode, age, salary) VALUES ('Anthony', 'Young', 'Los Angeles', '', 33, 5000);

CREATE TABLE orders (
   id INT NOT NULL AUTO_INCREMENT,
   name VARCHAR (50),
   customer_id INT,
   amount INT,
   PRIMARY KEY (id)
)

INSERT INTO orders (name, customer_id, amount) VALUES ('Book', 3, 5000);
INSERT INTO orders (name, customer_id, amount) VALUES ('Box', 5, 3000);
INSERT INTO orders (name, customer_id, amount) VALUES ('Toy', 2, 4500);
INSERT INTO orders (name, customer_id, amount) VALUES ('Flowers', 4, 1800);
INSERT INTO orders (name, customer_id, amount) VALUES ('Cake', 1, 6700);

-- SELECT
   -- SQL is case insensitive but it is a good practice to use UPPER CASE for keywords
   -- spaces and lines are ignored
SELECT first_name, last_name FROM customers;
   -- RESULT SET = the set of results returned by a query

   --asterisk wildcard * works but in production it is better to name columns (if in the future the table structure changes, the code will still work)
SELECT * FROM customers;

-- DISTINCT = return only unique values
SELECT DISTINCT city FROM customers;

-- LIMIT = return only certain number of records
SELECT * FROM customers LIMIT 2;

-- ORDER BY
SELECT first_name, last_name FROM customers ORDER BY last_name;
  -- ascending (default)
SELECT first_name, last_name FROM customers ORDER BY last_name ASC;
  -- descending
SELECT first_name, last_name FROM customers ORDER BY last_name DESC;
SELECT first_name, last_name FROM customers ORDER BY last_name, first_name;

--WHERE (condition)
SELECT id, first_name, last_name FROM customers WHERE id = 3;
SELECT id, first_name, last_name FROM customers WHERE id != 3;
SELECT id, first_name, last_name FROM customers WHERE id <> 3;
SELECT id, first_name, last_name FROM customers WHERE id BETWEEN 2 AND 3;
SELECT id, first_name, last_name, age FROM customers WHERE age >= 18 AND age <=50;
SELECT id, first_name, last_name, city FROM customers WHERE city = 'New York';
SELECT id, first_name, last_name, city FROM customers WHERE city = 'New York' OR city = 'Chicago';
SELECT id, first_name, last_name, city FROM customers WHERE city = 'New York' AND (age >= 18 AND age <=50);
   -- Escape ' with one more '. Example: 'Can''t'

/*
┌─────────────────────┬────────────────────────┐
│     Operator        │      Description       │
├─────────────────────┼────────────────────────┤
│ =                   │ Equal                  │
│ !=                  │ Not equal              │
│ >                   │ Greater                │
│ <                   │ Less                   │
│ >=                  │ Greater than or equal  │
│ <=                  │ Less than or equal     │
│ <>                  │ Not equal              │
│ BETWEEN ... AND ... │ Within inclusive range │
│ AND                 │ And                    │
│ OR                  │ Or                     │
│ IN                  │ equal to 1 from list   │
│ NOT                 │ True if not true       │
│ +                   │ addition               │
│ -                   │ subtraction            │
│ *                   │ multiplication         │
│ /                   │ division               │
└─────────────────────┴────────────────────────┘
*/

--this:
SELECT * FROM customers WHERE city = 'New York' OR city = 'Los Angeles' OR City = 'Chicago';
--can be replaced by IN:
SELECT * FROM customers WHERE city IN ('New York', 'Los Angeles', 'Chicago');
--logical inversion:
SELECT * FROM customers WHERE city NOT IN ('Houston', 'Philadelphia', 'San Diego');

--CONCAT (concatenation)
SELECT CONCAT(first_name, ', ' , city) FROM customers;

--AS (alias)
  -- assigns a custom name to the column
SELECT CONCAT(first_name, ', ' , city) AS first_name_and_city FROM customers;

--ARITHMETIC OPERATORS
SELECT id, first_name, last_name, salary+500 AS salary FROM customers;

--SUM (sum for a column's values)
SELECT SUM(salary) FROM customers;

--AVG (average value from column's values)
SELECT AVG(salary) FROM customers;

--MIN (the lowest value from column's values)
SELECT MIN(salary) FROM customers;

--SUBQUERIES
  -- displaying salaries greater than the average salary
SELECT first_name, salary FROM customers 
WHERE  salary > (SELECT AVG(salary) FROM customers) 
ORDER BY salary DESC;

/* LIKE (search for a pattern)
 • _ = single character
 • % = any number of characters (including zero)
*/
SELECT * FROM customers 
WHERE last_name LIKE 'A%';

/* ----- JOINING TABLES -----
 • "joining tables" = combining data from more tables. It creates a temporary table showing the data from the joined tables.
 */
--OLDER VARIANT:
SELECT customers.id, customers.last_name, orders.name, orders.amount
--what tables to join
FROM customers, orders
--join
WHERE customers.id=orders.customer_id
ORDER BY customers.id;

--NEW INNER JOIN VARIANT:
SELECT * FROM customers INNER JOIN orders ON customers.id=orders.customer_id;
  -- [table 1] INNER JOIN [table 2]
  -- Only the records matching the join condition are returned.

--JOIN DOES EXACTLY THE SAME (because JOIN is defaultly of the INNER type):
SELECT * FROM customers JOIN orders ON customers.id=orders.customer_id;

--Using aliases for better readability of long complicated queries
SELECT cus.id, cus.last_name, ord.name, ord.amount
FROM customers AS cus, orders AS ord
WHERE cus.id=ord.customer_id
ORDER BY cus.id;













    
 
 
