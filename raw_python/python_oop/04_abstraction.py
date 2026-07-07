"""
Lesson 06: Abstraction

Topics:
- Abstract Class
- Abstract Method
- Enforcing implementation

Key Idea:
An abstract class defines WHAT should be done,
not HOW it should be done.
"""

from abc import ABC, abstractmethod


class DataSource(ABC):

    @abstractmethod
    def load(self) -> None:
        pass


class CSVSource(DataSource):

    def load(self) -> None:
        print("Loading CSV file")


class JSONSource(DataSource):

    def load(self) -> None:
        print("Loading JSON file")


def main() -> None:
    csv: DataSource = CSVSource()
    json: DataSource = JSONSource()

    csv.load()
    json.load()


if __name__ == "__main__":
    main()


"""
Key Takeaways

- An abstract class cannot be instantiated.
- Child classes must implement all abstract methods.
- Abstraction defines a common contract.
- Inheritance reuses code.
- Polymorphism uses the common contract.
"""