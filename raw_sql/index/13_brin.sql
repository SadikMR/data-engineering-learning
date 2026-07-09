-- ============================================================
-- Problem: BRIN Index
-- ============================================================
--
-- A log table contains billions of records ordered
-- by created_at.
--
-- Users frequently query logs from recent dates.
--
-- Which PostgreSQL index type should you create?
-- Write the CREATE INDEX statement.
--
-- Table:
--
-- CREATE TABLE logs (
--     log_id BIGSERIAL PRIMARY KEY,
--     message TEXT,
--     created_at TIMESTAMP
-- );
--
-- Query:
CREATE INDEX idx_logs_created_at
ON logs
USING BRIN(created_at);

EXPLAIN ANALYZE
SELECT *
FROM logs
WHERE created_at >= '2025-03-11 10:00:00';