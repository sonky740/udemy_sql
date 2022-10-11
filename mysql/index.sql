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