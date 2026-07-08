/* Only displays common rows */

SELECT employee_id
FROM employees
WHERE salary > 120000

INTERSECT

SELECT employee_id
FROM employee_projects;