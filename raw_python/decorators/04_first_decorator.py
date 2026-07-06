"""
Lesson 04: First Decorator

Topics:
- Decorators
- Wrapper functions
- @ syntax

Key Idea:
@decorator
is equivalent to

function = decorator(function)
"""


def decorator(func):

    def wrapper():
        print("Before")

        func()

        print("After")

    return wrapper


@decorator
def greet():
    print("Hello")


def main():
    greet()


if __name__ == "__main__":
    main()


"""
It's actually equivalent to:
def decorator(func):
    def wrapper():
        print("Before")

        func()

        print("After")

    return wrapper
    
def greet():
    print("Hello")

greet = decorator(greet)

def main():
    greet()
"""