/*
						NULL IF function
Takes 2 inputs and returns NULL if both equal , otherwise it
returns the FIRST ARGUMENT passed.

NULLIF(10,10)
returns NULL

NULLIF(10,12)
returns 10
*/

CREATE TABLE depts(
firts_name VARCHAR(50),
department VARCHAR(50)
);

INSERT INTO depts(firts_name ,department)
VALUES
('Vinton' , 'A'),
('Lauren' , 'A'),
('Claire' , 'B');

SELECT (
SUM(CASE WHEN department= 'A' THEN 1 ELSE 0 END)/
SUM(CASE WHEN department = 'B' THEN 1 ELSE 0 END)	
)AS department_ratio
FROM depts;

DELETE FROM depts 
WHERE department = 'B';
--Now you have only the people from Dept A

SELECT (
SUM(CASE WHEN department= 'A' THEN 1 ELSE 0 END)/
SUM(CASE WHEN department = 'B' THEN 1 ELSE 0 END)	
)AS department_ratio
FROM depts;
--Division by Zero error

--Now use NULLIF to make sure that instead of getting error we get back a NULL
SELECT(
SUM(CASE WHEN department= 'A' THEN 1 ELSE 0 END)/
NULLIF(SUM(CASE WHEN department = 'B' THEN 1 ELSE 0 END) , 0)
--If both the arguments are same (0 = 0 in here) return the NULL
--Order matters here because it returns 1st one if they are not same
	
)AS department_ratio
FROM depts;




 
