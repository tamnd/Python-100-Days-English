"""
The three pillars of object-oriented programming: encapsulation, inheritance, and polymorphism.
This file implements a simple monthly payroll system.
"""
from abc import ABCMeta, abstractmethod


class Employee(metaclass=ABCMeta):
    """Employee (abstract base class)."""

    def __init__(self, name):
        self.name = name

    @abstractmethod
    def get_salary(self):
        """Compute the monthly salary."""
        pass


class Manager(Employee):
    """Department manager."""

    def get_salary(self):
        return 15000.0


class Programmer(Employee):
    """Programmer."""

    def __init__(self, name, working_hour=0):
        self.working_hour = working_hour
        super().__init__(name)

    def get_salary(self):
        return 200.0 * self.working_hour


class Salesman(Employee):
    """Salesperson."""

    def __init__(self, name, sales=0.0):
        self.sales = sales
        super().__init__(name)

    def get_salary(self):
        return 1800.0 + self.sales * 0.05


class EmployeeFactory():
    """Factory for employee objects."""

    @staticmethod
    def create(emp_type, *args, **kwargs):
        """Create one employee."""
        emp_type = emp_type.upper()
        emp = None
        if emp_type == 'M':
            emp = Manager(*args, **kwargs)
        elif emp_type == 'P':
            emp = Programmer(*args, **kwargs)
        elif emp_type == 'S':
            emp = Salesman(*args, **kwargs)
        return emp
