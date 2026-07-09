SELECT employee_name, hire_date
FROM employees
WHERE hire_date >= CURRENT_DATE - INTERVAL '5 years';