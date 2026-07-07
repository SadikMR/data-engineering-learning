/*
=========================================
Topic: RIGHT JOIN
Difficulty: Easy
=========================================

Business Scenario:
Management wants to see every department,
including departments that currently have no employees.

Task:
Display:
- employee_name
- department_name

Requirements:
- Show ALL departments.
- If a department has no employees,
  employee_name should be NULL.
- Sort by department_name (ASC).

Expected Learning:
- Understand how RIGHT JOIN preserves all rows
  from the right table.
*/

select e.employee_name, d.department_name
from employees e
right join departments d on e.department_id = d.department_id
order by d.department_name asc;