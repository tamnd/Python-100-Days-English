"""
Variable scope and Python's variable lookup order.
LEGB: Local --> Embedded --> Global --> Built-in
global - declare or define a global variable
nonlocal - use a variable from an enclosing scope
"""
x = 100


def foo():
    global x
    x = 200

    def bar():
        x = 300
        print(x)

    bar()
    print(x)


foo()
print(x)
