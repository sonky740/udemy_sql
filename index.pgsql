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
 * 집계함수 사용 불가
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
-- SELECT SUM(replacement_cost) FROM film;
--  
/* ★ GROUP BY
 * 카테고리별로 열을 집계
 * FROM 바로 뒤 or WHERE 바로 뒤에 있어야함.
 */
-- SELECT customer_id, SUM(amount) FROM payment GROUP BY customer_id ORDER BY SUM(amount) DESC;
-- SELECT staff_id, customer_id, SUM(amount) FROM payment GROUP BY staff_id, customer_id ORDER BY staff_id, customer_id;
-- SELECT DATE(payment_date), SUM(amount) FROM payment GROUP BY DATE(payment_date) ORDER BY SUM(amount) DESC;
-- SELECT staff_id, COUNT(amount) FROM payment GROUP BY staff_id;
-- SELECT rating, AVG(replacement_cost) FROM film GROUP BY rating;
-- SELECT customer_id, SUM(amount) FROM payment GROUP BY customer_id ORDER BY SUM(amount) DESC LIMIT 5;
-- 
/* ★ HAVING
 * 집계가 이미 수행된 "이후에" 자료 필터링
 * WHERE절에서 집계함수를 못쓰므로 HAVING절에서 사용.
 */
-- SELECT customer_id, SUM(amount) FROM payment GROUP BY customer_id HAVING SUM(amount) > 100;
-- SELECT store_id, COUNT(customer_id) FROM customer GROUP BY store_id HAVING COUNT(customer_id) > 300;
-- SELECT customer_id, COUNT(amount) FROM payment GROUP BY customer_id HAVING COUNT(amount) >= 40 ORDER BY COUNT(amount) DESC;
-- SELECT customer_id, SUM(amount) FROM payment WHERE staff_id = 2 GROUP BY customer_id HAVING SUM(amount) > 100;
-- 
/* ★ AS
 * 열이나 결과에 별칭을 부여.
 * 순전히 가독성을 위함.
 * 쿼리의 맨 마지막에 실행되므로, WHERE절이나 GROUP BY 호출에 사용 불가.
 * ORDER BY에는 가능.
 */
-- SELECT customer_id, SUM(amount) AS amount_sum FROM payment GROUP BY customer_id ORDER BY amount_sum DESC;
-- 
/* ★ INNER JOIN (JOIN = INNER JOIN)
 * 결합 되는 테이블을 모두 충족 (교집합) 
 */
-- SELECT payment_id, payment.customer_id, first_name FROM payment INNER JOIN customer ON payment.customer_id = customer.customer_id;
-- 
/* ★ FULL OUTER JOIN (FULL JOIN)
 * 결합 되는 테이블의 모든 데이터
 */
-- SELECT * FROM customer FULL JOIN payment ON customer.customer_id = payment.customer_id WHERE customer.customer_id IS null OR payment.payment_id IS null;
-- 
/* ★ LEFT OUTER JOIN (LEFT JOIN)
 * 왼쪽 테이블에 있는 레코드 세트를 결과로 출력
 * 비대칭이기때문에 테이블 순서 중요.
 */
-- SELECT film.film_id, film.title, inventory_id, store_id FROM film LEFT JOIN inventory ON inventory.film_id = film.film_id WHERE inventory.film_id IS null; -- film에 속한것만 가져옴.
-- 
/* ★ RIGHT OUTER JOIN (RIGHT JOIN)
 * 오른쪽 테이블에 있는 레코드 세트를 결과로 출력
 * 비대칭이기때문에 테이블 순서 중요.
 */
-- SELECT film.film_id, film.title, inventory_id, store_id FROM inventory RIGHT JOIN film ON inventory.film_id = film.film_id WHERE inventory.film_id IS null; -- film에 속한것만 가져옴.
-- 
/* ★ UNION
 * 2개 이상의 SELECT문의 결과를 결합
 * JOIN과는 다르게 그냥 그대로 갖다 붙임.
 * 같은 수의 컬럼과 자료 구조가 동일 해야함.
 */
-- SELECT * FROM film_actor UNION SELECT * FROM film_category;