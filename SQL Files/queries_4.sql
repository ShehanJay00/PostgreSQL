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
	WHEN (customer_id BETWEEN 100 AND 200) THEN 'Plus'
	ELSE 'Normal'
END
FROM customer;


