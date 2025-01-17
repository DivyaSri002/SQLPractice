
SHOW DATABASES;

CREATE DATABASE coffee_store;

USE coffee_store;

CREATE TABLE products (
id INT auto_increment PRIMARY KEY,
name VARCHAR(30),
price DECIMAL(3,2)
);

SHOW TABLES;

CREATE TABLE customers
(
	id INT auto_increment PRIMARY KEY,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	gender ENUM('M','F'),
	phone_number VARCHAR(11)
);

CREATE TABLE orders (
	id INT auto_increment PRIMARY KEY,
    product_id INT,
    customer_id INT,
    order_time DATETIME,
    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);
-- HOW TO ADD AND REMOVE COLUMNS FROM A TABLE
 
USE coffee_store;

DESCRIBE products;

ALTER TABLE products
ADD COLUMN coffee_origin VARCHAR(30);

ALTER TABLE products
DROP COLUMN coffee_origin;
-- HOW TO DELETE TABLES FROM A DATABASE
 
CREATE DATABASE example;
 
USE example;
 
CREATE TABLE test (
id INT auto_increment PRIMARY KEY,
name VARCHAR(30),
age INT
);
 
DESCRIBE test;
SHOW TABLES;

DROP TABLE test;
drop database example;
-- HOW TO DELETE TABLES FROM A DATABASE
 
CREATE DATABASE example;
 
USE example;
 
CREATE TABLE test (
id INT auto_increment PRIMARY KEY,
name VARCHAR(30),
age INT
);
 
DESCRIBE test;
SHOW TABLES;

DROP TABLE test;

INSERT INTO test (name, age) VALUES('Ben', 19), ('Simon', 28), ('Claire', 23);
SELECT * FROM test;

TRUNCATE TABLE test;
CREATE DATABASE test;

USE test;

CREATE TABLE addresses (
	id INT,
    house_number INT,
    city VARCHAR(20),
    postcode VARCHAR(7)
);

CREATE TABLE people (
	id INT,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    address_id INT
);

CREATE TABLE pets (
	id INT,
    name VARCHAR(20),
    species VARCHAR(20),
    owner_id INT
);

SHOW TABLES;
USE test;
 
/*SQL  to add a primary key to a table.
ALTER TABLE <table name>
ADD PRIMARY KEY (<column name>);
 
-- SQL to remove a primary key from a table.
ALTER TABLE <table name>
DROP PRIMARY KEY;
*/
DESCRIBE addresses;

ALTER TABLE addresses
ADD PRIMARY KEY (id);

ALTER TABLE addresses
DROP PRIMARY KEY;

ALTER TABLE addresses
MODIFY id int;

DESCRIBE people;

ALTER TABLE people
ADD PRIMARY KEY (id);

USE test;
 
/*-- How to add a foreign key to a table
 
ALTER TABLE <table name>
ADD CONSTRAINT <constraint name>
FOREIGN KEY (<column name>) REFERENCES <table name>(<column name>);
 
-- How to remove a foreign key from a table
 
ALTER TABLE <table name>
DROP FOREIGN KEY <constraint name>,
DROP INDEX <constraint name>;
 */
DESCRIBE addresses;
DESCRIBE people;

ALTER TABLE people
ADD CONSTRAINT FK_PeopleAddress
FOREIGN KEY (address_id)
REFERENCES addresses(id);

ALTER TABLE people
DROP FOREIGN KEY FK_PeopleAddress,
DROP INDEX FK_PeopleAddress;

USE test;
 
/*-- How to add a unique constraint to a column
 
ALTER TABLE <table name>
ADD CONSTRAINT <constraint name> UNIQUE (<column name>);
 
-- How to remove a unique constraint from a column
 
ALTER TABLE <table name>
DROP INDEX <constraint name>;
 */
DESCRIBE pets;

ALTER TABLE pets
ADD CONSTRAINT u_species UNIQUE (species);

ALTER TABLE pets
DROP INDEX u_species;

USE test;
 
/*-- How to change a column's name
 
ALTER TABLE <table name>
CHANGE <current column name> <new column name> <data type>;
 
ALTER TABLE <tablename>
RENAME COLUMN <current column name> TO <new column name>;
 */
