-- =====================================
-- Company HR Dataset Setup
-- Recreates the complete practice database
-- =====================================

\echo 'Resetting database...'
\i /sql/datasets/employees/reset.sql

\echo 'Creating tables...'
\i /sql/datasets/employees/schema.sql

\echo 'Inserting sample data...'
\i /sql/datasets/employees/seed.sql

\echo '====================================='
\echo 'Database setup completed successfully.'
\echo '====================================='