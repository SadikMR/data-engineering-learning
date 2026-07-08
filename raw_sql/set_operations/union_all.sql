SELECT employee_name
FROM employees
WHERE salary > 150000

UNION ALL

SELECT employee_name
FROM employees
WHERE department_id = 1;