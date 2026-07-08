/* The subquery depends on the current row of outer query 
This finds employees earning more than their department's average salary.
*/


SELECT employee_name, salary
FROM employees e
WHERE salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e.department_id
);