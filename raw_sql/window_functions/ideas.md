# Window Functions

Unlike `GROUP BY`, which groups rows together and returns one row per group, window functions perform calculations (such as `AVG`, `SUM`, `COUNT`, etc.) while keeping every original row. The calculated value is attached to each row instead of collapsing the rows.

---

# OVER()

`OVER()` defines the window on which the function operates.

It can contain:
- `PARTITION BY` → divides rows into partitions (groups).
- `ORDER BY` → defines the processing order within each partition.
- `ROWS BETWEEN ...` → defines the window frame (which rows are included in the calculation).

---

# PARTITION BY

`PARTITION BY` divides the result set into independent partitions. Each partition is processed separately by the window function while preserving all original rows.

---

# ORDER BY in OVER()

`ORDER BY` inside `OVER()` sorts the rows for the window function's calculation. SQL processes the rows in that order and attaches the result back to the original rows.

This is different from the normal `ORDER BY`, which sorts the final query result.

---

# Aggregate Window Functions

Aggregate functions such as `SUM()`, `AVG()`, `COUNT()`, `MIN()`, and `MAX()` can be used as window functions to calculate values while preserving every row.

---

# ROW_NUMBER()

`ROW_NUMBER()` assigns a unique sequential number to each row based on the order specified in the `OVER()` clause. If `PARTITION BY` is used, numbering restarts from 1 within each partition.

---

# RANK()

`RANK()` assigns the same rank to rows with equal values based on the `ORDER BY` clause. If multiple rows share the same rank, the next rank is skipped, creating gaps.

Example:

```
1
2
2
4
```

---

# DENSE_RANK()

`DENSE_RANK()` is similar to `RANK()`, except it does not skip ranks after ties.

Example:

```
1
2
2
3
```

---

# LAG()

`LAG()` returns the value from a previous row within the same partition based on the specified ordering.

---

# LEAD()

`LEAD()` returns the value from the next row within the same partition based on the specified ordering.

---

# FIRST_VALUE()

`FIRST_VALUE()` returns the value of a specified column from the first row in the window after the rows have been ordered according to the `ORDER BY` clause.

The returned column does not have to be the same column used for sorting.

---

# LAST_VALUE()

`LAST_VALUE()` returns the value of a specified column from the last row in the current window frame after the rows have been ordered according to the `ORDER BY` clause.

By default, it returns the last value in the current frame, not necessarily the last row of the entire partition.

---

# NTILE(n)

`NTILE(n)` divides the ordered rows into **n** nearly equal-sized buckets (tiles).

---

# Window Frame (ROWS BETWEEN)

A window frame defines which rows inside a partition are included in the calculation.

Common frames:

- `UNBOUNDED PRECEDING AND CURRENT ROW` → Running total.
- `UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING` → Entire partition.
- `1 PRECEDING AND CURRENT ROW` → Previous row + current row (moving calculations).

---

# SQL Execution Order (Simplified)

```
FROM / JOIN
↓
WHERE
↓
GROUP BY
↓
HAVING
↓
Window Functions (OVER)
↓
SELECT
↓
ORDER BY
```

Since window functions are calculated after `WHERE`, they cannot be used directly in the `WHERE` clause. Use a CTE or subquery if you need to filter based on a window function result.