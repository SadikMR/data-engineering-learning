-- ============================================================
-- Problem: Covering Index
-- ============================================================
--
-- This query runs very frequently.
-- Create an index so PostgreSQL can answer it
-- without reading the employees table whenever possible.
--

CREATE INDEX idx_employee_name_cover
ON employees(employee_name)
INCLUDE (salary);

EXPLAIN ANALYZE
SELECT employee_name, salary
FROM employees
WHERE employee_name='Employee 5000';