DESCRIBE pets;

ALTER TABLE pets
CHANGE species animal_type VARCHAR(20);

ALTER TABLE pets
RENAME COLUMN animal_type TO species;

ALTER TABLE pets
RENAME COLUMN species TO `animal type`;

USE test;
 
/*-- How to change a column's data type
 
ALTER TABLE <table name>
CHANGE COLUMN <current column name> <new column name> <data type>;
 
ALTER TABLE <table name>
MODIFY COLUMN <column name> <data type>;
 */
DESCRIBE addresses;

ALTER TABLE addresses
CHANGE COLUMN city city VARCHAR(30);

ALTER TABLE addresses
MODIFY COLUMN city CHAR(25);

ALTER TABLE addresses
MODIFY COLUMN city int;

ALTER TABLE pets
ADD primary key(id);

DESCRIBE people;

alter table pets
add constraint FK_oid
foreign key (owner_id)
references people(id);

alter table people
add column email varchar(20);

alter table people
add constraint u_email unique(email);

alter table pets
rename column name to first_name;

DESCRIBE addresses;

alter table addresses
change column postcode postcode char(7);

USE coffee_store;
 
SHOW tables;
 /*
INSERT INTO <table name> (<column1>, <column2>, <column3>, ... <column_n>)
VALUES (value1, value2, value3, ... value_n);
*/
SELECT * FROM products;

INSERT INTO products (name, price, coffee_origin)
VALUES ('Espresso', 2.50, 'Brazil');

INSERT INTO products VALUES (2,'Macchiato', 3.00, 'Brazil'), (3,'Cappuccino', 3.50, 'Costa Rica');

INSERT INTO products (name, price, coffee_origin)
VALUES ('Latte', 3.50, 'Indonesia'), ('Americano', 3.00, 'Brazil'),
('Flat White', 3.50, 'Indonesia'), ('Filter', 3.00, 'India');

USE coffee_store;
 /*
UPDATE <table name>
SET <column name> = <value>
WHERE <column name> = <match>;
 */
SELECT * FROM products;

UPDATE products
SET coffee_origin = 'Sri Lanka'
WHERE id = 7;


UPDATE products
SET price = 3.25, coffee_origin = 'Ethiopia'
WHERE name = 'Americano';

UPDATE products
SET coffee_origin = 'Colombia'
WHERE coffee_origin = 'Brazil';

USE example;

CREATE TABLE people (
  id INT auto_increment PRIMARY KEY,
  name VARCHAR(30),
  age INT,
  gender ENUM('F', 'M')
);

INSERT INTO people
(name, age, gender)
VALUES ('Emma', 21, 'F'), ('John', 30, 'M'), ('Thomas', 27, 'M'),
('Chris', 44, 'M'), ('Sally', 23, 'F'), ('Frank', 55, 'M');

SELECT * FROM people;

DELETE FROM people
WHERE gender = 'F';

DELETE FROM people;

INSERT INTO customers (first_name, last_name, gender, phone_number)
VALUES ('Chris','Martin','M','01123147789'),
       ('Emma','Law','F','01123439899'),
       ('Mark','Watkins','M','01174592013'),
       ('Daniel','Williams','M',NULL),
       ('Sarah','Taylor','F','01176348290'),
       ('Katie','Armstrong','F','01145787353'),
       ('Michael','Bluth','M','01980289282'),
       ('Kat','Nash','F','01176987789'),
       ('Buster','Bluth','M','01173456782'),
       ('Charlie',NULL,'F','01139287883'),
       ('Lindsay','Bluth','F','01176923804'),
       ('Harry','Johnson','M',NULL),
       ('John','Smith','M','01174987221'),
       ('John','Taylor','M',NULL),
       ('Emma','Smith','F','01176984116'),
       ('Gob','Bluth','M','01176985498'),
       ('George','Bluth','M','01176984303'),
       ('Lucille','Bluth','F','01198773214'),
       ('George','Evans','M','01174502933'),
       ('Emily','Simmonds','F','01899284352'),
       ('John','Smith','M','01144473330'),
       ('Jennifer',NULL,'F',NULL),
       ('Toby','West','M','01176009822'),
       ('Paul','Edmonds','M','01966947113');

