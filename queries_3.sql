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


