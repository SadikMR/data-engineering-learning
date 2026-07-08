/*Take everything from the first query, then remove anything that also appears in the second query*/

SELECT employee_id
FROM employees

EXCEPT

SELECT employee_id
FROM employee_projects;