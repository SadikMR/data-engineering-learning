/*
LEFT JOIN - Problem 1

Show:
- employee_name
- department_name

Requirements:
- Show ALL employees
- Employees without a department should also appear
- Use LEFT JOIN
- Sort by employee_name
*/

select e.employee_name, d.department_name
from employees e
left join departments d on e.department_id = d.department_id
order by e.employee_name asc;  