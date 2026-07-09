SELECT
    employee_name,
    salary::NUMERIC(10,2)
FROM employees;

/*
What does NUMERIC(10,2) mean?
10 = total number of digits.
2 = digits after the decimal point.
*/