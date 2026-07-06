"""
This is a simple example of inheritance in Python.
We have a base class Employee and a derived class DataEngineer that inherits from Employee.
Child class overrides the work() method of the parent class to provide specific implementation for DataEngineer.
Child Class using super() to call the constructor of the parent class to initialize the inherited attributes.
child class using give_raise() method of the parent class to increase the salary of the employee.
"""


class Employee:
    company_name = "W3 Engineers Ltd."
    
    def __init__(self, employee_id, name, department, salary):
        self.employee_id = employee_id
        self.name = name
        self.department = department
        self.salary = salary

    def display_info(self):
        print(f"Employee ID: {self.employee_id}")
        print(f"Name: {self.name}")
        print(f"Department: {self.department}")
        print(f"Salary: ${self.salary:.2f}")
        print(f"Company: {Employee.company_name}")

    def give_raise(self, amount):
        self.salary += amount

    def work(self):
        print("Employee is working")

class DataEngineer(Employee):
    def __init__(self, employee_id, name, department, salary, programming_language):
        super().__init__(employee_id, name, department, salary)
        self.programming_language = programming_language

    def work(self):
        print("Building ETL pipeline using python")


def main():
    print("Employee:")
    employee = Employee(101, "Raihan", "Software", 10000)
    employee.display_info()
    employee.work()

    print("Data Engineer")
    data_engineer = DataEngineer(102, "Sadik", "Data", 10000, "python")
    data_engineer.display_info()
    data_engineer.work()

    print("Data Engineer Mahmud:")
    data_engineer_mahmud = DataEngineer(102, "Mahmud", "Data", 9500, "Python")
    data_engineer_mahmud.give_raise(1500)
    data_engineer_mahmud.display_info()

if __name__ == "__main__":
    main()