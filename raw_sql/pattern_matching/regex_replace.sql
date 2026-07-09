-- ============================================================
-- REGEXP_REPLACE()
-- Replace text using regular expressions.
--
-- Syntax:
-- regexp_replace(source, pattern, replacement, flags)
--
-- Common flags:
-- g -> Replace all matches (global)
-- i -> Case-insensitive
-- ============================================================

-- Replace spaces with underscores
SELECT
    employee_name,
    regexp_replace(employee_name, ' ', '_', 'g') AS username
FROM employees;


-- Remove all vowels
SELECT
    employee_name,
    regexp_replace(employee_name, '[aeiouAEIOU]', '', 'g') AS no_vowels
FROM employees;


-- Remove all digits (example)
SELECT regexp_replace(
    'Room123A',
    '[0-9]',
    '',
    'g'
);