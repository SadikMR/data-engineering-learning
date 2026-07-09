-- ============================================================
-- Problem 2: Verify the Query Plan
-- ============================================================
--
-- Without executing the query, determine whether PostgreSQL
-- performs a Sequential Scan or an Index Scan.
--
EXPLAIN
SELECT *
FROM employees
WHERE employee_name = 'Employee 5000';

-- Expected:
-- Index Scan using idx_employee_name
-- (For very small tables PostgreSQL may still choose Seq Scan.)