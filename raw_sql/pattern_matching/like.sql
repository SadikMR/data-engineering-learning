-- ============================================================
-- LIKE
-- Simple pattern matching (case-sensitive)
--
-- Wildcards:
-- %  -> Matches zero or more characters
-- _  -> Matches exactly one character
-- ============================================================

-- Employees whose names start with 'A'
SELECT employee_name
FROM employees
WHERE employee_name LIKE 'A%';


-- Employees whose names end with 'son'
SELECT employee_name
FROM employees
WHERE employee_name LIKE '%son';


-- Employees whose names contain 'ar'
SELECT employee_name
FROM employees
WHERE employee_name LIKE '%ar%';


-- Employees whose second character is 'a'
SELECT employee_name
FROM employees
WHERE employee_name LIKE '_a%';