--Returns the difference between two dates in years, months and days.

SELECT
    employee_name,
    hire_date,
    AGE(CURRENT_DATE, hire_date) AS experience
FROM employees;