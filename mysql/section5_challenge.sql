-- Active: 1664945899270@@sonky.myasustor.com@3306@udemy
-- CREATE TABLE people (first_name CHAR(20), last_name CHAR(20), age SMALLINT);
-- INSERT INTO
--   people (first_name, last_name, age)
-- VALUES
--   ('Phillip', 'Frond', 38),
--   ('Calvin', 'Fischoeder', 70);
-- SHOW WARNINGS;
-- CREATE TABLE cats (name VARCHAR(100) NOT NULL DEFAULT 'unnamed', age INT NOT NULL DEFAULT 1);
-- INSERT INTO cats () VALUES ();
-- ALTER TABLE cats ALTER COLUMN id SERIAL FIRST;
-- CREATE TABLE
--   employees (
--     id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
--     first_name VARCHAR(255) NOT NULL,
--     last_name VARCHAR(255) NOT NULL,
--     middle_name VARCHAR(255),
--     age INT NOT NULL,
--     current_status VARCHAR(255) NOT NULL DEFAULT 'employed'
--   );
-- INSERT INTO employees (first_name, last_name, age) VALUES ('Dora', 'Smith', 58)
/* SELECT */
-- SELECT cat_id FROM cats;
-- SELECT name, age FROM cats WHERE name IN('Ringo', 'Misty');
-- SELECT cat_id, age FROM cats WHERE cat_id=age;
/* UPDATE */
-- UPDATE cats SET name='Jack' WHERE name='Jackson';
-- UPDATE cats SET breed='British Shorthair' WHERE name='Ringo';
-- UPDATE cats SET age=12 WHERE breed='Maine Coon';
/* DELETE */
-- DELETE FROM cats WHERE age=4;
-- DELETE FROM cats WHERE cat_id=age;
-- DELETE FROM cats;