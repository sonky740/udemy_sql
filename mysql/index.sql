-- Active: 1664945899270@@sonky.myasustor.com@3306@udemy
-- SELECT * FROM books;
/* CONCAT */
-- SELECT CONCAT(author_fname, ' ', author_lname) AS full_name FROM books;
-- SELECT CONCAT_WS('-', title, author_fname, author_lname) FROM books;
/* SUBSTRING*/
-- SELECT SUBSTRING(title, 5) FROM books;
-- SELECT CONCAT(SUBSTRING(title, 1, 10), '...') AS short_title FROM books;
/* REPLACE */
-- SELECT REPLACE(title, ' ', '_') FROM books;
-- SELECT SUBSTRING(REPLACE(title, 'e', '3'), 1, 10) FROM books;
/* REVERSE */
-- SELECT REVERSE(title) FROM books;
/* CHAR LENGTH */
-- SELECT CHAR_LENGTH(title) FROM books;
-- SELECT CONCAT(author_lname, ' is ', CHAR_LENGTH(author_lname), ' characters long') FROM books;
/* UPPER, LOWER */
-- SELECT CONCAT('MY FAVORITE BOOK IS ', UPPER(title)) FROM books;
-- SELECT CONCAT('MY FAVORITE BOOK IS ', LOWER(title)) FROM books;
/* DATEDIFF */
-- SELECT DATEDIFF(NOW(), birthdate) FROM people;
-- SELECT name, birthdate, DATEDIFF(NOW(), birthdate) FROM people;
/* DATE_ADD */
-- SELECT birthdt, DATE_ADD(birthdt, INTERVAL 1 MONTH) FROM people;
-- SELECT birthdt, birthdt + INTERVAL 15 MONTH + INTERVAL 10 HOUR FROM people;
/* DATETIME, TIMESTAMP
 * DATETIME은 1000-01-01 00:00~9999-12-31 23:59:59
 * TIMESTAMP는 1970-01-01 00:00:01~2038-01-19 03:14:07
 * 
 * DATETIME은 8바이트
 * TIMESTAMP는 4바이트
 * 
 * DATETIME은 문자형
 * TIMESTAMP는 숫자형
 */
-- CREATE TABLE
--   comments2 (
--     content VARCHAR(100),
--     changed_at TIMESTAMP DEFAULT NOW () ON UPDATE CURRENT_TIMESTAMP
--   );

