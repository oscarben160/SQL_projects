-- EXERCISE 
-- Make a table that has the name of each actor and the name of all movies he/she has 
-- been in 

-- Here is a sample output 
--actor_id    first_name  last_name      film_id   title
--1	          PENELOPE	  GUINESS	      1	       ACADEMY DINOSAUR
--1	          PENELOPE	  GUINESS	      23	   ANACONDA CONFESSIONS
--1	          PENELOPE	  GUINESS	      25	   ANGELS LIFE
--1	          PENELOPE	  GUINESS	      106	   BULWORTH COMMANDMENTS

SELECT a.actor_id, a.first_name, a.last_name, f.film_id, f.title
FROM actor a 
JOIN film_actor fa ON (a.actor_id = fa.actor_id)
JOIN film f ON (f.film_id = fa.film_id);
-----------------------------------------------------
-- EXERCISE 
-- use ROW_NUMBER(), RANK() or DENSE_RANK()
-- all queries should return columns title, replacement_cost, rating and rank or row number

-- Find one example of cheapest (in terms of replacement cost) film for each rating. There 
-- are 5 ratings so you need 5 movies. Should you be using ROW_NUMBER(), RANK() or DENSE_RANK()? 

-- My output
-- title            replacement_cost rating number
-- CONTROL ANTHEM	    9.99	     G		1
-- EDGE KISSING	        9.99	     NC-17	1
-- CIDER DESIRE	        9.99	     PG		1
-- FACTORY DRAGON	    9.99	     PG-13	1
-- ANACONDA CONFESSIONS	9.99	     R		1

SELECT * FROM(
	SELECT
	title,
	replacement_cost,
	rating,
	ROW_NUMBER() OVER (PARTITION BY rating ORDER BY replacement_cost) RANK  
FROM film
)
WHERE rank = 1;
------------------------------------------------------
-- EXERCISE 
-- Find all the cheapest movies in each rating. Should you be using ROW_NUMBER(), RANK() or DENSE_RANK()?

SELECT * FROM(
	SELECT
	title,
	replacement_cost,
	rating,
	RANK() OVER (PARTITION BY rating ORDER BY replacement_cost) RANK 
FROM film
)
WHERE RANK = 1;