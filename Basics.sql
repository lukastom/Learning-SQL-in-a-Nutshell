-- Single line comment

/* Multi-line comment
 */
 
/* ----- BASIC INFORMATION -----
 • database, tables, columns, rows
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
     e.g. to display spaces before the number by an application (if needed).
 • VARCHAR = Variable Characters = string data type, 50 = maximum length (only the actual length will consume memory). Can be from 0 to 65535.
 • AUTO_INCREMENT will automatically fill in the PRIMARY KEY column with incremented number (1, 2, 3...). This column is by default NOT NULL.
 • NOT NULL = the column can not have any NULL values.
*/

CREATE TABLE company.customers (
  id INT NOT NULL AUTO_INCREMENT,
  firstname VARCHAR(50),
  lastname VARCHAR(50),
  city VARCHAR(30),
  zipcode INT(10),
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
INSERT INTO customers (firstname, lastname, city, zipcode) VALUES ('John', 'Smith', 'New York', '10199');
-- use backticks ` if there is a space in the column name (which would be a bad practice) or the name is reserved SQL word
INSERT INTO `customers` (`firstname`, `lastname`, `city`, `zipcode`) VALUES ('David', 'Williams', 'Los Angeles', '90052');
INSERT INTO customers (firstname, lastname, city, zipcode) VALUES ('Chloe', 'Anderson', 'Chicago', '60607');
INSERT INTO customers (firstname, lastname, city, zipcode) VALUES ('Emily', 'Adams', 'Houston', '77201');
INSERT INTO customers (firstname, lastname, city, zipcode) VALUES ('James', 'Roberts', 'Philadelphia', '19104');
INSERT INTO customers (firstname, lastname, city, zipcode) VALUES ('Andrew', 'Thomas', 'New York', '');
INSERT INTO customers (firstname, lastname, city, zipcode) VALUES ('Daniel', 'Harris', 'New York', '');
INSERT INTO customers (firstname, lastname, city, zipcode) VALUES ('Charlotte', 'Walker', 'Chicago', '');
INSERT INTO customers (firstname, lastname, city, zipcode) VALUES ('Samuel', 'Clark', 'San Diego', '');
INSERT INTO customers (firstname, lastname, city, zipcode) VALUES ('Anthony', 'Young', 'Los Angeles', '');

-- SELECT
   -- SQL is case insensitive but it is a good practice to use UPPER CASE for keywords
   -- spaces and lines are ignored
SELECT firstname, lastname FROM customers;
   -- RESULT SET = the set of results returned by a query

   --asterisk wildcard * works but in production it is better to name columns (if in the future the table structure changes, the code will still work)
SELECT * FROM customers;

-- DISTINCT = return only unique values
SELECT DISTINCT city FROM customers;

-- LIMIT = return only certain number of records
SELECT * FROM customers LIMIT 2;


    
 
 
