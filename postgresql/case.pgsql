/* ★ CASE (IF ELSE)
 * 특정 조건이 충족되었을 때 실행
 * CASE ~ WHEN ~ THEN ~ ELSE ~ END
 */
-- SELECT
--   customer_id,
--   CASE
--     WHEN (customer_id <= 100) THEN 'Premium'
--     WHEN (customer_id BETWEEN 100 AND 200) THEN 'Plus'
--     ELSE 'Normal'
--   END AS customer_class
-- FROM
--   customer;
-- 
-- SELECT
--   customer_id,
--   CASE
--     customer_id
--     WHEN 2 THEN 'Winner'
--     WHEN 5 THEN 'Second Place'
--     ELSE 'Normal'
--   END AS raffle_results
-- FROM
--   customer;
-- 
-- SELECT
--   SUM(
--     CASE
--       rental_rate
--       WHEN 0.99 THEN 1
--       ELSE 0
--     END
--   ) AS bargains,
--   SUM(
--     CASE
--       rental_rate
--       WHEN 2.99 THEN 1
--       ELSE 0
--     END
--   ) AS regular,
--   SUM(
--     CASE
--       rental_rate
--       WHEN 4.99 THEN 1
--       ELSE 0
--     END
--   ) AS premium
-- FROM
--   film;
-- 
-- SELECT
--   SUM(
--     CASE
--       rating
--       WHEN 'R' THEN 1
--       ELSE 0
--     END
--   ) AS r,
--   SUM(
--     CASE
--       rating
--       WHEN 'PG' THEN 1
--       ELSE 0
--     END
--   ) AS pg,
--   SUM(
--     CASE
--       rating
--       WHEN 'PG-13' THEN 1
--       ELSE 0
--     END
--   ) AS pg13
-- FROM
--   film;
-- 
/* ★ COALESCE
 * 무한한 수의 arguments를 쓸 수 있는 기능, null이 아닌 첫 argument를 도출.
 * 보통 NULL값을 0으로 치환할 때 씀
 */
-- SELECT item, (price - COALESCE(discount, 0)) AS final FROM table;
-- 
/* ★ CAST
 * 데이터 유형을 바꿔줌.
 */
-- SELECT CAST('5' AS INTEGER) AS new_int;
-- SELECT '5'::INTEGER AS new_int; -- postgreSQL에서만 가능
-- SELECT CHAR_LENGTH(CAST(inventory_id AS VARCHAR)) FROM rental;
-- 
/* ★ NULLIF
 * 표현식 1과 표현식 2가 같으면 NULL, 다르면 표현식 1 도출.
 */
-- SELECT
--   (
--     SUM(
--       CASE
--         WHEN department = 'A' THEN 1
--         ELSE 0
--       END
--     ) / NULLIF(SUM(
--       CASE
--         WHEN department = 'B' THEN 1
--         ELSE 0
--       END
--     ), 0)
--   ) AS department_ratio
-- FROM
--   depts;
-- 
/* ★ VIEW
 * 특정 query를 저장해둠.
 */
-- CREATE VIEW customer_info AS SELECT first_name, last_name, address FROM customer INNER JOIN address ON customer.address_id = address.address_id;
-- CREATE OR REPLACE VIEW customer_info AS SELECT first_name, last_name, address, district FROM customer INNER JOIN address ON customer.address_id = address.address_id;
-- ALTER VIEW customer_info RENAME TO customer_info2;
-- DROP VIEW IF EXISTS customer_info2;