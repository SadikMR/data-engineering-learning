"""
Lesson 02: Higher-Order Functions

Topics:
- Functions are first-class objects
- Passing functions as arguments
- Function references
- Calling functions

Key Idea:
greet   -> Function object
greet() -> Execute the function
"""


def greet():
    print("Hello")


def goodbye():
    print("Goodbye")


# Higher-order function
def execute(func):
    print("Before")
    func()
    print("After\n")


def main():
    # Pass function objects
    execute(greet)
    execute(goodbye)

    # Functions are objects
    print(greet)
    print(goodbye)

    # Assign function to another variable
    say_hello = greet
    say_hello()

    # Both variables reference the same function
    print(greet == say_hello)


if __name__ == "__main__":
    main()