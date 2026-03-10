SELECT f.film_id, f.title, count(*) num_copies
FROM film f
INNER JOIN inventory i
ON f.film_id = i.film_id
GROUP BY f.film_id, f.title;

SELECT f.film_id, f.title, count(i.inventory_id) num_copies
FROM film f
LEFT OUTER JOIN inventory i
ON f.film_id = i.film_id
GROUP BY f.film_id , f.title;

SELECT f.film_id, f.title, i.inventory_id
FROM film f
INNER JOIN inventory i 
ON f.film_id = i.film_id
WHERE f.film_id BETWEEN 13 AND 15;


SELECT f.film_id, f.title, i.inventory_id
FROM film f
LEFT OUTER JOIN inventory i 
ON f.film_id = i.film_id
WHERE f.film_id BETWEEN 13 AND 15;


SELECT f.film_id, f.title, i.inventory_id
FROM film f
RIGHT OUTER JOIN inventory i 
ON f.film_id = i.film_id
WHERE f.film_id BETWEEN 13 AND 15;

SELECT f.film_id, f.title, i.inventory_id, r.rental_date
FROM film f
LEFT OUTER JOIN inventory i
ON f.film_id = i.film_id
LEFT OUTER JOIN rental r 
ON i.inventory_id = r.inventory_id
WHERE f.film_id BETWEEN 13 AND 15;

SELECT c.name category_name, l.name language_name
FROM category c
CROSS JOIN language l;

SELECT 'Small Fry' name, 0 low_limit, 74.99 high_limit
UNION ALL
SELECT 'Average Joes' name, 75 low_limit, 149.99 high_limit
UNION ALL
SELECT 'Heavy Hitters' name, 150 low_limit, 999999.9 high_limit;

SELECT ones.num + tens.num + hundreds.num
FROM 
(SELECT 0 num UNION ALL
SELECT 1 num UNION ALL
SELECT 2 num UNION ALL
SELECT 3 num UNION ALL
SELECT 4 num UNION ALL
SELECT 5 num UNION ALL
SELECT 6 num UNION ALL
SELECT 7 num UNION ALL
SELECT 8 num UNION ALL
SELECT 9 num) ones
CROSS JOIN
(SELECT 0 num UNION ALL
SELECT 10 num UNION ALL
SELECT 20 num UNION ALL
SELECT 30 num UNION ALL
SELECT 40 num UNION ALL
SELECT 50 num UNION ALL
SELECT 60 num UNION ALL
SELECT 70 num UNION ALL
SELECT 80 num UNION ALL
SELECT 90 num) tens
CROSS JOIN
(SELECT 0 num UNION ALL
SELECT 100 num UNION ALL
SELECT 200 num UNION ALL
SELECT 300 num) hundreds;



SELECT DATE_ADD('2020-01-01',
INTERVAL(ones.num + tens.num + hundreds.num) DAY) dt
FROM 
(SELECT 0 num UNION ALL
SELECT 1 num UNION ALL
SELECT 2 num UNION ALL
SELECT 3 num UNION ALL
SELECT 4 num UNION ALL
SELECT 5 num UNION ALL
SELECT 6 num UNION ALL
SELECT 7 num UNION ALL
SELECT 8 num UNION ALL
SELECT 9 num) ones
CROSS JOIN
(SELECT 0 num UNION ALL
SELECT 10 num UNION ALL
SELECT 20 num UNION ALL
SELECT 30 num UNION ALL
SELECT 40 num UNION ALL
SELECT 50 num UNION ALL
SELECT 60 num UNION ALL
SELECT 70 num UNION ALL
SELECT 80 num UNION ALL
SELECT 90 num) tens
CROSS JOIN
(SELECT 0 num UNION ALL
SELECT 100 num UNION ALL
SELECT 200 num UNION ALL
SELECT 300 num) hundreds
WHERE DATE_ADD('2020-01-01',
INTERVAL (ones.num + tens.num + hundreds.num) DAY) < '2021-01-01'
ORDER BY 1;

SELECT days.dt, COUNT(r.rental_id) num_rentals
FROM rental r 
RIGHT OUTER JOIN 
(SELECT DATE_ADD('2005-01-01',
INTERVAL(ones.num + tens.num + hundreds.num) DAY) dt
FROM 
(SELECT 0 num UNION ALL
SELECT 1 num UNION ALL
SELECT 2 num UNION ALL
SELECT 3 num UNION ALL
SELECT 4 num UNION ALL
SELECT 5 num UNION ALL
SELECT 6 num UNION ALL
SELECT 7 num UNION ALL
SELECT 8 num UNION ALL
SELECT 9 num) ones
CROSS JOIN
(SELECT 0 num UNION ALL
SELECT 10 num UNION ALL
SELECT 20 num UNION ALL
SELECT 30 num UNION ALL
SELECT 40 num UNION ALL
SELECT 50 num UNION ALL
SELECT 60 num UNION ALL
SELECT 70 num UNION ALL
SELECT 80 num UNION ALL
SELECT 90 num) tens
CROSS JOIN
(SELECT 0 num UNION ALL
SELECT 100 num UNION ALL
SELECT 200 num UNION ALL
SELECT 300 num) hundreds
WHERE DATE_ADD('2005-01-01', 
INTERVAL( ones.num + tens.num + hundreds.num) DAY) < '2006-01-01') days
ON days.dt = date(r.rental_date)
GROUP BY days.dt
ORDER BY 1;

SELECT c.first_name, c.last_name, date(r.rental_date)
FROM customer c
NATURAL JOIN rental r;

SELECT cust.first_name, cust.last_name, date(r.rental_date)
FROM 
(SELECT customer_id, first_id, last_id
FROM customer) cust
NATURAL JOIN rental r;


SELECT c.name, sum(p.amount)
FROM customer c
LEFT OUTER JOIN payment p
ON c.customer_id = p.customer_id
GROUP BY c.name;

SELECT c.name, sum(p.amount)
FROM payment p
RIGHT OUTER JOIN customer c
ON c.customer_id = p.customer_id
GROUP BY c.name;

SELECT ones.x + tens.x + 1
FROM 
(SELECT 0 * UNION ALL
SELECT 1 * UNION ALL
SELECT 2 * UNION ALL
SELECT 3 * UNION ALL
SELECT 4 * UNION ALL
SELECT 5 * UNION ALL
SELECT 6 * UNION ALL
SELECT 7 * UNION ALL
SELECT 8 * UNION ALL
SELECT 9 * ) ones
CROSS JOIN
(SELECT 0 * UNION ALL
SELECT 10 * UNION ALL
SELECT 20 * UNION ALL
SELECT 30 * UNION ALL
SELECT 40 * UNION ALL
SELECT 50 * UNION ALL
SELECT 60 * UNION ALL
SELECT 70 * UNION ALL
SELECT 80 * UNION ALL
SELECT 90 * ) tens;

