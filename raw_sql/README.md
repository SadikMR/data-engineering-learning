# SQL Practice

## Start PostgreSQL (Docker)

```bash
docker compose up -d
```

## Connect to PostgreSQL

```bash
docker exec -it postgres psql -U postgres -d sql_practice
```

> Replace `postgres` with your container name if it's different.

## Execute a SQL File

Inside the `psql` prompt:

```sql
\i /sql/path/to/file.sql
```

Example:

```sql
\i /sql/cte/cte.sql
```

## Exit

```sql
\q
```
