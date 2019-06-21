-- 02 SQL intermediate join에서 활용했던 예제
-- EXPLAIN-- 
SELECT *
FROM employees AS e
INNER JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE t.to_date >= CURRENT_DATE();
