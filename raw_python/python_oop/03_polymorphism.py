class Vehicle:
    def move(self):
        print("Vehicle is moving")
    
class Car(Vehicle):
    def move(self):
        print("Driving on road")

class Bike(Vehicle):
    def move(self):
        print("Riding on road")

class Boat(Vehicle):
    def move(self):
        print("Sailing on water")

class Plane(Vehicle):
    def move(self):
        print("Flying in the sky")


def main():

    vehicles = [Car(), Bike(), Boat(), Plane()]
    for vehicle in vehicles:
        vehicle.move()

if __name__ == "__main__":
    main()