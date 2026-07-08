/*
Problem: Identify the Highest-Paid Employee in Each Department

Using the employees and departments tables, write a query to display:

employee_name
department_name
salary
highest_paid_employee

Requirements:

For every employee, show the name of the highest-paid employee in their department.
Use FIRST_VALUE().
Do not use MAX(), ROW_NUMBER(), RANK(), DENSE_RANK(), subqueries, or CTEs.
The result should contain all employees, not just the highest-paid ones.
*/

select 
    e.employee_name, 
    d.department_name,
    e.salary,
    first_value(employee_name) over (
        partition by department_name
        order by salary desc
    ) as highiest_paid_employee
    
    from employees e 
    inner join departments d
    on e.department_id = d.department_id