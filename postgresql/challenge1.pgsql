/* 1. How many payment transactions where greater than $5.00? */
-- SELECT COUNT(amount) FROM payment WHERE amount > 5;
/* 2. How many actors have a first name that starts with the letter P? */
-- SELECT COUNT(*) FROM actor WHERE first_name LIKE 'P%';
/* 3. How many unique districts are our customers from? */
-- SELECT COUNT(DISTINCT district) FROM address;
/* 4. Retrieve the list of names for those distinct districts from the previous question */
-- SELECT DISTINCT district FROM address;
/* 5. How many films have a rating of R and a replacement cost between $5 and $15? */
-- SELECT COUNT(*) FROM film WHERE rating = 'R' AND replacement_cost BETWEEN 5 AND 15;
/* 6. How many films have the word Truman somewhere in the title? */
-- SELECT COUNT(*) FROM film WHERE title LIKE '%Truman%';
/* Test - 1 */
/* 1. ID가 2인 직원에게서 최소 110달러를 쓴 고객의 ID를 찾으십시오.
답은 187과 148번 고객입니다. */
-- SELECT customer_id, SUM(amount) FROM payment WHERE staff_id = 2 GROUP BY customer_id HAVING SUM(amount) >= 110;
-- 
/* 2. J로 시작하는 영화는 몇 편입니까?
답은 20입니다. */
-- SELECT COUNT(*) FROM film WHERE title LIKE 'J%';
-- 
/* 3. 이름이 ‘E’로 시작하는 동시에 주소 ID가 500 미만인 고객 중, ID 번호가 가장 높은 고객은 누구입니까?
답은 Eddie Tomlin입니다. */
SELECT first_name, last_name FROM customer WHERE address_id < 500 AND first_name LIKE 'E%' ORDER BY customer_id DESC LIMIT 1;
--