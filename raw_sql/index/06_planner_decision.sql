-- ============================================================
-- Solution 6: Planner Decision
-- ============================================================

EXPLAIN
SELECT *
FROM employees
WHERE salary > 0;

-- Expected:
-- PostgreSQL may choose Seq Scan because
-- almost every row matches the condition.
-- Reading the whole table is cheaper.
