/*
				CREATE TABLE
				
CREATE TABLE table_name(
	column_name DATATYPE CONSTRAINT,
	column_name DATATYPE CONSTRAINT,
)


CREATE TABLE table_name(
	column_name DATATYPE CONSTRAINT,
	column_name DATATYPE CONSTRAINT,
	table_constraints
)	INHERITS existing_table_name; 

inherit contraints from another table

*/


CREATE TABLE account(
	user_id SERIAL PRIMARY KEY,
	username VARCHAR(50) UNIQUE NOT NULL,
	password VARCHAR(50) NOT NULL,
	email VARCHAR(250) UNIQUE NOT NULL,
	created_on TIMESTAMP NOT NULL,
	last_login TIMESTAMP
);



CREATE TABLE job(
	job_id SERIAL PRIMARY KEY,
	job_name VARCHAR(200) UNIQUE NOT NULL
);

CREATE TABLE account_job(
	user_id INTEGER REFERENCES account(user_id),
	job_id INTEGER REFERENCES job(job_id),
	hire_date TIMESTAMP 
);
--In here we dont use SERIAL datatype because they are not PRIMARY KEYs







/*
	INSERT Values into a table
	
INSERT INTO table (column_1 , column_2)
VALUES 
	(value1 , value2),
	(value1 , value2);
*/


/*
	INSERT Values from another table
	
INSERT INTO table (column_1 , column_2)
SELECT column1 , column2
FROM another_table_name
WHERE condtion;

The inserted row values must match up for the table
Including data types and constraints

SERIAL columns do not need to be provided a value
It's automatically updates the next available integer for that row
*/

INSERT INTO account(username , password , email , created_on)
VALUES
('Jose' , 'password' , 'jose@gmail.com' , CURRENT_TIMESTAMP);

INSERT INTO job(job_name)
VALUES ('Astronaut'),('President');

INSERT INTO account_job(user_id , job_id , hire_date)
VALUES (1 , 1 , CURRENT_TIMESTAMP);
--You can't violate foriegn key constraints here








/*
			UPDATE
Allows to change values in a column

UPDATE table_name
SET
column1 = value1,
column2 = value2
WHERE condition;


Use another table's values(update join)

UPDATE tableA
SET original_col = tableB.new_col
FROM tableB
WHERE tableA.id = tableB.id;


Return Affected rows

UPDATE account
SET last_login = created_on
RETURNING account_id , last_login
*/

--Change the Null column of account table
UPDATE account
SET last_login = CURRENT_TIMESTAMP;
--SELECT * FROM account

UPDATE account
SET last_login = created_on;
--SELECT * FROM account

--Update usong two tables (Update Join)
UPDATE account_job
SET hire_date = account.created_on
FROM account
WHERE account_job.user_id = account.user_id;  --In here the JOIN comes to the account
--SELECT * FROM account_job

--Return affected rows
UPDATE account
SET last_login = CURRENT_TIMESTAMP
RETURNING email , created_on , last_login;







/*
		DELETE
		
DELETE FROM table
WHERE row_id = 1

DELETE FROM tableA
USING tableB
WHERE tableA.id = tableB.id

DELETE FROM table
*/

INSERT INTO job(job_name)
VALUES ('Cowboy');

DELETE FROM job
WHERE job_name = 'Cowboy'
RETURNING job_id , job_name;
--Returning all the deleted rows

DELETE FROM job
--Deletes all the rows






/*
					ALTER
ALter clause allows you to change to an existing table structure
such as;
	Adding , droping or renaming columns
	changing columns data type
	select DEFAULT values for a column
	add CHECK constraints
	rename table
	
ALTER TABLE table_name
Action You want

ALTER TABLE table_name
ADD COLUMN new_col TYPE

ALTER TABLE table_name
DROP COLUMN col_name

ALTER TABLE table_name
ALTER COLUMN col_name
DROP DEFAULT

*/
CREATE TABLE information(
	info_id SERIAL PRIMARY KEY,
	title VARCHAR(500) NOT NULL,
	person VARCHAR(500) NOT NULL UNIQUE
);

--Rename the table name
ALTER TABLE information
RENAME TO new_info;

ALTER TABLE new_info
RENAME COLUMN person TO people;

--alter constraints
INSERT INTO new_info(title)
VALUES ('Some New Title');
--person column cannot be null in here
--now let's remove that constraint for person column

ALTER TABLE new_info
ALTER COLUMN people DROP NOT NULL;
--Now you can insert title with null person

--For more refer to the documentation





/*
						DROP
Allows a complete removal of a column in a table
Autimatically remove all of its indexes and costraints involving the column
foriegn key contraints also

It will not automatically remove columns used in views ,trigers 
or stored procedures without additional CASCADE clause


ALTER TABLE table_name
DROP COLUMN col_name;

ALTER TABLE table_name
DROP COLUMN col_name CASCADE;

ALTER TABLE table_name
DROP COLUMN IF EXISTS col_name;

ALTER TABLE table_name
DROP COLUMN col1_name , DROP COLUMN col2_name
*/
ALTER TABLE new_info
DROP COLUMN people;
--SELECT * FROM new_info

ALTER TABLE new_info
DROP COLUMN IF EXISTS people;








/*
						CHECK CONSTRAINT
ALlows us to create more customized constraints that adhere to a
certain condition

CHECK conditon
*/

CREATE TABLE employees(
	emp_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	birthday DATE CHECK ( birthday > '1900-01-01'),
	hire_date DATE CHECK( hire_date > birthday),
	salary INTEGER CHECK ( salary > 0)
);

INSERT INTO employees(first_name , last_name , birthday , hire_date , salary)
VALUES
('Jose' , 'Potilla' , '1899-11-02' , '2010-01-01' , 10000)
--violates check constraint
























 


