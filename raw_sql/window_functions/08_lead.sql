/*
Problem: Compare with the next employee in the department

Within each department:

Order employees by salary (highest first)
Show the next employee's salary
Calculate the salary difference between the current employee and the next employee

Expected columns:

department_name
employee_name
salary
next_salary
salary_difference

*/

with dept_salary_comparison as (
    SELECT e.employee_name, 
    d.department_name, 
    e.salary, 
    lead(e.salary) over (partition by department_name order by salary desc) as next_emp_salary
    from employees e 
    inner join departments d on e.department_id = d.department_id
)

select employee_name, department_name, salary, next_emp_salary, salary-next_emp_salary as salary_diff
from dept_salary_comparison
