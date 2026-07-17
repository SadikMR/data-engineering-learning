-- Problem:
-- Users frequently search employees by employee_name.
-- Create an index to improve the performance of this query.

CREATE INDEX idx_employee_name
ON employees(employee_name);