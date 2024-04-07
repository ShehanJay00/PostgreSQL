--How can you retrieve all the information from the cd.facilities table?
SELECT * FROM cd.facilities;


--You want to print out a list of all of the facilities and their cost to members
--How would you retrieve a list of only facility names and costs?
SELECT name , membercost
FROM cd.facilities;


--How can you produce a list of facilities that charge a fee to members?
SELECT * FROM cd.facilities
WHERE membercost > 0;


--How can you produce a list of facilities that charge a fee to members, 
--and that fee is less than 1/50th of the monthly maintenance cost? 
--Return the facid, facility name, member cost, 
--and monthly maintenance of the facilities in question.
SELECT facid, name , membercost , monthlymaintenance
FROM cd.facilities
WHERE  membercost > 0 AND membercost <  monthlymaintenance * 1/50;


--How can you produce a list of all facilities with the word 'Tennis' in their name?
SELECT * FROM cd.facilities
WHERE name LIKE '%Tennis%';


--How can you retrieve the details of facilities with ID 1 and 5? 
--Try to do it without using the OR operator
SELECT * FROM cd.facilities
WHERE facid IN (1,5);


--How can you produce a list of members who joined after the start of September 2012? 
--Return the memid, surname, firstname, and joindate of the members in question
SELECT  memid , surname , firstname , joindate
FROM cd.members
WHERE joindate > '2012-09-01';






