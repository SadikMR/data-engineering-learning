-- ============================================================
-- Problem: Expression Index
-- ============================================================
--
-- Users search emails without caring about uppercase
-- or lowercase letters.
--
-- Create an index to optimize this query.
--

CREATE INDEX idx_lower_email
ON employees(LOWER(email));

EXPLAIN
SELECT *
FROM employees
WHERE LOWER(email)='employee5000@example.com';