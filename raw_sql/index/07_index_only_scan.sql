CREATE INDEX idx_employee_name
ON employees(employee_name);

EXPLAIN
SELECT employee_name
FROM employees
WHERE employee_name = 'Employee 5000';

-- Expected:
-- PostgreSQL may perform an
-- Index Only Scan because the query
-- requests only the indexed column.