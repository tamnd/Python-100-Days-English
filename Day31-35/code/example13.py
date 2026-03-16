from example12 import EmployeeFactory


def main():
    """Program entry point."""
    emps = [
        EmployeeFactory.create('M', 'Cao Cao'),
        EmployeeFactory.create('P', 'Xun Yu', 120),
        EmployeeFactory.create('P', 'Guo Jia', 85),
        EmployeeFactory.create('S', 'Dian Wei', 123000),
    ]
    for emp in emps:
        print('%s: %.2f yuan' % (emp.name, emp.get_salary()))


if __name__ == '__main__':
    main()
