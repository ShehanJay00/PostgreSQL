/*
						VIEWS
Instead of using same code again and again we can. create a view
VIEW is a database object that is of stored query
A VIEW can be accessed as a virtual table
(view is not actually storing that data physically)
*/

SELECT first_name , last_name , address 
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id;
--Now let's save this query as a VIEW 
--instead of writing this vode over and over again

CREATE VIEW customer_info AS
SELECT first_name , last_name , address 
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id;

SELECT * FROM customer_info;

CREATE OR REPLACE VIEW customer_info AS
SELECT first_name , last_name , address , district
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id;

SELECT * FROM customer_info;
--Distrcit is also included now

DROP VIEW IF EXISTS customer_info;

ALTER VIEW customer_info RENAME TO C_info;

SELECT * FROM c_info;






/*
				Imporing and Exporting Data
Not every outside files cannot be imported
Details of compatible file types and examples are in the documentation

--postgresql.org/docs/12/sql-copy.html
The COPY command is what import uses internally when it's actually
running the SQL code to import things through the pgAdmin GUI


IMPORT command does not create a table for you

										Resources
https://stackoverflow.com/questions/21018256/can-i-automatically-create-a-table-in-postgresql-from-a-csv-file-with-headers
https://www.enterprisedb.com/postgres-tutorials/how-import-and-export-data-using-csv-files-postgresql
https://stackoverflow.com/questions/2987433/how-to-import-csv-file-data-into-a-postgresql-table
*/

--First create a table that matches up with the csv table
CREATE TABLE simple(
a INTEGER
b INTEGER
a INTEGER
d INTEGER);
--Right click on the Table and goto Import/Export
--goto the columns and you can remove unwanted columns
--Include the Header



