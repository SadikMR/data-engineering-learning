-- ============================================================
-- Solution 4: Composite Index
-- ============================================================

CREATE INDEX idx_department_salary
ON employees(department_id, salary);