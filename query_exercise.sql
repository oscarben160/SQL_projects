-- Creating 2 new tables

CREATE TABLE test_table1(
	fruit_id int,
	fruit_name text,
	fruit_color text
	);

INSERT INTO test_table1(fruit_id, fruit_name, fruit_color)
VALUES
	(1, 'apple', 'red/yellow/green/orange/pink'),
	(2, 'banana', 'yellow'),
	(3, 'coconut', 'white'),
	(4, 'date', 'brown');

SELECT * FROM test_table1;

CREATE TABLE test_table2(
	fruit_id int,
	fruit_name text,
	fruit_color text
	);

INSERT INTO test_table2(fruit_id, fruit_name, fruit_color)
VALUES
	(5, 'watermelon', 'red'),
	(2, 'banana', 'yellow'),
	(3, 'coconut', 'white'),
	(6, 'lemon', 'yellow');

SELECT * FROM test_table2;

-- EXERCISE
-- UNION test tables 1 and 2
-- UNION ALL

SELECT * FROM test_table1
union
SELECT * FROM test_table2;

SELECT * FROM test_table1
UNION ALL
SELECT * FROM test_table2

-- Create table 3

CREATE TABLE test_table3(
	fruit_id int,
	fruit_name text,
	fruit_flavor text
	);

INSERT INTO test_table3(fruit_id, fruit_name, fruit_flavor)
VALUES
	(1, 'apple', 'sweet and sour'),
	(2, 'banana', 'sweet'),
	(6, 'lemon', 'sour');

SELECT * FROM test_table3;



-- JOINS
-- You can have inner, left, right, full (outer) or cross join.

-- Inner join finds the intersection of two tables
SELECT * FROM test_table1 
INNER JOIN test_table3 
ON test_table1.fruit_id = test_table3.fruit_id;

-- Maybe we don't want to end up with duplicating columns
SELECT test_table1.fruit_id, test_table1.fruit_name, test_table1.fruit_color, test_table3.fruit_flavor
FROM test_table1 
INNER JOIN test_table3 
ON test_table1.fruit_id = test_table3.fruit_id;

-- Give new abbreviated names to your tables to avoid too much typing
SELECT a.fruit_id, a.fruit_name, a.fruit_color, b.fruit_flavor
FROM test_table1 a
INNER JOIN test_table3 b
ON a.fruit_id = b.fruit_id;

-- Left join preserves everything in the first table and tries to find a match
-- in the second table. If there is no match the missing values are NULL
SELECT a.fruit_id, a.fruit_name, a.fruit_color, b.fruit_flavor
FROM test_table1 a
LEFT JOIN test_table3 b
ON a.fruit_id = b.fruit_id;

-- Right join preserves everything in the second table and tries to find a match
-- in the first table. If there is no match the missing values are NULL
-- In SQLite there is no command RIGHT JOIN. To implement it you use a LEFT JOIN and 
-- switch the order of the tables

-- Left join
SELECT * FROM test_table1 
LEFT JOIN test_table3 
ON test_table1.fruit_id = test_table3.fruit_id;

-- right join - swap tables 1 and 3
SELECT * FROM test_table3 
LEFT JOIN test_table1 
ON test_table1.fruit_id = test_table3.fruit_id;

-- Full join preserves everything in both tables and fills in missing values with NULL 
-- In SQLite there's no command FULL JOIN. It's a UNION of a left and a right join
SELECT a.fruit_id, a.fruit_name, a.fruit_color, b.fruit_flavor
FROM test_table1 a
LEFT JOIN test_table3 b
ON a.fruit_id = b.fruit_id
UNION
SELECT a.fruit_id, a.fruit_name, b.fruit_color, a.fruit_flavor
FROM test_table3 a
LEFT JOIN test_table1 b
ON a.fruit_id = b.fruit_id;

-- Cross join doesn't use a key column to match rows. It matches any row to any other row
SELECT * FROM test_table1 
CROSS JOIN test_table3;

-- for the query above - table 1 has 4 rows. Table 3 has 3 rows. The cross-join table 
-- has 12 rows. The number of rows of a cross join is always the product of rows of
-- the two tables. So it can easily become too big. 


SELECT * FROM test_table1 
INNER JOIN test_table3;

SELECT * FROM test_table1 
LEFT JOIN test_table3;

-- CASE WHEN - this is like an if-else statement

-- about the ratings - below is info from a Google search 
-- G: General Audiences. This program is designed to be appropriate for all ages. ...
-- PG: Parental Guidance Suggested. Parents are urged to give parental guidance. ...
-- PG-13: Parents Strongly Cautioned. Some material may not be suited for children under age 13. ...
-- R: Restricted. ...
-- NC-17: Clearly Adult.

-- Let's try to add more information to the movie rating

-- You can use the values in a column to add another column with new information
-- note that the result of a CASE statement is a new column - you need to separate it 
-- with a comma from your other columns and you have to give it a name at the end
SELECT title, rating,
CASE 
	WHEN rating = 'G' THEN 'General Audience'
	WHEN rating = 'PG' THEN 'Parental Guidance Suggested'
	WHEN rating = 'PG-13' THEN 'Parents Strongly Cautioned'
	WHEN rating = 'R' THEN 'Restricted'
	ELSE 'Clearly Adult'
END AS rating_details
FROM film;
	
-- GROUP BY
-- GROUP BY allows you to group values together based on some filed. It must be used
-- with some sort of aggregate function - COUNT(), MIN(), MAX(), AVG()

-- Let's see how many movies are in each rating category
SELECT rating, COUNT(*) as rating_count FROM film
GROUP BY rating;

-- find the minimum replacement cost for each rating category
SELECT rating, MIN(replacement_cost) as min_replacement_cost FROM film
GROUP BY rating;

-- find the average replacement cost for each rating category
SELECT rating, AVG(replacement_cost) as avg_replacement_cost FROM film
GROUP BY rating;

-- this is another way of creating a table. You make a new table to store the results
-- of some query. Think of these new tables as temporary variables. You can reuse them.
CREATE TABLE average_replacement_cost_per_category AS	
SELECT rating, AVG(replacement_cost) as min_replacement_cost FROM film
GROUP BY rating;

SELECT * FROM average_replacement_cost_per_category;

-- at the end we can drop the table we no loner need
DROP TABLE test_table1;
DROP TABLE test_table2;
DROP TABLE test_table3;
DROP TABLE average_replacement_cost_per_category; 