/*
=========================================
Topic: INNER JOIN
Problem: Employee & Department
Difficulty: Easy
=========================================

Task:
Display each employee with their department name.

Requirements:
- Show employee_name
- Show department_name
- Use INNER JOIN
- Exclude employees without a department
- Sort by employee_name (ASC)
*/

select e.employee_name, d.department_name
from employees e
inner join departments d on e.department_id = d.department_id
order by e.employee_name asc;
