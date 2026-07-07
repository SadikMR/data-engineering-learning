class Engine:
    def start(self) -> None:
        print("Engine started")


class Car:
    def __init__(self) -> None:
        self.engine = Engine()

    def drive(self) -> None:
        self.engine.start()
        print("Car is moving")


car = Car()
car.drive()