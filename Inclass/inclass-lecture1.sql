select *
from actor;


--Specify what columns
SELECT first_name, last_name 
FROM actor;


--Look for specific actor with where clause FILTER 
SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name = 'Sean';

SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name LIKE 'Sean'

--How many actors are there with the last name 'Wahlberg'? 2
SELECT last_name, first_name 
FROM actor
WHERE last_name = 'Wahlberg';

--How many different film ratings are stored in the database? (R, PG-13, PG, etc) 5
SELECT rating
FROM film;

--how many different film categories are there? (Horror, comedy, etc.) 16
SELECT category_id
FROM film_category;

--Query for every name that starts with S
--% any amount of any characters
SELECT *
FROM actor
WHERE first_name like 'S%n'

SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'S___';

select first_name, last_name
from actor
where first_name LIKE 'K_%th'

SELECT *
FROM payment;

SELECT payment_id, customer_id, rental_id, amount
FROM payment
WHERE amount > 2;

SELECT payment_id, customer_id, rental_id, amount 
FROM payment
WHERE amount <= 7.99;

SELECT *
FROM payment p 
WHERE amount > 2
ORDER BY amount ASC;

SELECT customer_id, amount
FROM payment p 
WHERE amount <> 0;

SELECT *
FROM payment p 
WHERE amount BETWEEN 2 AND 7.99


--Aggregators: SUM(), AVG(), COUNT(), MIN(), MAX()
SELECT customer_id, sum(amount) AS "Totalsales"
FROM payment p
GROUP BY customer_id
ORDER BY "Totalsales" desc;

SELECT AVG(amount)
FROM payment p;

SELECT customer_id, avg(amount) AS average_purchase
FROM payment p 
GROUP BY customer_id;

SELECT count(payment_id)
FROM payment p;

SELECT customer_id, count(payment_id)
FROM payment p
WHERE customer_id = 599
GROUP BY customer_id;



SELECT *
FROM customer;

SELECT *
FROM payment;

SELECT customer_id, count(customer_id) AS payments_made
FROM payment
GROUP BY customer_id
HAVING count(customer_id) > 20


SELECT MIN(amount) AS "smallest_above_7.99"
FROM payment p 
WHERE amount > 7.99

SELECT MAX(amount)
FROM payment p
WHERE amount < 2.99

SELECT *
FROM payment
WHERE amount = 1.99 AND customer_id = 599 AND (payment_id = 18464 OR payment_id =22617);
