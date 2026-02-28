show databases
use sakila;

select now();

SELECT now()
FROM dual;
#Character data
SHOW character set;

CREATE TABLE person
(person_id SMALLINT UNSIGNED,
fname VARCHAR(20),
lname VARCHAR(20),
eye_color ENUM ('BR','BL','GR'),
birth_date DATE,
street VARCHAR(20),
city VARCHAR(20),
state VARCHAR(20),
country VARCHAR(20),
postal_code VARCHAR(20),
CONSTRAINT pk_person PRIMARY KEY (person_id)
);


CREATE TABLE favourite_food
(person_id SMALLINT UNSIGNED,
food VARCHAR(20),
CONSTRAINT pk_favourite_food PRIMARY KEY (person_id, food),
CONSTRAINT fk_fav_food_person_id FOREIGN KEY(person_id)
REFERENCES person(person_id)
);

INSERT INTO person
(person_id, fname, lname, eye_color,birth_date)
VALUES( 1,'KAMRAN', 'BAJWA','BL', '2002-02-14');

SELECT person_id, fname, lname, eye_color, birth_date
FROM person;

SELECT person_id, fname, lname, eye_color, birth_date
FROM person
where person_id=1;


SELECT person_id, fname, lname, eye_color, birth_date
FROM person
where lname = 'BAJWA';


INSERT INTO favourite_food (person_id, food)
VALUES (1,


SELECT food 
FROM favourite_food, 
WHERE person_id = 1,
ORDER BY food;