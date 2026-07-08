/*
Practice problem (using your schema)

Using the employees table:

Within each department:

Order employees by salary (ascending).
Calculate a running total of salaries.
Also calculate a 2-employee moving average (current employee + previous employee).

Expected columns:

department_name
employee_name
salary
running_total
moving_average
*/

select  d.department_name, 
        e.employee_name, e.salary,
        sum(salary) over(
            partition by department_name
            order by salary asc
        ) as running_total,
        avg(salary) over(
            partition by department_name
            order by salary asc
            rows between 1 preceding
            and current row
        ) as moving_average
    from employees e 
    inner join departments d on e.department_id = d.department_id