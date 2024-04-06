--TIMESTRSMPS
--These are some datatypes
--TIME - contains only time
--DATE - contains only date
--TIMESTAMP - contanis date and time
--TIMESTAMPTZ - contains date,time and timezone
--carefull considerations should be made when designing a table and chosing a time datatype

SHOW ALL;

SHOW TIMEZONE;

SELECT NOW();  --Give the all time information

SELECT TIMEOFDAY();

SELECT CURRENT_DATE;

SELECT CURRENT_TIME;


/*
Extracting information from a time based data type using

EXTRACT()  - Allows you to extract subcomponents of data value Year , month , day , week , quarter 
AGE()      - Calculates and returns the current age of given timstamp , calculating how old the timestamp
TO_CHAR()  - Convert datatypes into text and usefull for timestamp
*/

SELECT EXTRACT (YEAR FROM payment_date)
FROM payment;

SELECT EXTRACT (YEAR FROM payment_date) 
AS pay_month
FROM payment;

SELECT AGE (payment_date)
FROM payment
ORDER BY payment_date DESC;

SELECT TO_CHAR(payment_date , 'MONTH YYYY')
FROM payment;

SELECT TO_CHAR(payment_date , 'mon/dd/YYYY')
FROM payment;
--Refer the postgre sql "DATA TYPE FORMATTING FUNCTIONS" part in documentation for more info
--Link "https://www.postgresql.org/docs/12/functions-formatting.html"


--During which month the payments are occured
SELECT
DISTINCT(TO_CHAR(payment_date, 'MONTH'))
FROM payment;


--Select how many payments done in monday
SELECT COUNT(*)
FROM payment
WHERE EXTRACT(dow FROM payment_date) = 1;
--Date of Week
--0 is sunday , 1 is monday



--Mathematical Functions
--Add/Substract one column to another
--Refer the documentation in postgre SQL
SELECT ROUND(rental_rate/replacement_cost , 2)*100 AS Percentage
FROM film;

SELECT 0.1 * replacement_cost AS deposit
FROM film;




--String functions and Operators
--Refer to the documentation
SELECT first_name || last_name  --String concatination
FROM customer;

SELECT first_name || ' ' || last_name AS full_name --first_name concatinate with '' and '' concatinate with last_name
FROM customer;

SELECT UPPER(first_name || ' ' || last_name) AS full_name 
FROM customer;

SELECT first_name || last_name || '@gmail.com'
FROM customer;

SELECT LOWER(LEFT(first_name , 1) || last_name) || '@gmail.com'
AS customer_email
FROM customer;


/*
				SUBQUERY
A sub query allows you to construct complex queries.
Essentially performing a query on the results of 
another query

In this , use two SELECT statements

The subquery is performed first , since it is inside the parenthesis

EXISTS operator is used to test for existence of rows in a subquery.
Typically, a subquery is passed n the EXISTS() function to check 
if any rows are returened with the subquery.

SELECT column_name
FROM table_name
WHERE EXISTS
(SELECT column_name FROM table_name WHERE condtion);
*/
SELECT title , rental_rate 
FROM film
WHERE rental_rate >(SELECT AVG(rental_rate) FROM film);
--In here , the subquery in the parentheses will get executed first in order to calculate the AVG
--Then become a part of this larger query

--If your subquery returns back multiple values ,  then you need yo use IN operator on it
SELECT film_id , title
FROM film
WHERE film_id IN
(SELECT inventory.film_id
FROM rental
INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30')
ORDER BY title;

--Find customers who has at least one payment which greater than 11 and grab first_name andlast_name
SELECT first_name , last_name
FROM customer AS c
WHERE EXISTS 
(SELECT * FROM payment AS p
 WHERE p.customer_id = c.customer_id
 AND amount > 11);
 --SubQuery checks if the customer has made at least one payment and that amount is > 11
 
 
 

 /*
 					SELF JOIN
can be viewed as a join of two copies of the same table
there is no special keyword for a self join , 
its simply standard JOIN syntax with the same table in both parts
when using a self join it is necessary to use an ALIAS for the table
otherwise table names would be ambiguous

SELECT tableA.com , tableB.col
FROM table AS tableA
JOIN table AS table ON
tableA.some_col = tableB.some_col;

In here both tableA and tableB means one table, just change the name using AS
 */
 
--Imagine in a company ,there are  employees and they have to send reports to other employees
--Each employee send a report to another employee

--Films that have same length
SELECT f1.title , f2.title , f1.length
FROM film AS f1
INNER JOIN film AS f2 ON
f1.film_id  != f2.film_id    --stop the matching each movies with itself
AND f1.length = f2.length;   --but having same length


 

