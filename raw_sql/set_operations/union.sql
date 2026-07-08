/*
    Union combines multiple query results but order is not guraunted and can't have duplicate values
*/

SELECT employee_name
FROM employees
WHERE department_id IS NOT NULL

UNION

SELECT employee_name
FROM employees
WHERE department_id IS NULL;