-- ============================================================
-- ILIKE
-- Case-insensitive pattern matching (PostgreSQL only)
--
-- Behaves exactly like LIKE but ignores letter case.
-- ============================================================

-- Starts with 'a' (matches A, a, ALICE, etc.)
SELECT employee_name
FROM employees
WHERE employee_name ILIKE 'a%';


-- Contains 'SMITH' regardless of case
SELECT employee_name
FROM employees
WHERE employee_name ILIKE '%smith%';


-- Ends with 'SON' regardless of case
SELECT employee_name
FROM employees
WHERE employee_name ILIKE '%SON';