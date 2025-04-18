-- 1
SELECT
	F.TITLE
FROM
	FILM AS F
ORDER BY
	F.TITLE ASC
LIMIT
	5;

-- 2
SELECT
	CUSTOMER.CUSTOMER_ID,
	CUSTOMER.FIRST_NAME,
	PAYMENT.AMOUNT,
	PAYMENT.PAYMENT_DATE
FROM
	CUSTOMER
	INNER JOIN PAYMENT ON CUSTOMER.CUSTOMER_ID = PAYMENT.CUSTOMER_ID
ORDER BY
	PAYMENT.PAYMENT_DATE DESC;

SELECT
	CUSTOMER_ID,
	FIRST_NAME,
	AMOUNT,
	PAYMENT_DATE
FROM
	CUSTOMER
	INNER JOIN PAYMENT USING (CUSTOMER_ID)
ORDER BY
	PAYMENT_DATE DESC;

-- 3
SELECT
	FILM.FILM_ID,
	FILM.TITLE,
	INVENTORY.INVENTORY_ID
FROM
	FILM
	LEFT JOIN INVENTORY ON FILM.FILM_ID = INVENTORY.FILM_ID
ORDER BY
	FILM.TITLE;

SELECT
	FILM_ID,
	TITLE,
	INVENTORY_ID
FROM
	FILM
	LEFT JOIN INVENTORY USING (FILM_ID)
ORDER BY
	TITLE;

-- 4
SELECT
	FILM.FILM_ID,
	FILM.TITLE,
	INVENTORY.INVENTORY_ID
FROM
	FILM
	LEFT JOIN INVENTORY ON FILM.FILM_ID = INVENTORY.FILM_ID
WHERE
	INVENTORY.INVENTORY_ID IS NULL
ORDER BY
	FILM.TITLE;

-- 5
SELECT
	FILM.FILM_ID,
	FILM.TITLE,
	INVENTORY.INVENTORY_ID
FROM
	INVENTORY
	RIGHT JOIN FILM ON FILM.FILM_ID = INVENTORY.FILM_ID
ORDER BY
	FILM.TITLE;

-- 6
SELECT
	FILM.FILM_ID,
	FILM.TITLE
FROM
	FILM
	RIGHT JOIN INVENTORY USING (FILM_ID)
WHERE
	INVENTORY_ID IS NULL
ORDER BY
	TITLE;

-- 7
SELECT
	F1.FILM_ID AS FILM1_ID,
	F1.TITLE AS FILM1_TITLE,
	F2.FILM_ID AS FILM2_ID,
	F2.TITLE AS FILM2_TITLE
FROM
	FILM AS F1
	INNER JOIN FILM AS F2 ON F1.LENGTH = F2.LENGTH
WHERE
	F1.FILM_ID > F2.FILM_ID;

-- 8
SELECT
	STAFF.FIRST_NAME,
	STORE.STORE_ID
FROM
	STAFF
	FULL OUTER JOIN STORE ON STAFF.STORE_ID = STORE.STORE_ID;

-- 9 En el ejercicio el WHERE no se usó debido a que no aportaba al resultado
SELECT
	STORE.STORE_ID
FROM
	STORE
	FULL OUTER JOIN STAFF ON STORE.STORE_ID = STAFF.STORE_ID;

-- 10 En el ejercicio el WHERE no se usó debido a que no aportaba al resultado
SELECT
	STAFF.FIRST_NAME,
	STAFF.LAST_NAME
	
FROM
	STAFF
	FULL OUTER JOIN STORE ON STAFF.STORE_ID = STORE.STORE_ID;

-- 11 No existe la tabla llamada products


-- 12
SELECT
	CUSTOMER_ID
FROM
	PAYMENT
GROUP BY
	CUSTOMER_ID
ORDER BY
	CUSTOMER_ID ASC;

-- 13
SELECT
	CUSTOMER_ID,
	SUM(AMOUNT) AS TOTAL_PAYMENT
FROM
	PAYMENT
GROUP BY
	CUSTOMER_ID
ORDER BY
	CUSTOMER_ID;

-- 14
SELECT
	CUSTOMER_ID,
	SUM(AMOUNT) AS TOTAL_PAYMENT
FROM
	PAYMENT
GROUP BY
	CUSTOMER_ID
ORDER BY
	TOTAL_PAYMENT DESC;

-- 15
SELECT
	CONCAT(FIRST_NAME, ' ', LAST_NAME) AS FULL_NAME,
	SUM(AMOUNT) AS TOTAL_PAYMENT
FROM
	CUSTOMER
	JOIN PAYMENT USING (CUSTOMER_ID)
GROUP BY
	FULL_NAME
ORDER BY
	TOTAL_PAYMENT DESC;

-- 16
SELECT
	STAFF_ID,
	COUNT(*) AS PAYMENT_COUNT
FROM
	PAYMENT
GROUP BY
	STAFF_ID;

-- 17
SELECT
	CUSTOMER_ID,
	STAFF_ID,
	SUM(AMOUNT) AS TOTAL_PAYMENT
FROM
	PAYMENT
GROUP BY
	CUSTOMER_ID,
	STAFF_ID
ORDER BY
	CUSTOMER_ID;

-- 18
SELECT
	DATE (PAYMENT_DATE) AS PAYMENT_DAY,
	COUNT(*) AS TRANSACTION_COUNT,
	SUM(AMOUNT) AS DAILY_TOTAL
FROM
	PAYMENT
GROUP BY
	PAYMENT_DAY
ORDER BY
	PAYMENT_DAY DESC;

-- 19
SELECT
	CUSTOMER_ID,
	SUM(AMOUNT) AS TOTAL_PAYMENT
FROM
	PAYMENT
GROUP BY
	CUSTOMER_ID
HAVING
	SUM(AMOUNT) > 200
ORDER BY
	TOTAL_PAYMENT DESC;

-- 20
SELECT
	STORE_ID,
	COUNT(DISTINCT CUSTOMER_ID) AS CUSTOMER_COUNT
FROM
	CUSTOMER
GROUP BY
	STORE_ID
HAVING
	COUNT(DISTINCT CUSTOMER_ID) > 300;