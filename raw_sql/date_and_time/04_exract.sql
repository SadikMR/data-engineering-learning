--Extracts a specific part of a date.
SELECT
    employee_name,
    EXTRACT(YEAR FROM hire_date) AS hire_year
FROM employees;