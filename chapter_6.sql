SELECT 'CUST' typ, c.first_name, c.last_name
FROM customer c
UNION ALL
SELECT 'ACTR' typ, a.first_name, a.last_name
FROM actor a;

SELECT 'ACTR' typ, a.first_name, a.last_name
FROM actor a
UNION ALL
SELECT 'ACTR' typ, a.first_name, a.last_name
FROM actor a;

SELECT c.first_name, c.last_name
FROM customer c
WHERE c.first_name LIKE 'J%' AND c.last_name LIKE 'D%'
UNION ALL
SELECT a.first_name, a.last_name
FROM actor a
WHERE a.first_name LIKE 'J%' AND a.last_name LIKE 'D%';

SELECT c.first_name, c.last_name
FROM customer c
WHERE c.first_name LIKE 'J%' AND c.last_name LIKE 'D%'
UNION 
SELECT a.first_name, a.last_name
FROM actor a
WHERE a.first_name LIKE 'J%' AND a.last_name LIKE 'D%';

SELECT c.first_name, c.last_name
FROM customer c
WHERE c.first_name LIKE 'D%' AND c.last_name LIKE 'T%'
INTERSECT
SELECT a.first_name, a.last_name
FROM actor a
WHERE a.first_name LIKE 'D%' AND a.last_name LIKE 'T%';

SELECT c.first_name, c.last_name
FROM customer c
WHERE c.first_name LIKE 'J%' AND c.last_name LIKE 'D%'
INTERSECT 
SELECT a.first_name, a.last_name
FROM actor a
WHERE a.first_name LIKE 'J%' AND a.last_name LIKE 'D%';

SELECT a.first_name, a.last_name
FROM actor a 
WHERE a.first_name LIKE 'J%' AND a.last_name LIKE 'D%'
EXCEPT
SELECT c.first_name, c.last_name
FROM customer c
WHERE c.first_name LIKE 'J%' AND c.last_name LIKE 'D%';


SELECT a.first_name fname, a.last_name lname
FROM actor a 
WHERE a.first_name LIKE 'J%' AND a.last_name LIKE 'D%'
UNION ALL
SELECT c.first_name, c.last_name
FROM customer c
WHERE c.first_name LIKE 'J%' AND c.last_name LIKE 'D%'
ORDER BY lname, fname;


SELECT a.first_name, a.last_name 
FROM actor a 
WHERE a.first_name LIKE 'J%' AND a.last_name LIKE 'D%'
UNION ALL
SELECT a.first_name, a.last_name 
FROM actor a 
WHERE a.first_name LIKE 'M%' AND a.last_name LIKE 'T%'
UNION
SELECT c.first_name, c.last_name
FROM customer c
WHERE c.first_name LIKE 'J%' AND c.last_name LIKE 'D%';


SELECT a.first_name, a.last_name 
FROM actor a 
WHERE a.first_name LIKE 'J%' AND a.last_name LIKE 'D%'
UNION 
SELECT a.first_name, a.last_name 
FROM actor a 
WHERE a.first_name LIKE 'M%' AND a.last_name LIKE 'T%'
UNION ALL
SELECT c.first_name, c.last_name
FROM customer c
WHERE c.first_name LIKE 'J%' AND c.last_name LIKE 'D%';


SELECT a.first_name, a.last_name 
FROM actor a 
WHERE a.first_name LIKE 'J%' AND a.last_name LIKE 'D%'
UNION 
(SELECT a.first_name, a.last_name 
FROM actor a 
WHERE a.first_name LIKE 'M%' AND a.last_name LIKE 'T%'
UNION ALL
SELECT c.first_name, c.last_name
FROM customer c
WHERE c.first_name LIKE 'J%' AND c.last_name LIKE 'D%');

SELECT first_name, last_name
FROM actor
WHERE last_name LIKE 'L%'
UNION
SELECT first_name, last_name
FROM customer
WHERE last_name LIKE 'L%';


SELECT first_name, last_name
FROM actor
WHERE last_name LIKE 'L%'
UNION
SELECT first_name, last_name
FROM customer
WHERE last_name LIKE 'L%'
ORDER BY last_name;


