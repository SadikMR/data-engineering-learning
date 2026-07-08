/*
Medium Practice Problem

Using your schema:

Write a query that:

Shows every employee
Shows the department
Shows the salary
Divides employees within each department into 4 salary bands
Highest salaries should be in bucket 1

Expected columns:

department_name
employee_name
salary
salary_band

Use:

NTILE()
PARTITION BY
ORDER BY
*/

select e.employee_name, 
    d.department_name,
    e.salary,
    ntile(4) over(
        partition by department_name
        order by salary desc
    ) as salary_band
    from employees e 
    inner join departments d
    on e.department_id = d.department_id