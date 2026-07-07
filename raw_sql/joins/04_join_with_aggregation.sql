/*
=========================================
Topic: JOIN + Aggregation
Difficulty: Medium
=========================================

Business Scenario:
The CTO wants a report showing the size and payroll
of every department to understand resource allocation.

Task:
For each department, display:

- department_name
- total_employees
- average_salary
- highest_salary
- lowest_salary

Requirements:
- Include departments with no employees.
- Departments without employees should show:
    total_employees = 0
    average_salary = NULL
    highest_salary = NULL
    lowest_salary = NULL
- Sort by total_employees DESC.

Expected Learning:
- LEFT JOIN
- GROUP BY
- COUNT()
- AVG()
- MAX()
- MIN()
- Handling NULL values in aggregation
*/

select d.department_name, 
count(e.employee_id) as total_employees, 
avg(e.salary) as average_salary, 
max(e.salary) as highest_salary, 
min(e.salary) as lowest_salary
from departments d
left join employees e on d.department_id = e.department_id
group by d.department_name
order by total_employees desc;