-- ============================================================
-- Problem: GIN Index
-- ============================================================
--
-- A blogging application stores tags as an array.
-- Users frequently search for articles that contain
-- a specific tag.
--
-- Which PostgreSQL index type should you create?
-- Write the CREATE INDEX statement.
--
-- Table:
--
-- CREATE TABLE articles (
--     article_id SERIAL PRIMARY KEY,
--     title TEXT,
--     tags TEXT[]
-- );
--
-- Query:
CREATE INDEX idx_articles_tags
ON articles
USING GIN(tags);

EXPLAIN
SELECT *
FROM articles
WHERE tags @> ARRAY['postgres'];