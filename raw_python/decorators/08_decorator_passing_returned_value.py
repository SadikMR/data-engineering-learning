def logger(data):
    print(f"Loaded {data} rows")

def decorator(func):

    def wrapper():
        rows = func()

        logger(rows)

        return rows

    return wrapper

@decorator
def count_rows():
    print("Reading CSV...")
    return 500

count_rows()