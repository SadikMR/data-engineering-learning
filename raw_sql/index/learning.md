# SQL Indexing - Learning Notes

## Why Indexes?

Without an index, PostgreSQL performs a **Sequential Scan (Seq Scan)**.

```text
Read Row 1
Read Row 2
Read Row 3
...
```

Time Complexity:

```
O(n)
```

With an index:

```text
Search Index
↓

Find Row Location
↓

Read Row
```

Approximately:

```
O(log n)
```

---

# What is an Index?

An index is a **separate database object** (data structure).

It **does NOT** reorder the table.

Conceptually it stores:

```text
Indexed Value
↓

Pointer (Row Location)
```

Example:

```text
Alice   → Row2
Bob     → Row4
Charlie → Row1
```

Table remains unchanged.

---

# B-Tree Index

Default PostgreSQL index.

Supports:

- `=`
- `<`
- `>`
- `<=`
- `>=`
- `BETWEEN`
- `ORDER BY`

Automatically kept sorted.

Used in most queries.

---

# Index Maintenance

Whenever an indexed column changes:

```sql
UPDATE employees
SET employee_name='Aaron'
WHERE employee_id=5;
```

PostgreSQL

1. Updates the table row.
2. Removes old index entry.
3. Inserts new index entry.

Therefore:

- SELECT → Faster
- INSERT → Slower
- UPDATE → Slower
- DELETE → Slower

---

# Don't Index Everything

Indexes consume:

- Disk space
- Write performance

Only index columns frequently used in:

- WHERE
- JOIN
- ORDER BY
- GROUP BY

---

# Composite Index

Example:

```sql
CREATE INDEX idx_department_salary
ON employees(department_id, salary);
```

Sorted by:

```text
department_id
    ↓
salary
```

---

# Leftmost Prefix Rule

Index:

```text
(department_id, salary)
```

Works efficiently:

```sql
WHERE department_id = 2;
```

```sql
WHERE department_id = 2
AND salary > 100000;
```

Does NOT efficiently support:

```sql
WHERE salary > 100000;
```

---

# Query Planner

Creating an index **does not guarantee** PostgreSQL will use it.

Planner compares costs:

```text
Seq Scan

vs

Index Scan
```

Chooses the cheaper plan.

Small tables often use Seq Scan.

---

# EXPLAIN

Shows PostgreSQL's execution plan.

Check:

- Scan Type
- Index Used
- Index Condition
- Estimated Rows
- Cost

---

# EXPLAIN ANALYZE

Actually executes the query.

Additionally shows:

- Actual Rows
- Actual Time
- Execution Time
- Planning Time

---

# Scan Types

## Seq Scan

```text
Table

↓

Read every row
```

---

## Index Scan

```text
Index

↓

Find Row

↓

Read Table Row

↓

Return Result
```

Used when requested columns are not fully available in the index.

---

## Index Only Scan

```text
Index

↓

Return Result
```

No table lookup (when possible).

---

# Covering Index

```sql
CREATE INDEX idx_name_cover
ON employees(employee_name)
INCLUDE (salary);
```

Allows more queries to use Index Only Scan.

---

# Partial Index

Indexes only matching rows.

Example:

```sql
CREATE INDEX idx_active
ON employees(employee_name)
WHERE status='Active';
```

Useful when queries always filter the same subset.

---

# Expression Index

Indexes function results.

Example:

```sql
CREATE INDEX idx_lower_email
ON employees(LOWER(email));
```

Optimizes:

```sql
WHERE LOWER(email)=...
```

---

# Specialized Indexes

## B-Tree

Think:

```text
Find this value.
```

General purpose.

---

## GIN

Used when:

One row contains multiple searchable values.

Example:

```text
tags

['postgres','sql']
```

Concept:

```text
Value

↓

Multiple Rows
```

Good for:

- Arrays
- JSONB
- Full-text Search

---

## BRIN

Stores summaries of blocks, not every row.

Concept:

```text
Block

↓

Min Value

Max Value
```

Best for:

- Logs
- Time-series
- Huge ordered tables

Nearby rows should have similar values.

---

## GiST

Relationship-based searches.

Examples:

- Distance
- Overlap
- Containment
- Nearest Neighbor

Examples:

```text
Restaurant within 5 km

Booking overlaps

Polygon contains point
```

---

## Hash

Supports only:

```sql
=
```

Rarely used because B-tree also performs well for equality.

---

# Mental Models

B-tree

```text
Find this value.
```

GIN

```text
Which rows contain this value?
```

BRIN

```text
Which blocks may contain this value?
```

GiST

```text
How are these objects related?
(distance, overlap, containment)
```

---

# Important Corrections

❌ Index rearranges the table.

✅ Index is a separate sorted structure.

---

❌ PostgreSQL always uses an index.

✅ Planner chooses the cheapest execution plan.

---

❌ Composite index works for every column.

✅ Composite index follows the Leftmost Prefix Rule.

---

❌ Index Only Scan always happens when selecting indexed columns.

✅ PostgreSQL may still perform Index Scan due to visibility checks.

---

# Important Takeaways

- Indexes improve reads but slow writes.
- Verify optimization using `EXPLAIN ANALYZE`.
- B-tree is the default and most commonly used index.
- Composite indexes depend on column order.
- Choose indexes based on query patterns, not columns.
- GIN → Arrays / JSONB / Full-text Search.
- BRIN → Huge ordered datasets.
- GiST → Spatial, ranges, overlap, nearest-neighbor.