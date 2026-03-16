## Algorithm Primer Series 2: Backtracking and Recursion

This lecture continues the algorithm series with recursion and backtracking.

### Recursion

Recursion means defining or solving something in terms of itself.

Examples used in the lecture:

- self-referential stories
- recursive factorial definition
- recursive staircase-counting problem

Important points when writing recursive functions:

1. base case: when recursion stops
2. recurrence relation: how the current state depends on previous states

The lecture also notes that Python limits recursion depth by default, and shows how to adjust it with `sys.setrecursionlimit`.

### Backtracking

Backtracking is a structured form of brute-force search. It builds candidate solutions step by step and abandons branches as soon as they can no longer lead to a valid answer.

Classic examples discussed:

- maze solving
- knight’s tour
- eight queens

The main lesson is that recursion is a useful tool, but not always the best tool. If a cleaner iterative or optimized approach exists, prefer that instead of using recursion out of habit.
