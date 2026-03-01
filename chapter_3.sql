USE sakila;

SELECT first_name, last_name
FROM customer
WHERE last_name = 'ZIEGLER';

SELECT *
FROM category;

SELECT *
FROM language;

SELECT language_id, name, last_update
FROM language;

SELECT name
FROM language;

SELECT language_id,
'URDU' language,
language_id * 3.1415927 lang_pi_value,
upper(name) language_name
FROM language;

SELECT version(),
user(),
database();

SELECT language_id,
'URDU' AS language,
language_id * 3.1415927 AS lang_pi_value,
upper(name) AS language_name
FROM language;

SELECT actor_id
FROM film_actor
ORDER BY actor_id;

SELECT DISTINCT actor_id
FROM film_actor
ORDER BY actor_id;

SELECT concat(cust.last_name,',', cust.first_name) full_name
FROM (SELECT first_name, last_name, email
FROM customer
WHERE first_name = 'JESSIE') cust;

CREATE TEMPORARY TABLE actors_j
(actor_id smallint(5),
first_name varchar(45),
last_name varchar(45)
);

INSERT INTO actors_j
SELECT actor_id, first_name, last_name
FROM actor
WHERE last_name LIKE 'J%';

SELECT * 
FROM actors_j;

CREATE VIEW cust_vw AS
SELECT customer_id, first_name, last_name, active
FROM customer;

SELECT first_name, last_name
FROM cust_vw
WHERE active=0;

SELECT customer.first_name, customer.last_name,
time(rental.rental_date) rental_time
FROM customer
INNER JOIN rental
ON customer.customer_id = rental.customer_id
WHERE data(rental.rental_date) = '2005-06-14';

SELECT c.first_name, c.last_name,
time(r.rental_date) rental_time
FROM customer c
INNER JOIN rental r
ON c.customer_id = r.customer_id
WHERE data(r.rental_date) = '2005-06-14';

SELECT c.first_name, c.last_name,
time(r.rental_date) rental_time
FROM customer AS c
INNER JOIN rental AS r
ON c.customer_id = r.customer_id
WHERE data(r.rental_date) = '2005-06-14';

SELECT title
FROM film
WHERE rating = 'G' 
AND rental_duration >=7;

SELECT title
FROM film
WHERE rating = 'G' 
OR rental_duration >=7;

SELECT title, rating, rental_duration
FROM film
WHERE(rating = 'G' AND rental_duration >=7)
OR (rating = 'PG-13' AND rental_duration < 4);

SELECT c.first_name, c.last_naem, count(*)
FROM customer AS c
INNER JOIN rental AS r
ON c.customer_id = r.customer_id
GROUP BY c.first_name, c.last_name
HAVING count(*) >= 40;


SELECT c.first_name, c.last_naem
FROM customer AS c
INNER JOIN rental AS r
ON c.customer_id = r.customer_id
WHERE date(r.rental_date) ='2005-06-14';


SELECT c.first_name, c.last_naem
FROM customer AS c
INNER JOIN rental AS r
ON c.customer_id = r.customer_id
WHERE date(r.rental_date) ='2005-06-14'
ORDER BY c.last_name;

SELECT c.first_name, c.last_naem
FROM customer AS c
INNER JOIN rental AS r
ON c.customer_id = r.customer_id
WHERE date(r.rental_date) ='2005-06-14'
ORDER BY c.last_name, c.first_name;

SELECT c.first_name, c.last_naem
FROM customer AS c
INNER JOIN rental AS r
ON c.customer_id = r.customer_id
WHERE date(r.rental_date) ='2005-06-14'
ORDER BY c.first_name, c.last_name;


SELECT c.first_name, c.last_naem
FROM customer AS c
INNER JOIN rental AS r
ON c.customer_id = r.customer_id
WHERE date(r.rental_date) ='2005-06-14'
ORDER BY time(r.rental_date) desc;

SELECT c.first_name, c.last_naem
FROM customer AS c
INNER JOIN rental AS r
ON c.customer_id = r.customer_id
WHERE date(r.rental_date) ='2005-06-14'
ORDER BY 3 desc;


SELECT actor_id, first_name, last_name
FROM actor
ORDER BY last_name, first_name;

SELECT actor_id, first_name, last_name
FROM actor
ORDER BY 3,2;

SELECT actor_id, first_name, last_name
FROM actor
WHERE last_name ='WILLIAMS' OR 
last_name = 'DAVIS';


SELECT actor_id, first_name, last_name
FROM actor
WHERE last_name IN ('WILLIAMS','DAVIS');

SELECT DISTINCT customer_id
FROM rental
WHERE date(rental_date) = '2005-07-05';

SELECT c.email, r.return_date
FROM customer AS c
INNER JOIN rental AS r
ON c.customer_id = r.customer_id
WHERE date(r.rental_date) = '2005-06-14'
ORDER BY return_date DESC;

