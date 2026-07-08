/*
----Is the values exists in the list?---

shows employees whose location is Dhaka

*/

SELECT employee_name
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE location = 'Dhaka'
);