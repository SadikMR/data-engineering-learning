-- ============================================================
-- Solution 5: Leftmost Prefix Rule
-- ============================================================

EXPLAIN
SELECT *
FROM employees
WHERE salary > 150000;

-- Expected:
-- Usually NOT an efficient use of
-- idx_department_salary because the
-- leftmost column (department_id)
-- is missing.