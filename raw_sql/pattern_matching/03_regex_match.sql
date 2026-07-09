-- ============================================================
-- REGEX MATCH (~)
-- More powerful than LIKE.
--
-- Common regex symbols:
-- ^      -> Start of string
-- $      -> End of string
-- []     -> Character set
-- [A-Z]  -> Character range
-- .      -> Any single character
-- *      -> Zero or more
-- +      -> One or more
-- ============================================================

-- Names starting with A, B or C
SELECT employee_name
FROM employees
WHERE employee_name ~ '^[ABC]';


-- Names ending with 'son'
SELECT employee_name
FROM employees
WHERE employee_name ~ 'son$';


-- Names containing at least one vowel
SELECT employee_name
FROM employees
WHERE employee_name ~ '[aeiouAEIOU]';


-- Names containing two consecutive lowercase letters
SELECT employee_name
FROM employees
WHERE employee_name ~ '[a-z]{2}';