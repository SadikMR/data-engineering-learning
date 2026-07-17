/*
=========================================
Topic: Multi-table JOIN
Difficulty: Medium
=========================================

Business Scenario:
Management wants to know which employees are
working on which projects and in which department.

Task:
Display:

- employee_name
- department_name
- project_name
- role

Requirements:
- Include only employees assigned to projects.
- Sort by department_name, then employee_name.

Expected Learning:
- Joining more than two tables
- Foreign key relationships
- Reading complex JOIN chains
*/

select e.employee_name, d.department_name, p.project_name, ep.role
from employees e
inner join departments d on e.department_id = d.department_id
inner join employee_projects ep on e.employee_id = ep.employee_id
inner join projects p on ep.project_id = p.project_id
order by d.department_name asc, e.employee_name asc;