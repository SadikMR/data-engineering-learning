/* Find the top 3 highest-paid employees in each department, including ties.*/

with ranked as (
    select e.employee_name, 
    d.department_name, 
    e.salary,
    RANK() over(
        partition by d.department_name
        order by e.salary desc
    ) as salary_rank
    from employees e 
    inner join departments d on e.department_id = d.department_id
)

select * from ranked
where salary_rank <= 3