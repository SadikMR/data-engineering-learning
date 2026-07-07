"""
Python Built-in Decorators (Basic Notes)

These are the most common decorators in production Python.
The goal of this file is to remember the basic idea, not every detail.
"""

from dataclasses import dataclass
from functools import lru_cache, cached_property


# @staticmethod

class Validator:
    """
    Utility method.

    - Doesn't use self
    - Doesn't use cls
    - Behaves like a normal function inside a class
    """

    @staticmethod
    def is_positive(value: int) -> bool:
        return value > 0


# @classmethod
class Employee:
    """
    Class method.

    - Receives the class (cls)
    - Commonly used as an alternative constructor
    """

    company = "Google"

    @classmethod
    def show_company(cls):
        print(cls.company)


# @dataclass
@dataclass
class Revenue:
    """
    Data container.

    Automatically generates:
    - __init__()
    - __repr__()
    - __eq__()
    """

    order_id: int
    amount: float


# @property
class Product:
    """
    Computed attribute.

    Access like:
        obj.total_price

    instead of:
        obj.total_price()
    """

    def __init__(self, price: float):
        self.price = price

    @property
    def total_price(self) -> float:
        return self.price * 1.15


# @lru_cache
@lru_cache
def square(x: int) -> int:
    """
    Caches function results.

    Same input -> reuse previous result.
    Best for expensive pure functions.
    """
    print("Calculating...")
    return x * x


# @cached_property
class Report:
    """
    Cached computed attribute.

    - First access -> calculate
    - Later accesses -> reuse stored value
    """

    @cached_property
    def summary(self):
        print("Generating summary...")
        return {"total_revenue": 100000}


if __name__ == "__main__":
    print("=== @staticmethod ===")
    print(Validator.is_positive(10))

    print("\n=== @classmethod ===")
    Employee.show_company()

    print("\n=== @dataclass ===")
    revenue = Revenue(1, 1500.0)
    print(revenue)

    print("\n=== @property ===")
    product = Product(100)
    print(product.total_price)

    print("\n=== @lru_cache ===")
    print(square(5))
    print(square(5))  # Cached

    print("\n=== @cached_property ===")
    report = Report()
    print(report.summary)
    print(report.summary)  # Cached