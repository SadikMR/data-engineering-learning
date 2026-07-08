/*Find the highest-paid employee in every department.*/

WITH ranked AS (
    SELECT
        e.employee_name,
        d.department_name,
        e.salary,
        ROW_NUMBER() OVER(
            PARTITION BY d.department_name
            ORDER BY e.salary DESC
        ) AS salary_rank
    FROM employees e 
    Inner join departments d on e.department_id = d.department_id
)

SELECT employee_name, department_name, salary
FROM ranked
WHERE salary_rank = 1;