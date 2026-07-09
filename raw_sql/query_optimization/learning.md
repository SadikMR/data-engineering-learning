# Query Optimization

## What is Query Optimization?

Query optimization is the process of writing SQL queries that return the same result with less work. The goal is to reduce query execution time, CPU usage, memory usage, and disk I/O.

An optimized query depends not only on how it is written but also on how the data is stored (indexes, table size, statistics, etc.).

---

# Why Query Optimization?

A well-optimized query:

* Reduces query execution time.
* Uses less CPU, memory, and disk I/O.
* Improves scalability.
* Reduces locking and blocking.
* Improves overall application performance.

---

# Analyzing Queries

## EXPLAIN

```sql
EXPLAIN
SELECT ...
```

Shows PostgreSQL's **estimated execution plan** without executing the query.

---

## EXPLAIN ANALYZE

```sql
EXPLAIN ANALYZE
SELECT ...
```

Executes the query and shows the **actual execution plan**, including:

* Execution time
* Actual rows processed
* Loops
* Operations performed

Use `EXPLAIN ANALYZE` to understand why a query is slow.

---

## Reading an Execution Plan

When reading a plan, ask:

* How is data being read?
* Is an index being used?
* How are tables being joined?
* Is sorting required?
* Is aggregation required?
* Which operation takes the most time?

---

# Common Execution Plan Nodes

## Scan Nodes

### Seq Scan

Reads every row in the table.

Best when:

* Table is small.
* Most rows match the condition.
* No useful index exists.

---

### Index Scan

Uses an index to directly locate matching rows.

Best when:

* Retrieving a small number of rows.
* Searching by primary key or indexed columns.

---

### Bitmap Index Scan + Bitmap Heap Scan

Used when many rows match an indexed condition.

* **Bitmap Index Scan:** Finds all matching row locations using the index.
* **Bitmap Heap Scan:** Reads the required table pages efficiently to retrieve those rows.

Instead of jumping between the index and table for every row, PostgreSQL first collects all matching locations, then reads the table page by page.

---

## Join Nodes

### Nested Loop

For each row in one table, PostgreSQL searches for matching rows in the other table.

Best for:

* Small tables
* Indexed lookups

---

### Hash Join

Builds an in-memory hash table from the smaller table, then quickly matches rows from the larger table.

Best for:

* Equality joins (`=`)
* Medium and large tables

---

### Merge Join

Requires both inputs to be sorted.

PostgreSQL scans both sorted datasets once and joins matching rows.

Best for:

* Large sorted datasets
* Tables already ordered by indexes

---

## Other Nodes

### Sort

Appears with:

* `ORDER BY`

---

### Aggregate

Appears with:

* `GROUP BY`
* `COUNT()`
* `SUM()`
* `AVG()`
* `MIN()`
* `MAX()`

Common types:

* `HashAggregate`
* `GroupAggregate`

---

### Limit

Stops returning rows after the specified limit.

---

# Query Optimization Techniques

## 1. Filter Early

Reduce rows before joins or aggregations.

Less data processed = faster query.

---

## 2. Use Indexes Effectively

Indexes allow PostgreSQL to locate rows without scanning the entire table.

### Indexing Guidelines

* Index columns frequently used in `WHERE`.
* Index columns used in `JOIN`.
* Index columns used in `ORDER BY`.
* Avoid unnecessary indexes because they slow down `INSERT`, `UPDATE`, and `DELETE`.
* Monitor index usage periodically.

---

## 3. Avoid `SELECT *`

Retrieve only the columns you actually need.

Benefits:

* Less disk I/O
* Less memory usage
* Less network transfer

---

## 4. Write Efficient `WHERE` Clauses

Avoid functions or calculations on indexed columns.

❌

```sql
WHERE DATE(created_at) = '2025-01-01'
```

✔

```sql
WHERE created_at >= '2025-01-01'
AND created_at < '2025-01-02'
```

This allows PostgreSQL to use indexes efficiently.

---

## 5. Optimize `LIKE`

✔ Better

```sql
LIKE 'John%'
```

❌ Usually slower

```sql
LIKE '%John'
```

A leading `%` usually prevents a B-tree index from being used.

---

## 6. Optimize JOINs

Joins are often one of the most expensive operations.

