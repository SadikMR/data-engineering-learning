-- ============================================================
-- Solution 8: Index Maintenance
-- ============================================================

UPDATE employees
SET employee_name = 'Aaron'
WHERE employee_id = 5;

-- PostgreSQL performs:
--
-- 1. Update the table row.
-- 2. Remove the old value ("Employee ...")
--    from idx_employee_name.
-- 3. Insert the new value ("Aaron")
--    into the correct position in the index.