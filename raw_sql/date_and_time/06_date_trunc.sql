--DATE_TRUNC() doesn't extract part of a date. It rounds a timestamp down to the beginning of a specified time unit.

SELECT
    DATE_TRUNC('month', hire_date) AS hire_month,
    COUNT(*) AS employees_hired
FROM employees
GROUP BY DATE_TRUNC('month', hire_date)
ORDER BY hire_month;