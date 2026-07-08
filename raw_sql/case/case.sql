/*
CASE is SQL's version of an if-else statement.
*/

SELECT
    employee_name,
    salary,
    CASE
        WHEN salary >= 150000 THEN 'High'
        WHEN salary >= 100000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_level
FROM employees;