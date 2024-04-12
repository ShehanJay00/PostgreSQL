CREATE TABLE students(
	user_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50), 
	homeroom_number VARCHAR(50), 
	phone VARCHAR(50) UNIQUE NOT NULL,
	email VARCHAR(50) UNIQUE NOT NULL,
	graduation_year TIMESTAMP
);


CREATE TABLE teachers(
	teacher_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50), 
	homeroom_number VARCHAR(50), 
	department VARCHAR(50) ,
	phone VARCHAR(50) UNIQUE NOT NULL,
	email VARCHAR(50) UNIQUE NOT NULL
);

INSERT INTO students(first_name , last_name , phone)
VALUES ('Mark' , 'Watney' , '777-555-1234');

INSERT INTO teachers(first_name,last_name, homeroom_number,department,email,phone)
VALUES ('Jonas','Salk',5,'Biology','jsalk@school.org','7755554321');


SELECT * FROM teachers;

