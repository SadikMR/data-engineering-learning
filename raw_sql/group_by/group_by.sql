/*
Problem: High-Paying Departments

Using the employees and departments tables, write a query to find departments
that satisfy BOTH of the following conditions:

1. The department has at least 3 employees.
2. The department's average salary is greater than the overall average salary
   of all employees in the company.

Return the following columns:
- department_name
- employee_count
- average_salary

Sort the results by average_salary in descending order.
*/

SELECT
    d.department_name,
    COUNT(e.employee_id) AS employee_count,
    AVG(e.salary) AS average_salary
FROM employees e
INNER JOIN departments d
    ON e.department_id = d.department_id
GROUP BY
    d.department_id,
    d.department_name
HAVING
    COUNT(e.employee_id) >= 3
    AND AVG(e.salary) > (
        SELECT AVG(salary)
        FROM employees
    )
ORDER BY
    average_salary DESC;