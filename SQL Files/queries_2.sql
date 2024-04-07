--GROUP BY will allow us to aggregate data 

/* 			Aggregate Functions
SLQ provides a variety of aggregate functions
these functions happen in a single column
takes a multiple inputs and return a singl output

AVG()  - returns a floating value - can use ROUND()
COUNT()
MAX()
MIN()
SUM()

Aggregate function calls happen only in the SELECT clause of the HAVING clause
*/

SELECT MAX(replacement_cost),MIN(replacement_cost) FROM film;

SELECT AVG(replacement_cost) FROM film;
SELECT ROUND(AVG(replacement_cost),2) FROM film;  --Two decimal points



--GROUP BY
--categories
--the GROUP BY clause must appear right after a FROM of WHERE statement
--SELECT category_col , AGGREGATR(_data_col) FROM table GROUP BY category_col;
SELECT * FROM payment;

SELECT customer_id FROM payment
GROUP BY customer_id
ORDER BY customer_id;


SELECT customer_id , SUM(amount) FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC;

SELECT staff_id , customer_id, SUM(amount) FROM payment
GROUP BY staff_id , customer_id
ORDER BY SUM(amount);
--Staff id 1 with customer id 320 spends 5.9 of amount

SELECT DATE(payment_date) ,SUM(amount) FROM payment  --Get only the date information from the timestamp information
GROUP BY DATE(payment_date)                          --Timestamp information in a database refers to a value that indicates the date and time when a particular event occurred.
ORDER BY SUM(amount) DESC;

SELECT customer_id , SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 5;
--Top 5 customers

/*
when you use the GROUP BY clause, 
you need to ensure that all non-aggregated columns in the SELECT statement 
are either included in the GROUP BY clause or 
used within an aggregate function.
*/




--HAVING
--allowing us to filter after an aggregation has already done, after the GROUO BY clause
SELECT store_id , COUNT(customer_id) FROM customer
GROUP BY store_id
HAVING COUNT (customer_id) > 200;

SELECT customer_id , COUNt(*)
FROM payment
GROUP BY customer_id
HAVING COUNT(*) >= 40;

--customers who have spent more than $100 in payment transations with staff_id member 2
SELECT staff_id , customer_id , SUM(amount)
FROM payment
WHERE staff_id = 2
GROUP BY staff_id , customer_id
HAVING SUM(amount) > 100;
 


--Assesments
SELECT staff_id , customer_id , SUM(amount)
FROM payment
WHERE staff_id =2
GROUP BY staff_id , customer_id
HAVING SUM(amount) >= 110;

SELECT * FROM film;
SELECT COUNT(title) FROM film
WHERE title LIKE 'J%';

SELECT customer_id , first_name , last_name FROM customer
WHERE first_name LIKE 'E%' 
AND address_id < 500
ORDER BY customer_id DESC
LIMIT 1;



--JOINS
--When you have to work with multiple tables ,this is usefull
--refer wikipedia and A visual explanation of SQL joins in Coding horror website
--AS (alias)
--SELECT column AS new_name_for_column
SELECT COUNT(amount) AS num_transactions
FROM payment;

/*
SELECT customer_id , SUM(amount) AS total_spent
FROM payment
GROUP BY customer_id
HAVING total_spent > 100;
--we cannot do this because alias gets assigned at the very end 
*/


/*
                  JOINS
Allows us to combine multiple tables together
For an example you have a online course and some 
people are registered and some of them are actualy 
login to the course.we want to check who are the 
registrations are came to the login.
*/


/*
INNER JOINS
match in both tables

SELECT * FROM table_A
INNER JOIN table_B
ON table_A.colMAtch = table_b.colmatch;  Which column should be joined


SELECT * FROM table_B
INNER JOIN table_A
ON table_B.colMAtch = table_A.colmatch;  Both are same in INNER JOIN

Table order won't matter in INNER JOIN
If you see JOIN without INNER its by default INNER JOIN
*/
SELECT *
FROM customer
INNER JOIN payment
ON payment.customer_id = customer.customer_id;
--Give all the columns of both tables with joined columns

SELECT payment_id , payment.customer_id , first_name
FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id;


/*
OUTTER JOIN works with values only present in one table

				Full Outter Joins
Table order won't matter in OUTTER JOIN
we use WHERE clause to find unique rows for the both tables
*/
SELECT * FROM customer
FULL OUTER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE customer.customer_id IS null 
OR payment.customer_id IS null;
--In here all cusgtomers made the payment

SELECT film.film_id , film_actor.film_id 
FROM film
FULL OUTER JOIN film_actor
ON film.film_id = film_actor.film_id
WHERE film.film_id IS null
OR film_actor.film_id IS null;
--There are three films without any actor in film_actor table


/*
			LEFT OUTER JOIN
Results in the set of records that are in the left table , if there is a no match with the right table
In here order of tables is matter 
If something is found only in the right table, they are not returend by the query
LEFT JOIN is also valid syntax
we can use WHERE clause in here to filter unnique rows to left table 
*/
SELECT film.film_id , title , inventory_id , store_id ,inventory.film_id
FROM film
LEFT OUTER JOIN inventory
ON inventory.film_id = film.film_id
WHERE inventory.film_id IS null;
--Films that we have and are not in our inventory

--RIGHT JOIN is the opposite of the LEFT JOIN
--Tables are switched
--Same as the switching the table order in a LEFT OUTER JOIN
--switch the WHERE to other table

/*
              UNION
Used to combine the result-set of two or more SELECT statements
SELECT * FROM table_01 
UNION
SELECT * FROM table_02
ORDER BY name;
*/


SELECT district , email FROM address
INNER JOIN customer
ON address.address_id = customer.address_id
WHERE district = 'California';
--Check for customers with address by INNER JOIN


--Get the list of all the movies the actor "Nick Wahlberg" is in.
SELECT title , first_name , last_name FROM actor
INNER JOIN film_actor
ON actor.actor_id = film_actor.actor_id   --Find the all actors in the films
INNER JOIN film
ON film_actor.film_id = film.film_id      --Find the all films that have a actor
WHERE first_name = 'Nick' 
AND last_name = 'Wahlberg';










