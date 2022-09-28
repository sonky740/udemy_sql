/* ★ DISTINCT
 * SELECT를 입력하고 고유하거나 중복되지 않는 값을 조회할 열 바로 * 앞에 작성
 */
-- SELECT DISTINCT(release_year) FROM film;
-- SELECT DISTINCT rental_rate FROM film;
-- SELECT DISTINCT(rating) FROM film;
-- 
/* ★ COUNT
 * 행의 갯수 계산 (괄호 필수)
 */
-- SELECT COUNT(DISTINCT amount) FROM payment;
-- 
/* ★ WHERE
 * 열에 조건 지정하여 맞는 행 도출
 */
-- SELECT * from customer WHERE first_name = 'Jared';
-- SELECT COUNT(title) FROM film WHERE rental_rate > 4 AND replacement_cost >= 19.99 AND rating = 'R';
-- SELECT COUNT(*) FROM film WHERE rating != 'R';
-- SELECT email FROM customer WHERE first_name = 'Nancy' AND last_name = 'Thomas';
-- SELECT description FROM film WHERE title = 'Outlaw Hanky';
-- SELECT phone FROM address WHERE address = '259 Ipoh Drive';
-- 
/* ★ ORDER BY
 * 행 정렬
 * ASC: 오름차순(default), DESC: 내림차순
 */
-- SELECT store_id, first_name, last_name FROM customer ORDER BY store_id DESC, first_name;
-- 
/* ★ LIMIT
 * 쿼리에 대해 반환되는 행의 개수를 제한할 수 있음.
 */
-- SELECT * FROM payment WHERE amount != 0 ORDER BY payment_date DESC LIMIT 5;
-- SELECT customer_id FROM payment ORDER BY payment_date LIMIT 10;
-- SELECT title, length FROM film ORDER BY length LIMIT 5;
-- 
/* ★ BETWEEN
 * 값 범위와 비교할 때 사용 - NOT 가능
 */
-- SELECT * FROM payment WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-15';
-- 
/* ★ IN
 * OR 여러개 - NOT 가능
 */
-- SELECT * FROM customer WHERE first_name IN ('John', 'Jake', 'Julie');
-- 
/* ★ LIKE, ILIKE
 * 문자열 내의 패턴 매칭 - NOT 가능
 * LIKE: 대소문자 구분, ILIKE: 대소문자 구분 안함.
 * _: 와일드카드 (아무거나 하나) - _가2개면 2개
 * %: 아무거나 전부
 */
-- SELECT * FROM customer WHERE first_name ILIKE 'j%' AND last_name LIKE 'S%';
-- SELECT * FROM customer WHERE first_name LIKE 'A%' AND last_name NOT LIKE 'B%' ORDER BY last_name;
-- 
/* ★ 집계 함수
 * SELECT, HAVING절에서만 호출 가능
 * AVG(): ROUND()를 이용하여 소수점을 명확히 지정 가능,
 * COUNT(),
 * MAX(),
 * MIN(),
 * SUM()
 */
-- SELECT MIN(replacement_cost) FROM film;
-- SELECT MAX(replacement_cost) FROM film;
-- SELECT MAX(replacement_cost), MIN(replacement_cost) FROM film;
-- SELECT ROUND(AVG(replacement_cost), 2) FROM film;
SELECT SUM(replacement_cost) FROM film;
--  
/* ★ GROUP BY
 * 
 */