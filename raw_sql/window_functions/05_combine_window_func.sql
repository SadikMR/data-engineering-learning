/*

Display the following columns:

employee_name
department_name
project_name
salary

department_average_salary

salary_rank_in_department

salary_dense_rank_in_department

employee_number_in_department

highest_paid_employee_in_department

previous_employee_salary

next_employee_salary

salary_difference_from_previous

*/

WITH employee_stats AS (
    SELECT
        e.employee_id,
        e.employee_name,
        d.department_name,
        e.salary,

        AVG(e.salary) OVER (
            PARTITION BY e.department_id
        ) AS department_average_salary,

        RANK() OVER (
            PARTITION BY e.department_id
            ORDER BY e.salary DESC
        ) AS salary_rank_in_department,

        DENSE_RANK() OVER (
            PARTITION BY e.department_id
            ORDER BY e.salary DESC
        ) AS salary_dense_rank_in_department,

        ROW_NUMBER() OVER (
            PARTITION BY e.department_id
            ORDER BY e.salary DESC
        ) AS employee_number_in_department,

        FIRST_VALUE(e.employee_name) OVER (
            PARTITION BY e.department_id
            ORDER BY e.salary DESC
        ) AS highest_paid_employee_in_department,

        LAG(e.salary) OVER (
            PARTITION BY e.department_id
            ORDER BY e.salary DESC
        ) AS previous_employee_salary,

        LEAD(e.salary) OVER (
            PARTITION BY e.department_id
            ORDER BY e.salary DESC
        ) AS next_employee_salary

    FROM employees e
    INNER JOIN departments d
        ON e.department_id = d.department_id
),

employee_project_report AS (
    SELECT
        es.*,
        p.project_name
    FROM employee_stats es
    INNER JOIN employee_projects ep
        ON es.employee_id = ep.employee_id
    INNER JOIN projects p
        ON ep.project_id = p.project_id
)

SELECT
    employee_name,
    department_name,
    project_name,
    salary,
    department_average_salary,
    salary_rank_in_department,
    salary_dense_rank_in_department,
    employee_number_in_department,
    highest_paid_employee_in_department,
    previous_employee_salary,
    next_employee_salary,
    salary - previous_employee_salary AS salary_difference_from_previous
FROM employee_project_report


