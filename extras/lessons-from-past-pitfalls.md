## Pitfalls We Ran Into Over the Years

This note collects subtle Python pitfalls that easily confuse learners.

### Pitfall 1: Integer Comparison

It explains the difference between:

- `==`: value equality
- `is`: identity comparison

It then uses CPython’s small-integer caching behavior to show why `is` can produce surprising results with integers.

### Pitfall 2: Nested Lists

The note also covers the classic nested-list trap where repeated inner lists may refer to the same object, causing unexpected shared updates.

The overall lesson is that Python often looks simple on the surface, but object identity and shared references still matter.
