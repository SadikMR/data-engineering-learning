-- ============================================================
-- Problem 3: Execute and Measure
-- ============================================================
--
-- Execute the query and show the actual execution plan.
--
EXPLAIN ANALYZE
SELECT *
FROM employees
WHERE employee_name = 'Employee 5000';

-- Observe:
-- • Scan type
-- • Cost
-- • Rows
-- • Actual execution time
