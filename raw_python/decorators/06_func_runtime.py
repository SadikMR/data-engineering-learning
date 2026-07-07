import time


def timer(func):
    def wrapper(*args, **kwargs):
        start_time = time.time()

        result = func(*args, **kwargs)

        end_time = time.time()

        print(f"Execution time: {end_time - start_time:.4f} seconds")

        return result

    return wrapper

@timer
def slow_function():
    for _ in range(10000000):
        pass
    return "Function completed"


print(slow_function())