from typing import Any


class BasePipeline:
    def connect(self) -> None:
        print("Connecting to the data source...")

class CSVPipeline(BasePipeline):
    def extract(self) -> list[dict[str, Any]]:
        print("Extracting data from CSV file...")
        return [
            {"product": "Laptop", "price": 1200},
            {"product": "Mouse", "price": 30},
        ]

class SalesPipeline(CSVPipeline):
    def transform(self, sales: list[dict[str, Any]]) -> list[dict[str, Any]]:
        print("Transforming sales data...")
        return [{**row, "price_with_tax": row["price"] * 1.1} for row in sales]

pipeline = SalesPipeline()

pipeline.connect()
sales = pipeline.extract()
result = pipeline.transform(sales)

print(result)