Good practices:

* Filter rows before joining.
* Join only the required tables.
* Index join columns.
* Prefer `INNER JOIN` when unmatched rows are not needed.
* Understand the join strategy chosen by PostgreSQL.

---

## 7. Avoid N+1 Queries

N+1 occurs when one query retrieves a list, then additional queries are executed for each record.

❌ Poor

* 1 query for users
* 100 more queries for each user's orders

✔ Better

Retrieve all required data using a single `JOIN`.

Benefits:

* Fewer database calls
* Faster response time
* Lower database load

---

## 8. `EXISTS` vs `IN`

`EXISTS` can be more efficient for correlated subqueries because it stops searching after finding the first match.

However, PostgreSQL often optimizes both forms, so compare them using `EXPLAIN ANALYZE` when performance matters.

---

## 9. Use `ORDER BY` with `LIMIT`

```sql
ORDER BY created_at DESC
LIMIT 10;
```

A suitable index can allow PostgreSQL to stop early instead of sorting the full dataset.

---

## 10. Prefer `UNION ALL` When Possible

`UNION`

* Removes duplicate rows.
* Requires extra sorting or hashing.

`UNION ALL`

* Simply combines results.
* Faster because duplicate removal is skipped.

Use `UNION ALL` unless duplicate removal is required.

---

## 11. Query Rewriting

The same result can often be written more efficiently.

Examples:

* Prefer `WHERE` over `HAVING` when filtering before aggregation.
* Remove unnecessary subqueries.
* Rewrite queries only if the execution plan improves.

Always verify changes with `EXPLAIN ANALYZE`.

---

## 12. Optimize Aggregations

Operations like:

* `COUNT()`
* `SUM()`
* `AVG()`
* `GROUP BY`
* `DISTINCT`

require additional computation.

Reduce the number of input rows before aggregation whenever possible.

---

## 13. Materialized Views

Useful for expensive reports or dashboards.

Instead of recalculating the same aggregation repeatedly, store the result in a materialized view and refresh it when needed.

---

## 14. Query Caching

Frequently executed queries can benefit from caching.

Examples:

* Application cache (Redis, Memcached)
* Database cache
* Materialized Views

Caching reduces repeated computation.

---

## 15. Avoid Unnecessary `DISTINCT`

`DISTINCT` removes duplicate rows by sorting or hashing.

Use it only when duplicate removal is actually required.

---

## 16. Avoid Large `OFFSET`

Large offsets require PostgreSQL to skip many rows.

Instead of:

```sql
LIMIT 20 OFFSET 100000;
```

Prefer keyset pagination:

```sql
WHERE id > 100000
ORDER BY id
LIMIT 20;
```

---

# Performance Tuning

Query optimization is only one part of SQL performance tuning.

Performance also depends on:

* Proper indexing
* Better query design
* Materialized Views
* Database configuration
* Hardware resources

For a Data Engineer, query design and indexing are the highest priorities.

---

# Common Misconceptions

### ❌ "UNION is always faster."

Use `UNION ALL` when duplicate removal is not required.

---

### ❌ "Don't use many JOINs."

Multiple joins are completely normal in a normalized database.

Optimize the joins instead of avoiding them.

---

### ❌ "Avoid subqueries."

Not always true.

Choose the most readable query first, then optimize only if necessary.

---

### ❌ "Avoid ORDER BY or GROUP BY."

These operations are essential when sorting or aggregation is required.

Only avoid unnecessary sorting or grouping.

---

# Optimization Checklist

When a query is slow, ask:

* Is PostgreSQL performing a `Seq Scan` on a large table?
* Can an index be added or used?
* Can I filter rows earlier?
* Am I retrieving unnecessary columns?
* Is sorting processing too many rows?
* Can `LIMIT` reduce the work?
* Are joins processing unnecessary rows?
* Can an expensive aggregation be precomputed?
* What does `EXPLAIN ANALYZE` show?

---

# Key Takeaways

* Measure before optimizing.
* Use `EXPLAIN ANALYZE` to understand execution plans.
* Reduce the amount of data processed.
* Filter early.
* Retrieve only the columns you need.
* Use indexes effectively.
* Understand execution plans instead of guessing.
* Optimize only after identifying a measurable bottleneck.