INSERT INTO orders (product_id, customer_id, order_time)
VALUES (3, 18, '2022-01-01 01:40:42'),
       (6, 17, '2022-01-03 20:52:17'),
       (7, 12, '2022-01-04 09:17:15'),
       (7, 17, '2022-01-04 15:55:16'),
       (1, 13, '2022-01-05 13:03:56'),
       (6, 5, '2022-01-06 11:42:56'),
       (6, 24, '2022-01-09 02:07:29'),
       (6, 16, '2022-01-12 02:19:12'),
       (4, 20, '2022-01-13 10:51:51'),
       (5, 19, '2022-01-14 16:42:08'),
       (2, 8, '2022-01-17 19:26:45'),
       (2, 5, '2022-01-18 07:14:40'),
       (5, 13, '2022-01-18 08:38:53'),
       (7, 9, '2022-01-22 02:04:46'),
       (6, 22, '2022-01-23 03:58:18'),
       (3, 4, '2022-01-24 18:31:15'),
       (6, 8, '2022-01-28 04:10:12'),
       (2, 7, '2022-01-28 10:55:20'),
       (3, 10, '2022-01-30 14:15:02'),
       (6, 9, '2022-01-30 23:36:50'),
       (2, 3, '2022-01-31 17:21:20'),
       (5, 10, '2022-02-02 19:55:00'),
       (3, 22, '2022-02-06 11:15:53'),
       (6, 16, '2022-02-11 17:26:52'),
       (2, 24, '2022-02-14 15:14:33'),
       (7, 3, '2022-02-15 21:48:10'),
       (4, 14, '2022-02-17 22:58:00'),
       (3, 16, '2022-02-18 00:07:08'),
       (1, 24, '2022-02-18 16:01:32'),
       (5, 14, '2022-02-26 15:07:23'),
       (3, 6, '2022-02-27 09:57:19'),
       (5, 20, '2022-03-04 14:06:52'),
       (5, 13, '2022-03-04 23:28:03'),
       (5, 16, '2022-03-05 21:00:20'),
       (6, 9, '2022-03-06 21:32:30'),
       (1, 22, '2022-03-10 19:32:25'),
       (5, 14, '2022-03-12 05:21:19'),
       (4, 20, '2022-03-13 21:17:58'),
       (3, 3, '2022-03-13 23:47:27'),
       (5, 6, '2022-03-14 22:06:07'),
       (2, 6, '2022-03-16 07:55:59'),
       (5, 18, '2022-03-16 10:47:18'),
       (1, 21, '2022-03-17 00:05:01'),
       (3, 17, '2022-03-18 01:16:45'),
       (1, 10, '2022-03-19 08:34:14'),
       (2, 18, '2022-03-19 08:38:47'),
       (2, 16, '2022-03-20 23:33:25'),
       (5, 21, '2022-03-22 00:08:04'),
       (6, 18, '2022-03-23 12:02:27'),
       (7, 12, '2022-03-25 10:25:23'),
       (2, 16, '2022-03-30 19:48:17'),
       (4, 19, '2022-03-31 18:36:27'),
       (5, 18, '2022-04-04 03:32:19'),
       (1, 17, '2022-04-04 09:33:28'),
       (7, 20, '2022-04-05 12:18:04'),
       (2, 3, '2022-04-06 01:22:00'),
       (3, 10, '2022-04-08 01:07:27'),
       (5, 12, '2022-04-11 17:40:17'),
       (5, 18, '2022-04-13 03:35:11'),
       (1, 16, '2022-04-15 10:32:10'),
       (1, 11, '2022-04-15 13:05:57'),
       (4, 12, '2022-04-16 18:52:35'),
       (6, 18, '2022-05-02 06:10:08'),
       (3, 22, '2022-05-13 22:02:39'),
       (3, 14, '2022-05-19 01:35:16'),
       (6, 2, '2022-05-19 06:03:28'),
       (3, 12, '2022-05-30 23:51:54'),
       (6, 15, '2022-06-04 20:43:00'),
       (7, 23, '2022-06-10 03:07:28'),
       (4, 18, '2022-06-11 18:36:38'),
       (5, 10, '2022-06-14 02:57:14'),
       (4, 24, '2022-06-14 03:41:39'),
       (2, 4, '2022-06-14 07:47:11'),
       (3, 18, '2022-06-15 13:41:34'),
       (1, 11, '2022-06-15 23:53:02'),
       (4, 4, '2022-06-16 16:23:46'),
       (6, 20, '2022-06-19 10:15:41'),
       (7, 3, '2022-06-20 03:21:28'),
       (5, 19, '2022-06-21 15:49:30'),
       (1, 24, '2022-06-24 04:40:20'),
       (5, 13, '2022-06-24 05:16:32'),
       (5, 3, '2022-06-27 12:42:48'),
       (2, 8, '2022-06-30 15:43:09'),
       (1, 12, '2022-07-01 18:10:43'),
       (5, 4, '2022-07-03 19:15:48'),
       (7, 18, '2022-07-05 14:38:47'),
       (1, 18, '2022-07-08 10:51:32'),
       (4, 14, '2022-07-13 10:14:16'),
       (4, 1, '2022-07-18 14:19:05'),
       (7, 4, '2022-07-18 15:32:08'),
       (7, 5, '2022-07-21 03:51:46'),
       (7, 18, '2022-07-24 16:55:59'),
       (5, 23, '2022-07-25 09:55:47'),
       (1, 3, '2022-07-26 18:11:22'),
       (1, 24, '2022-07-28 15:10:55'),
       (7, 20, '2022-08-07 13:08:16'),
       (2, 14, '2022-08-08 07:57:52'),
       (7, 24, '2022-08-12 06:17:46'),
       (3, 10, '2022-08-13 01:52:53'),
       (6, 8, '2022-08-20 12:47:07'),
       (7, 10, '2022-08-21 23:45:39'),
       (1, 5, '2022-08-24 17:18:30'),
       (6, 14, '2022-08-25 18:54:40'),
       (2, 20, '2022-08-29 01:07:00'),
       (2, 12, '2022-08-31 03:27:05'),
       (1, 1, '2022-09-03 12:46:07'),
       (6, 13, '2022-09-05 00:58:57'),
       (6, 14, '2022-09-06 13:16:42'),
       (1, 1, '2022-09-08 06:07:50'),
       (7, 13, '2022-09-12 19:36:39'),
       (1, 1, '2022-09-14 19:52:14'),
       (3, 16, '2022-09-15 17:09:11'),
       (6, 4, '2022-09-15 17:55:44'),
       (2, 4, '2022-09-17 00:55:18'),
       (2, 7, '2022-09-23 11:14:05'),
       (7, 8, '2022-09-25 11:01:44'),
       (2, 21, '2022-09-26 19:11:54'),
       (6, 15, '2022-09-28 19:45:30'),
       (7, 12, '2022-09-29 19:40:24'),
       (5, 14, '2022-09-29 21:33:57'),
       (7, 23, '2022-10-01 13:53:24'),
       (1, 5, '2022-10-01 17:58:55'),
       (2, 3, '2022-10-10 14:44:57'),
       (2, 9, '2022-10-10 19:53:39'),
       (7, 7, '2022-10-12 12:14:31'),
       (6, 22, '2022-10-12 23:14:06'),
       (1, 7, '2022-10-13 00:00:41'),
       (3, 12, '2022-10-14 02:56:38'),
       (5, 17, '2022-10-15 01:50:02'),
       (5, 24, '2022-10-15 08:03:14'),
       (2, 3, '2022-10-15 09:50:50'),
       (7, 5, '2022-10-16 06:41:54'),
       (3, 5, '2022-10-18 16:36:38'),
       (3, 15, '2022-10-24 12:06:19'),
       (6, 18, '2022-10-29 11:01:30'),
       (7, 21, '2022-10-31 05:03:39'),
       (3, 14, '2022-11-01 18:11:58'),
       (4, 11, '2022-11-04 02:01:14'),
       (6, 14, '2022-11-04 11:11:59'),
       (3, 23, '2022-11-04 16:09:35'),
       (6, 20, '2022-11-12 19:56:03'),
       (5, 5, '2022-11-16 22:44:14'),
       (2, 13, '2022-11-18 10:12:00'),
       (2, 14, '2022-11-20 07:36:35'),
       (7, 24, '2022-11-25 05:52:36'),
       (5, 7, '2022-11-29 06:53:56'),
       (6, 7, '2022-12-03 05:56:23'),
       (3, 9, '2022-12-04 08:00:51'),
       (2, 19, '2022-12-05 10:10:35'),
       (6, 15, '2022-12-07 17:52:25'),
       (2, 16, '2022-12-13 02:34:51'),
       (1, 22, '2022-12-14 01:22:55'),
       (4, 24, '2022-12-16 13:08:26'),
       (2, 17, '2022-12-18 09:16:04'),
       (1, 13, '2022-12-18 09:30:16'),
       (1, 20, '2022-12-18 13:27:18'),
       (2, 16, '2022-12-20 11:43:57'),
       (5, 7, '2022-12-31 12:11:08'),
       (2, 14, '2022-12-31 18:43:41'),
       (5, 15, '2023-01-01 02:06:24'),
       (3, 22, '2023-01-01 11:50:28'),
       (6, 19, '2023-01-08 16:51:15'),
       (3, 22, '2023-01-09 01:53:24'),
       (3, 10, '2023-01-09 08:54:10'),
       (7, 16, '2023-01-10 21:53:58'),
       (4, 3, '2023-01-11 20:48:30'),
       (2, 20, '2023-01-12 19:14:00'),
       (5, 21, '2023-01-13 06:07:12'),
       (3, 24, '2023-01-13 06:22:54'),
       (6, 6, '2023-01-14 14:36:54'),
       (7, 24, '2023-01-15 17:18:15'),
       (4, 2, '2023-01-17 03:18:12'),
       (2, 19, '2023-01-17 14:15:49'),
       (4, 18, '2023-01-19 05:08:43'),
       (3, 20, '2023-01-25 13:23:56'),
       (1, 24, '2023-01-31 06:17:11'),
       (3, 6, '2023-01-31 15:01:35'),
       (7, 19, '2023-02-01 19:15:43'),
       (2, 10, '2023-02-05 01:07:36'),
       (3, 19, '2023-02-09 00:23:19'),
       (3, 16, '2023-02-12 13:22:49'),
       (2, 21, '2023-02-12 23:49:48'),
       (2, 24, '2023-02-14 10:09:56'),
       (3, 5, '2023-02-15 13:53:24'),
       (3, 9, '2023-02-16 19:54:44'),
       (2, 20, '2023-02-17 08:22:49'),
       (4, 2, '2023-02-20 17:59:11'),
       (7, 3, '2023-02-20 20:21:43'),
       (6, 17, '2023-02-23 09:34:18'),
       (5, 12, '2023-02-24 10:03:43'),
       (1, 1, '2023-02-25 04:16:35'),
       (5, 12, '2023-02-25 17:39:57'),
       (3, 2, '2023-02-26 10:52:48'),
       (4, 10, '2023-02-27 14:14:27'),
       (7, 18, '2023-03-01 19:08:17'),
       (6, 22, '2023-03-03 09:07:34'),
       (2, 20, '2023-03-07 09:02:13'),
       (4, 10, '2023-03-08 00:43:45'),
       (7, 13, '2023-03-11 10:15:40'),
       (1, 23, '2023-03-12 20:09:35'),
       (1, 8, '2023-03-13 06:40:51'),
       (3, 6, '2023-03-16 18:41:34'),
       (4, 16, '2023-03-17 12:02:08'),
       (5, 18, '2023-03-17 15:58:18'),
       (7, 2, '2023-03-25 04:00:35'),
       (1, 9, '2023-03-26 07:42:31'),
       (1, 21, '2023-03-30 00:43:56'),
       (3, 18, '2023-04-06 10:37:10'),
       (5, 18, '2023-04-11 09:08:31'),
       (2, 2, '2023-04-12 15:40:05'),
       (4, 23, '2023-04-15 23:00:27'),
       (6, 8, '2023-04-16 18:58:47'),
       (1, 1, '2023-04-20 21:55:58'),
       (1, 3, '2023-04-25 06:21:12'),
       (2, 12, '2023-04-27 13:14:46'),
       (5, 16, '2023-04-28 20:52:19'),
       (7, 22, '2023-04-29 09:24:08'),
       (1, 23, '2023-04-29 17:58:14'),
       (2, 3, '2023-04-30 08:43:40'),
       (3, 15, '2023-04-30 19:43:25');

