SELECT * FROM actor;
--seletc all columns from actor

SELECT last_name , first_name from actor;

SELECT first_name , last_name , email from customer;



--SELECT DISTINCT - return only unique, distinct values in a column
--Removes the duplicates in a column 
--( ) can be used for column name
SELECT * FROM film;
SELECT DISTINCT (release_year) FROM film;
-- or you can remove the paranthesis
-- SELECT DISTINCT release_year FROM film;
SELECT DISTINCT rating FROM film;




--COUNT
--count returns the number of specific rows that matches a condition of a query
--we can apply count on a soecific column
SELECT * FROM payment;

SELECT COUNT (*) FROM payment;

SELECT COUNT (DISTINCT(amount)) FROM payment;
SELECT COUNT (DISTINCT rental_id) FROM payment;




--SELECT WHERE
--allows us to specify conditions on columns for the rows to be returned
--SELECT column1,column2 FROM table WHERE condition;
--comparision operators
-- <> or != not equal to
--AND OR NOT
SELECT * FROM customer;

SELECT * FROM customer 
WHERE first_name ='Jared';

SELECT * FROM film;

SELECT * FROM film
WHERE rental_rate > 4;

SELECT COUNT (*) FROM film
WHERE rental_rate > 4;

SELECT COUNT(title) FROM film
WHERE rental_rate > 4 AND replacement_cost = 19.99
AND rating = 'R';

SELECT email FROM customer
WHERE first_name ='Nancy'
AND last_name ='Thomas';



--ORDER BY
--sort rows based on a column in either ascending or descending order
--for strings or numericals
--ORDER BY column ASC/DESC
--default it is order by ascendig order when you don't speficy that
SELECT * FROM customer
ORDER BY first_name;

SELECT * FROM customer
ORDER BY first_name DESC;

SELECT DISTINCT store_id , first_name FROM customer
ORDER BY store_id DESC, first_name ASC;

SELECT DISTINCT store_id , first_name FROM customer
ORDER BY store_id , first_name ;
--Default it is Ascending order



--LIMIT BY
--limit the umber of rows returned by a query
--Usefull for view the top few rows in a table
--this is the last command of the query because it provides the limitation for the query
SELECT * FROM payment
WHERE amount != 0.00
ORDER BY payment_date DESC
LIMIT 10;

SELECT title,length FROM film
ORDER BY length ASC
LIMIT 10;



--BETWEEN
--can be used to match values in range of values
--value BETWEEN low AND high
--value NOT BETWEEN low ANd high
--this is alsow used with dates
--date BETWEEN '2001-01-01' AND '2001-01-21'
SELECT * FROM payment
WHERE amount BETWEEN 8 AND 9;

SELECT * FROM payment
WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-15';



--IN operator
--use to check if a value included in a list of multiple options
--value IN (option_01 , oprioon_02 ,.......);
--also we can use NOT IN
SELECT DISTINCT * FROM payment
WHERE amount IN (0.99,1.98,1.99)
ORDER BY amount
LIMIT 10;

SELECT COUNT(*) FROM payment
WHERE amount NOT IN (0.99,1.98,1.99)
LIMIT 10;




























