/*
Returns a single value
display employees' whose salary greater than the average salary
*/

SELECT employee_name
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);