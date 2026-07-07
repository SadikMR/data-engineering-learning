class Phone:
    def call(self) -> None:
        print("Calling...")


class Camera:
    def take_photo(self) -> None:
        print("Taking photo...")

# A class that inherits from both Phone and Camera classes
class SmartPhone(Phone, Camera):
    pass


iphone = SmartPhone()

iphone.call()
iphone.take_photo()