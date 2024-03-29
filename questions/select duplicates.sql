SELECT a.FIRST_NAME, a.SURNAME
FROM customers a
JOIN (SELECT FIRST_NAME, SURNAME, COUNT(*)
FROM customers
GROUP BY FIRST_NAME, SURNAME
HAVING COUNT(*) > 1) b
ON a.FIRST_NAME = b.FIRST_NAME
AND a.SURNAME = b.SURNAME
ORDER BY a.FIRST_NAME;

SELECT FIRST_NAME, SURNAME
FROM customers
GROUP BY FIRST_NAME, SURNAME
HAVING count(FIRST_NAME) > 1 AND count(SURNAME) > 1;
