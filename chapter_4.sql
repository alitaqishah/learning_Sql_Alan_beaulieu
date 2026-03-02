WHERE first_name = 'STEVEN' AND create_date > '2006-01-01'

WHERE first_name = 'STEVEN' OR create_date > '2006-01-01'

WHERE (first_name ='STEVEN' OR last_name ='YOUNG')
AND create_date > '2006-01-01'

WHERE NOT (first_name ='STEVEN' OR last_name ='YOUNG')
AND create_date > '2006-01-01'

WHERE first_name <> 'STEVEN' AND last_name <> 'YOUNG'
AND create-date > '2006-01-01'

title ='RIVER OUTLAW'
fed_id= '111-11-1111'
amount = 375.25
film_id = (SELECT firm_id FROM film WHERE title = 'RIVER OUTLAW')

SELECT c.email
FROM customer c
INNER JOIN rental r
ON c.customer_id = r.customer_id
WHERE date(r.retntal_date) = '2005-06-14';

SELECT c.email
FROM customer c
INNER JOIN rental r
ON c.customer_id = r.customer_id
WHERE date(r.retntal_date) <> '2005-06-14';

DELETE FROM rental
WHERE year(rental_date) = 2004;

DELETE FROM rental
WHERE year(rental_date) <> 2005 AND year(rental_date) <> 2006;

SELECT customer_id, rental_date
FROM rental
WHERE rental_date < '2005-05-25';

SELECT customer_id, rental_date
FROM rental
WHERE rental_date <= '2005-06-16'
AND rental_date >= '2005-06-14';

SELECT customer_id, rental_date
FROM rental
WHERE rental_date BETWEEN '2005-06-14' AND '2005-06-16';

SELECT customer_id, rental_date
FROM rental
WHERE rental_date BETWEEN '2005-06-16' AND '2005-06-14';


SELECT customer_id, rental_date
FROM rental
WHERE rental_date >= '2005-06-16'
AND rental_date <= '2005-06-14';

SELECT customer_id, payment_date, amount
FROM payment
WHERE amount BETWEEN 10.0 AND 11.99;

SELECT last_name, first_name
FROM customer
WHERE last_name BETWEEN 'FA' AND 'FR';

SELECT last_name, first_name
FROM customer
WHERE last_name BETWEEN 'FA' AND 'FRB';

SELECT title, rating
FROM film
WHERE rating = 'G' OR 'PG';

SELECT title, rating
FROM film
WHERE rating In ('G','PG');

SELECT title, rating
FROM film
WHERE rating IN (SELECT rating FROM film WHERE title LIKE '%PET%');

SELECT title, rating 
FROM film 
WHERE rating NOT IN ('PG-13', 'R','NC-17');

SELECT last_name, first_name 
FROM customer
WHERE left(last_name,1) = 'Q';

SELECT last_name, first_name
FROM customer
WHERE last_name LIKE '_A_T%S';

SELECT last_name, first_name 
FROM customer
WHERE last_name LIKE 'Q%' OR last_name LIKE 'Y%';

SELECT last_name, first_name
FROM customer
WHERE last_name REGEXP '^[QY]';

SELECT rental_id , customer_id
FROM rental
WHERE return_date IS NULL;

SELECT rental_id , customer_id
FROM rental
WHERE return_date = NULL;

SELECT rental_id, customer_id, return_date
FROM rental
WHERE return_date IS NOT NULL;

SELECT rental_id, customer_id, return_date
FROM rental
WHERE rental_date NOT BETWEEN '2005-05-01' AND '2005-09-01';

SELECT rental_id, customer_id, return_date
FROM rental
WHERE return_date IS NULL 
OR return_date NOT BETWEEN '2005-05-01' AND '2005-09-01';

SELECT amount 
FROM payment 
WHERE amount IN (1.98, 7.98, 9.98);

SELECT first_name, last_name
FROM customer
WHERE last_name LIKE '_A%W%';