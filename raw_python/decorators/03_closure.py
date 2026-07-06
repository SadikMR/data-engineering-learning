"""
Lesson 03: Closures

Topics:
- Nested functions
- Returning functions
- Closures

Key Idea:
A closure is a function that remembers variables from
its outer function even after the outer function has finished.
"""


def outer(name):

    def inner():
        print(f"Hello {name}")

    return inner


def main():
    greet_murad = outer("Murad")
    greet_alice = outer("Alice")

    print(greet_murad)
    print(greet_alice)

    greet_murad()
    greet_alice()


if __name__ == "__main__":
    main()
