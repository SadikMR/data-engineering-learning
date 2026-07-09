-- ============================================================
-- Problem: Covering Index
-- ============================================================
--
-- This query runs very frequently.
-- Create an index so PostgreSQL can answer it
-- without reading the employees table whenever possible.
--

SELECT employee_name, salary
FROM employees
WHERE employee_name='Employee 5000';