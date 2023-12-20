CREATE TABLE shop (
id INTEGER PRIMARY KEY,
name VARCHAR(255) UNIQUE,
balance FLOAT NOT NULL);

CREATE TABLE product (
id INTEGER PRIMARY KEY,
name VARCHAR(255) UNIQUE,
price FLOAT NOT NULL);

CREATE TABLE warehouse (
shop_id INTEGER REFERENCES shop (id),
product_id INTEGER REFERENCES product (id),
quantity INTEGER NOT NULL,
PRIMARY KEY (shop_id, product_id));

CREATE TABLE worker ( 
worker_id INTEGER PRIMARY KEY, 
shop_id INTEGER REFERENCES shop (id), 
name VARCHAR(255), 
salary INTEGER NOT NULL, 
position VARCHAR(255));

INSERT INTO shop (id, name, balance) VALUES (1, 'пятерочка',31);
INSERT INTO shop (id, name, balance) VALUES (2, 'перекресток',133);
INSERT INTO product VALUES (1, 'молоко', 100);
INSERT INTO product VALUES (2, 'хлеб', 25);
INSERT INTO warehouse VALUES (1, 1, 20);
INSERT INTO warehouse VALUES (1, 2, 10);
INSERT INTO warehouse VALUES (2, 1, 30);
INSERT INTO worker VALUES (1, 1, 'Vova', 100, 'yborshik');
INSERT INTO worker VALUES (2, 1, 'Nina', 9999, 'director');
INSERT INTO worker VALUES (3, 2, 'Gleb', 300, 'kassir');
INSERT INTO worker VALUES (4, 2, 'Goga', 10, 'yborshik');
INSERT INTO worker VALUES (5, 2, 'Ann', 9990, 'director');
INSERT INTO worker VALUES (6, 2, 'Alla', 500, 'menedzher');

SELECT * FROM worker
WHERE shop_id = 1
ORDER BY salary;

SELECT * FROM worker
WHERE shop_id = 1
ORDER BY salary DESC;

SELECT shop_id, 
SUM(salary) AS все_зарплаты, 
COUNT(name) AS количество_сотрудников
FROM worker
GROUP BY shop_id;