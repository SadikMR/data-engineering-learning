/*
Problem: Identify the Lowest-Paid Employee in Each Department

Using the employees and departments tables, write a query to display:

employee_name
department_name
salary
lowest_paid_employee

Requirements:

For every employee, show the name of the last-paid employee in their department.
Use LAST_VALUE().
Do not use MIN(), ROW_NUMBER(), RANK(), DENSE_RANK(), subqueries, or CTEs.
The result should contain all employees, not just the last-paid ones.
*/

select 
    e.employee_name, 
    d.department_name,
    e.salary,
    last_value(employee_name) over (
        partition by department_name
        order by salary desc
        rows between unbounded preceding
        and unbounded following
    ) as lowest_paid_employee
    
    from employees e 
    inner join departments d
    on e.department_id = d.department_id