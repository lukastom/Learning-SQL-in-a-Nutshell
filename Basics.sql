-- Single line comment

/* Multi-line comment
 */
 
/* ----- BASIC INFORMATION -----
    • database, tables, columns, rows
    • PRIMARY KEYS = a column with a unique values (no NULL values) like an ID column (values 1, 2, 3, ...)
    • SQL = Structured Query Language
    • installation of MySQL on a Windows computer:
      • old way: XAMPP (includes PHPmyAdmin and MySQL)
      • new way: Laragon
*/

-- CREATING AN EXAMPLE DATABASE

CREATE DATABASE customers;

CREATE TABLE customers (
  ID INT (10),               --INT = Integer = medium integer data type. Range is from -2147483648 to 2147483647 (it is signed as default). 10 has nothing to do with number range. It is "display width" metadata in result set, that can be used to display spaces before shorter number by the application.
  FirstName VARCHAR(50),     --VARCHAR = Variable Characters = string data type, 50 = maximum length (only the real length will consume memory). Can be from 0 to 65535.
  LastName VARCHAR(50),
  City VARCHAR(30),
  ZipCode INT(10)
);

SHOW DATABASES;

    
 
 
