/* Does at least one row exists 

display employees who are assigned at least one project

*/

SELECT employee_name
FROM employees e
WHERE EXISTS (
    SELECT 1
    FROM employee_projects ep
    WHERE ep.employee_id = e.employee_id
);