USE coffee_store;
 
SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM orders;

USE coffee_store;

SELECT * FROM customers;

SELECT last_name FROM customers;

SELECT last_name, phone_number FROM customers;

USE coffee_store;

SELECT * FROM products;

SELECT * FROM products
WHERE coffee_origin = 'Colombia';

SELECT * FROM products
WHERE price = 3.00
AND coffee_origin = 'Colombia';

SELECT * FROM products
WHERE price = 3.00
OR coffee_origin = 'Colombia';

USE coffee_store;
 
/*
!= ... not equal to.
<> ... not equal to (i.e. greater than or less than).
>  ... greater than.
>= ... greater than or equal to.
<  ... less than.
<= ... less than or equal to.
*/
 
SELECT * FROM products;

SELECT * FROM products
-- WHERE price != 3.00;
WHERE price <> 3.00;

SELECT * FROM products
WHERE price > 3.00;

SELECT * FROM products
WHERE price <= 3.00;

SELECT * FROM products
WHERE name < 'D';

USE coffee_store;
 
SELECT * FROM customers;

SELECT * FROM customers
WHERE phone_number is null;

SELECT * FROM customers
WHERE phone_number is not null;

select first_name,phone_number from customers
where gender='F' and last_name='Bluth';

select name from products
where price>3.00 or coffee_origin='Sri Lanka';

