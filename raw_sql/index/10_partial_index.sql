-- ============================================================
-- Problem: Partial Index
-- ============================================================
--
-- The application only searches active employees.
--
-- Create an index that avoids indexing inactive employees.
--

CREATE INDEX idx_active_employee
ON employees(employee_name)
WHERE status='Active';

EXPLAIN
SELECT *
FROM employees
WHERE status='Active'
AND employee_name='Employee 5000';