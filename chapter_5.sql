desc customer;

desc address;

SELECT c.first_name, c.last_name, a.address
FROM customer AS c
JOIN address AS a;

SELECT c.first_name, c.last_name, a.address
FROM customer c
JOIN address a
ON c.customer_id = a.address_id ;

SELECT c.first_name, c.last_name, a.address
FROM customer c
INNER JOIN address a
ON c.customer_id = a.address_id ;

SELECT c.first_name, c.last_name, a.address
FROM customer c 
INNER JOIN address a
USING (address_id);

SELECT c.first_name, c.last_name, a.address
FROM customer c, address a
WHERE c.address_id = a.address_id;


SELECT c.first_name, c.last_name, a.address
FROM customer c, address a
WHERE c.address_id = a.address_id
AND a.postal_code = 52137;


SELECT c.first_name, c.last_name, a.address
FROM customer c 
INNER JOIN address a
ON c.address_id = a.address_id
WHERE a.postal_code = 52137;

desc customer;
desc address;
desc city;


SELECT c.first_name, c.last_name, ct.city
FROM customer c
INNER JOIN address a
ON c.address_id = a.address_id
INNER JOIN city ct
ON a.city_id = ct.city_id;

SELECT c.first_name, c.last_name, ct.city
FROM customer c
INNER JOIN address a
ON c.address_id = a.address_id
INNER JOIN city ct
ON a.city_id = ct.city_id;


SELECT c.first_name, c.last_name, ct.city
FROM city ct
INNER JOIN address a
ON a.city_id = ct.city_id
INNER JOIN customer c
ON c.address_id = a.address_id;

SELECT c.first_name, c.last_name, ct.city
FROM address a 
INNER JOIN city ct
ON a.city_id = ct.city_id
INNER JOIN customer c
ON c.address_id = a.address_id;

SELECT c.first_name, c.last_name, addr.address, addr.city
FROM customer c
INNER JOIN 
(SELECT a.address_id, a.address, ct.city
FROM address a
INNER JOIN city ct
ON a.city_id = ct.city_id
WHERE a.district = 'California') addr
ON c.address_id = addr.address_id;

SELECT a.address_id, a.address, ct.city
FROM address a
INNER JOIN city ct
ON a.city_id = ct.city_id
WHERE a.district = 'California';


SELECT f.title
FROM film f
INNER JOIN film_actor fa
ON f.film_id = fa.film_id
INNER JOIN actor a
ON fa.actor_id = a.actor_id
WHERE ((a.first_name = 'CATE'  AND a.last_name = 'MCQUEEN')
	OR (a.first_name = 'CUBA' AND a.last_name = 'BIRCH'));

 SELECT f.title
 FROM film f
 INNER JOIN film_actor fa1
 ON fa1.actor_id = fa1.film_id
 INNER JOIN actor a1
 ON fa1.actor_id = a1.actor_id
 INNER JOIN film_actor fa2
 ON fa2.actor_id = fa2.film_id
 INNER JOIN actor a2
 ON fa2.actor_id = a2.actor_id
 WHERE (a1.first_name = 'CATE' AND a1.last_name ='MCQUEEN')
 AND (a2.first_name = 'CUBA' AND a2.last_name = 'BIRCH');
 
 desc film;
 
 SELECT f.title, f_prnt_table prequel
 FROM film f
 INNER JOIN film f_prnt
 ON f_prnt.film_id =f.prequel_film_id
 WHERE f.prequel_film_id IS NOT NULL;
 
 SELECT f.title
 FROM films f
 INNER JOIN film_actor fa
 ON f.film_id = fa.film_id
 INNER JOIN actor a
 ON fa.actor_id = a.actor_id 
 WHERE a.first_name = 'JOHN';
 
 SELECT a1.address addr1, a2.address addr2, a1.city_id 
 FROM address a1 
 INNER JOIN address a2
 WHERE a1.city_id = a2.city_id
 AND a1.address_id <> a2.address_id;

