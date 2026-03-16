> Original content credit: adapted from [jackfrued/Python-100-Days](https://github.com/jackfrued/Python-100-Days).
> This repository is an English translation of that original project.

## Python - 100 Days from Beginner to Master

> **Author**: Luo Hao
>
> **Note**: If GitHub access is slow, you can follow my Zhihu account ([**Python-Jack**](https://www.zhihu.com/people/jackfrued)). The column [**Learn Python from Scratch**](https://zhuanlan.zhihu.com/c_1216656665569013760), which corresponds to the first 20 days of this project, is especially suitable for beginners. Other columns such as [**Data Thinking and Statistical Thinking**](https://www.zhihu.com/column/c_1620074540456964096), [**Data Analysis with Python**](https://www.zhihu.com/column/c_1217746527315496960), and [**An AI Journey at a Moment's Notice**](https://www.zhihu.com/column/c_1628900668109946880) are also being updated continuously. You are welcome to follow, like, and comment. The free QQ study group is already overcrowded, and the messages are too noisy for me to reply one by one. If you want to study together with daily check-ins or need paid consultation, you can join the paid study group. New users can scan the QR code below, complete the payment, add my personal WeChat (`jackfrued`), and I will invite you to the paid learning and check-in group. When adding me on WeChat, please include your name and your needs in the note. I will provide whatever help I can.
>
> <img src="res/pay_qr_code.png" style="zoom:32%;">
>
> Some of the videos corresponding to this project have also been published on [Bilibili](https://space.bilibili.com/1177252794). If you are interested, please like, support, and follow the channel.

### Python Application Areas and Career Development

Simply put, Python is an "elegant", "explicit", and "simple" programming language.

- The learning curve is gentle, and even non-specialists can get started.
- It is open source and has a powerful ecosystem.
- It is an interpreted language with excellent cross-platform portability.
- It is a dynamically typed language that supports both object-oriented and functional programming.
- Its code style is highly standardized and very readable.

Python is useful in all of the following areas.

- Backend development - Python / Java / Go / PHP
- DevOps - Python / Shell / Ruby
- Data collection - Python / C++ / Java
- Quantitative trading - Python / C++ / R
- Data science - Python / R / Julia / Matlab
- Machine learning - Python / R / C++ / Julia
- Automated testing - Python / Shell

As a Python developer, depending on your interests and career planning, there are many employment directions you can choose from.

- Python backend engineer (servers, cloud platforms, data APIs)
- Python operations engineer (automated operations, SRE, DevOps)
- Python data analyst (data analysis, business intelligence, digital operations)
- Python data scientist (machine learning, deep learning, algorithm specialist)
- Python crawler engineer (this track is not recommended!!!)
- Python test engineer (automated testing, test development)

> **Note**: At present, the **data science track is extremely popular**, because both the internet industry and traditional industries have already accumulated massive amounts of data. Every industry needs data scientists to discover more business value from existing data and provide data support for business decisions. This is what people call data-driven decision-making.

Several suggestions for beginners:

- **Make English your working language.**
- **Practice makes perfect.**
- **All experience comes from the mistakes you've made.**
- **Learn to share instead of only asking others for help.**
- **Embrace AI to boost your productivity.**

### Day01~20 - Python Language Basics

#### Day01 - [Getting Started with Python](./Day01-20/01.getting-started-with-python.md)

1. Introduction to Python
   - A brief history of Python
   - Pros and cons of Python
   - Python application areas
2. Installing the Python environment
   - Windows environment
   - macOS environment

#### Day02 - [The First Python Program](./Day01-20/02.first-python-program.md)

1. Tools for writing code
2. Hello, world
3. Commenting your code

#### Day03 - [Variables in Python](./Day01-20/03.variables-in-python.md)

1. Some basic common sense
2. Variables and types
3. Variable naming
4. Using variables

#### Day04 - [Operators in Python](./Day01-20/04.operators-in-python.md)

1. Arithmetic operators
2. Assignment operators
3. Comparison operators and logical operators
4. Applications of operators and expressions
   - Fahrenheit and Celsius conversion
   - Calculating the circumference and area of a circle
   - Determining whether a year is a leap year

#### Day05 - [Branching](./Day01-20/05.branching.md)

1. Building branching structures with `if` and `else`
2. Building branching structures with `match` and `case`
3. Applications of branching structures
   - Evaluating a piecewise function
   - Converting percentage grades into grade levels
   - Calculating the perimeter and area of a triangle

#### Day06 - [Loops](./Day01-20/06.loops.md)

1. `for-in` loops
2. `while` loops
3. `break` and `continue`
4. Nested loop structures
5. Applications of loops
   - Determining prime numbers
   - Greatest common divisor
   - Guess-the-number game

#### Day07 - [Branching and Loops in Practice](./Day01-20/07.branching-and-loops-in-practice.md)

1. Example 1: Prime numbers within 100
2. Example 2: Fibonacci sequence
3. Example 3: Finding narcissistic numbers
4. Example 4: The hundred-chickens problem
5. Example 5: The CRAPS gambling game

#### Day08 - [Common Data Structure: List - 1](./Day01-20/08.lists-1.md)

1. Creating lists
2. List operations
3. Traversing elements

#### Day09 - [Common Data Structure: List - 2](./Day01-20/09.lists-2.md)

1. List methods
   - Adding and deleting elements
   - Element positions and frequencies
   - Sorting and reversing elements
2. List comprehensions
3. Nested lists
4. Applications of lists

#### Day10 - [Common Data Structure: Tuple](./Day01-20/10.tuples.md)

1. Tuple definition and operations
2. Packing and unpacking
3. Swapping variable values
4. Comparing tuples and lists

#### Day11 - [Common Data Structure: String](./Day01-20/11.strings.md)

1. Defining strings
   - Escape characters
   - Raw strings
   - Special character representations
2. String operations
   - Concatenation and repetition
   - Comparison operations
   - Membership operations
   - Getting string length
   - Indexing and slicing
3. Traversing characters
4. String methods
   - Case conversion
   - Search operations
   - Property checks
   - Formatting
   - Trimming
   - Replacing
   - Splitting and joining
   - Encoding and decoding
   - Other methods

#### Day12 - [Common Data Structure: Set](./Day01-20/12.sets.md)

1. Creating sets
2. Variables of elements
3. Set operations
   - Membership operations
   - Binary operations
   - Comparison operations
4. Set methods
5. Immutable sets

#### Day13 - [Common Data Structure: Dictionary](./Day01-20/13.dictionaries.md)

1. Creating and using dictionaries
2. Dictionary operations
3. Dictionary methods
4. Applications of dictionaries

#### Day14 - [Functions and Modules](./Day01-20/14.functions-and-modules.md)

1. Defining functions
2. Function parameters
   - Positional arguments and keyword arguments
   - Default values for arguments
   - Variable-length arguments
3. Managing functions with modules
4. Modules and functions in the standard library

#### Day15 - [Function Practice](./Day01-20/15.function-practice.md)

1. Example 1: Random verification code
2. Example 2: Determining prime numbers
3. Example 3: Greatest common divisor and least common multiple
4. Example 4: Data statistics
5. Example 5: Random double-color ball number selection

#### Day16 - [Advanced Function Usage](./Day01-20/16.advanced-functions.md)

1. Higher-order functions
2. Lambda functions
3. Partial functions

#### Day17 - [Advanced Function Applications](./Day01-20/17.advanced-function-applications.md)

1. Decorators
2. Recursive calls

#### Day18 - [Introduction to Object-Oriented Programming](./Day01-20/18.object-oriented-programming-intro.md)

1. Classes and objects
2. Defining classes
3. Creating and using objects
4. Initialization methods
5. The pillars of object orientation
6. Object-oriented cases
   - Example 1: A digital clock
   - Example 2: A point on a plane

#### Day19 - [Advanced Object-Oriented Programming](./Day01-20/19.object-oriented-programming-advanced.md)

1. Visibility and property decorators
2. Dynamic attributes
3. Static methods and class methods
4. Inheritance and polymorphism

#### Day20 - [Object-Oriented Programming in Practice](./Day01-20/20.object-oriented-programming-in-practice.md)

1. Poker game
2. Payroll settlement system

This README is being revised toward a more literal translation of the original project structure and wording. The remaining sections will be aligned in the same style.
