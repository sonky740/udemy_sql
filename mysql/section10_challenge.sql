-- Active: 1664945899270@@sonky.myasustor.com@3306@udemy
-- CREATE TABLE
--   inventory (
--     item_name VARCHAR(100),
--     price DECIMAL(8, 2),
--     quantity INT
--   )
-- SELECT CURTIME();
-- SELECT CURDATE();
-- SELECT DAYOFWEEK(CURDATE());
-- SELECT DAYOFWEEK(NOW());
-- SELECT DATE_FORMAT(NOW(), '%w');
-- SELECT DAYNAME(NOW());
-- SELECT to_char(NOW(), 'yyyy-mm-dd');
-- SELECT DATE_FORMAT(NOW(), '%M %D at %h:%i');
-- CREATE TABLE
--   tweets (
--     content VARCHAR(140),
--     username VARCHAR(20),
--     created_at TIMESTAMP DEFAULT NOW ()
--   )