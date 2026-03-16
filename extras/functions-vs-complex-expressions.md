## Use a Function or a Complex Expression?

This essay explores a common readability question: should you pack logic into a single clever expression, or should you extract a helper function?

Using the "maximum of three numbers" example, it shows how code can evolve from:

- explicit multi-line logic
- to ternary expressions
- to overly compressed one-liners
- to a cleaner helper function

The core lesson is simple:

- shorter is not always clearer
- helper functions often improve readability and reuse

Python’s built-in `max` solves the example directly, but the broader design lesson remains useful.
