"""
Objective:
Implement a simple Employee Management System using Python
Object-Oriented Programming (OOP).

Requirements:
1. Create an Employee class.
2. Add a class attribute:
   - company_name = "W3 Engineers Ltd."

3. Add instance attributes:
   - employee_id
   - name
   - department
   - salary

4. Implement the following methods:
   - display_info()
       Display all employee information.
   - give_raise(amount)
       Increase the employee's salary.

5. Inside main():
   - Create at least two Employee objects.
   - Display their information.
   - Give one employee a salary raise.
   - Display the updated information.
   - Change the company name using the class.
   - Display all employees again to observe the change.

Topics Covered:
    Class
    Object
    Constructor (__init__)
    Instance Attributes
    Class Attributes
    Methods
    self
    Object Creation
    Method Calling
    Accessing Class Attributes
    Python main() function
    if __name__ == "__main__"
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


def main():
    emp1 = Employee(101, "Sadik", "Data Engineering", 75000)
    emp2 = Employee(102, "Mozammel", "Pestro", 80000)

    emp2.company_name = "Google"

    emp1.give_raise(5000)
    emp1.display_info()

    emp2.display_info()


if __name__ == "__main__":
    main()