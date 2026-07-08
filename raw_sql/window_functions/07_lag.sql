/*
Problem: Compare with the previous employee in the department

Within each department:

Order employees by salary (highest first)
Show the previous employee's salary
Calculate the salary difference between the current employee and the previous employee

Expected columns:

department_name
employee_name
salary
previous_salary
salary_difference

*/

with dept_salary_comparison as (
    SELECT e.employee_name, 
    d.department_name, 
    e.salary, 
    lag(e.salary) over (partition by department_name order by salary desc) as prev_emp_salary
    from employees e 
    inner join departments d on e.department_id = d.department_id
)

select employee_name, department_name, salary, prev_emp_salary, salary-prev_emp_salary as salary_diff
from dept_salary_comparison