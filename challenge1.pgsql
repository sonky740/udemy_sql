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

/* How many films have the word Truman somewhere in the title? */
-- SELECT COUNT(*) FROM film WHERE title LIKE '%Truman%';