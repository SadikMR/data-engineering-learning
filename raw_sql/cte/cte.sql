/*
SQL Practice: CTE + JOIN

Tables:
1. employees
   - employee_id
   - employee_name
   - department_id
   - salary

2. departments
   - department_id
   - department_name

Task:
1. Create a CTE named high_salary that contains employees
   whose salary is greater than 70,000.

2. Using the CTE, join it with the departments table.

3. Display:
   - department_name
   - employee_name
   - salary

4. Only show employees in the IT department.

5. Sort by salary descending.

Requirements:
- Use a CTE.
- Use an INNER JOIN.
- No subqueries.
- No window functions.
- No GROUP BY.
*/

with high_salary as(
    select employee_id, employee_name, department_id, salary
    from employees
    where salary > 70000
)

select d.department_name, hs.employee_name, hs.salary
from high_salary hs
inner join departments d on hs.department_id = d.department_id
where d.department_name = 'Engineering'
order by hs.salary desc;