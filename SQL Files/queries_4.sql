--Conditional expressions and Procedures

/*			CASE Statement

This is like if else in other programming languages
There are two main ways to use the CASE statement
		General CASE
		CASE Expression
		
		

	01. General CASE

Better for conditional cases

CASE
	WHEN condtion01 THEN result01
	WHEN condition02 THEN result02
	ELSE some_other_result
END

SELECT columnName
CASE
	WHEN row01 = 1 THEN 'one'
	WHEN row02 = 2 THEB 'two'
ELSE
	'other' AS label
END
FROM tableName;




	02.  CASE Expression

In here searching for values , rather than the condtions
	
CASE expression
	WHEN value01 THEN result01
	WHEN value02 THEN result02
ELSE some_other_result
END


SELECT columnName
	CASE columnName
			WHEN 1 THEN 'one'
			WHEN 2 THEN 'two'
			ELSE 'other'
	END
FROM tableName;
*/

SELECT customer_id,
CASE 
	WHEN (customer_id <= 100) THEN 'Premium Customers'
	WHEN (customer_id BETWEEN 100 AND 200) THEN 'Plus Customers'
	ELSE 'Normal Customers'
END
FROM customer;

--Rename the case column
SELECT customer_id,
CASE 
	WHEN (customer_id <= 100) THEN 'Premium Customers'
	WHEN (customer_id BETWEEN 100 AND 200) THEN 'Plus Customers'
	ELSE 'Normal Customers'
END AS customer_class
FROM customer;


--CASE expression
SELECT customer_id,
CASE customer_id
	WHEN 2 THEN  'Winner'
	WHEN 5 THEN  'Second Place'
	ELSE 'Normal'
END AS raffle_results
FROM customer
ORDER BY customer_id;


SELECT
CASE rental_rate
	WHEN 0.99 THEN 1
	ELSE 0
END
FROM film;
--Only shows the case column

SELECT rental_rate,
CASE rental_rate
	WHEN 0.99 THEN 1
	ELSE 0
END
FROM film;


--Count how many 99 cent movies have
SELECT
SUM(CASE rental_rate
	WHEN 0.99 THEN 1
	ELSE 0
END) AS number_of_bargains,

SUM(CASE rental_rate
	WHEN 2.99 THEN 1
    ELSE 0
END) number_of_regular
FROM film;


SELECT
SUM(CASE rating
	WHEN 'R'  THEN 1
	ELSE 0
END) AS r  ,

SUM(CASE rating
	WHEN 'PG' THEN 1
    ELSE 0
END) AS pg,

SUM(CASE rating
	WHEN 'PG-13' THEN 1
    ELSE 0
END) AS pg13
FROM film;






/*
			COALESCE function
			
Accepts an unlimited number of arguments
and returns the first argument that is NOT NULL

COALESCE(arg_1 , arg_2 , arg_3 , arg_4)

Usefull when querying a table that contains null values
and substituting it with another value

SELECT item , (price - COALESCE(discount , 0))
AS final_price 
FROM table 

First check discount and check it is a Non-Null value
If its a non null it returns the value
If this count is NULL then it is assigned the 0 
(the next value of the COALESCE function)
*/





/* 
				CAST
Convert one datatype to another
It must be reasonable to convert data
for example '5' (string) to an Integer will work
'Five' to an integer will not work

Two ways to do cast
01. Syntax for CAST function
	SELECT CAST('5' AS INTIGER

02. PostgreSQL CAST operator(only available in postgre sql engines)
	SELECT '5'::INTEGER
	
SELECT CAST(date ad TIMESTAMP)
FROM table
*/

SELECT CAST('5'AS INTEGER) AS new_int;
--SELECT CAST('five'AS INTEGER) AS new_int;
SELECT '10'::INTEGER;

SELECT CHAR_LENGTH(CAST (inventory_id AS VARCHAR))
FROM rental;
--See the documentation for String Functions













