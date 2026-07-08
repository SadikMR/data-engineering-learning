/* 

Problem: Employees earning above their department average

Using your employees and departments tables, write a query to:

Show every employee
Show their department
Show their salary
Show the average salary of their department
Return only employees whose salary is greater than their department's average salary

*/

with employee_salary as (
    select e.employee_name, d.department_name, e.salary, avg(e.salary) 
    over(
        partition by department_name
    ) as avg_dept_salary
    from employees e 
    inner join departments d on e.department_id = d.department_id
)

select * from employee_salary
where salary > avg_dept_salary