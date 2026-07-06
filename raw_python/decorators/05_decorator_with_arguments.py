"""
Lesson 05: Decorators with Arguments

Topics:
- *args (positional arguments)
- **kwargs (keyword arguments)
- Decorating any function

Key Idea:
Use *args and **kwargs so a decorator works with
functions having any number of arguments.
"""


def decorator(func):
    def wrapper(*args, **kwargs):
        print("Before")

        result = func(*args, **kwargs)

        print("After")

        return result

    return wrapper


@decorator
def greet(name):
    print(f"Hello {name}")


@decorator
def add(a, b):
    return a + b


def main():
    greet("Murad")

    total = add(10, 20)
    print(total)


if __name__ == "__main__":
    main()


"""
Expected Output

Before
Hello Murad
After

Before
After
30

"""