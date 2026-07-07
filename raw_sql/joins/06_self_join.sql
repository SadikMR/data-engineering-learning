/*
=========================================
Topic: SELF JOIN
Difficulty: Medium
=========================================

Business Scenario:
The HR department wants to generate an organizational
chart showing every employee and their manager.

Task:
Display:

- employee_name
- manager_name

Requirements:
- Show ALL employees.
- Employees without a manager should display NULL
  as manager_name.
- Sort by employee_name (ASC).

Expected Learning:
- SELF JOIN
- Table aliases
- LEFT JOIN on the same table
*/

select e.employee_name, m.employee_name as manager_name
from employees e
left join employees m on e.manager_id = m.employee_id
order by e.employee_name asc;