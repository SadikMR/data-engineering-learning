/*
=========================================
Topic: FULL OUTER JOIN
Difficulty: Medium
=========================================

Business Scenario:
The HR team is auditing employee and department
assignments. They want to identify:

- Employees without a department.
- Departments without any employees.
- Employees who are correctly assigned to departments.

Task:
Display:

- employee_name
- department_name

Requirements:
- Show ALL employees.
- Show ALL departments.
- If an employee has no department,
  department_name should be NULL.
- If a department has no employees,
  employee_name should be NULL.
- Sort by department_name, then employee_name.

Expected Learning:
- FULL OUTER JOIN
- Understanding unmatched rows on both sides
- Handling NULL values
*/

select e.employee_name, d.department_name
from employees e
full outer join departments d on e.department_id = d.department_id
order by d.department_name asc, e.employee_name asc;