select * from customers
where gender ='M' and phone_number is null;

select name, price from products
where coffee_origin='Colombia' or coffee_origin='Indonesia'
order by name asc;

select * from orders
where order_time between '2023-02-01 00:00:00' and '2023-02-28 23:59:59.999999' and customer_id in (19,20,21,24); 

select first_name, phone_number from customers
where last_name like '%ar%';

use coffee_store;
 
SELECT coffee_origin FROM products;

SELECT DISTINCT coffee_origin FROM products;

SELECT DISTINCT coffee_origin, id FROM products;

SELECT DISTINCT coffee_origin, price FROM products;

SELECT DISTINCT customer_id FROM orders
WHERE order_time BETWEEN '2023-02-01' and '2023-02-28 23:59:59.999999'
ORDER BY customer_id;

USE coffee_store;
 
SELECT * FROM customers;

SELECT * FROM customers
LIMIT 5;

SELECT * FROM customers
LIMIT 5 OFFSET 5;

SELECT * FROM customers
-- LIMIT 12, 3;
LIMIT 3 OFFSET 12;
/*
SELECT * FROM customers
LIMIT `row_count`;  -- only return row-count rows.

SELECT * FROM customers
LIMIT `offset`, `row_count`;  -- return row_count rows, starting from row 5.

SELECT * FROM customers
LIMIT `row_count` OFFSET `offset`;  -- same as above.
*/
SELECT * FROM customers
LIMIT 10 OFFSET 5;

SELECT * FROM customers
ORDER BY last_name
LIMIT 10;

USE coffee_store;
 
SELECT id, name, price, coffee_origin FROM products;

SELECT id, name AS coffee, price, coffee_origin AS country FROM products;

SELECT id, name coffee, price, coffee_origin country FROM products;

select distinct last_name from customers
order by last_name;

select * from orders
where product_id=3 and order_time BETWEEN '2023-02-01' and '2023-02-28 23:59:59.999999'
order by order_time
limit 4;

select name, price retailprice, coffee_origin from products;


























