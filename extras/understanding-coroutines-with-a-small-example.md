## A Small Example to Truly Understand Coroutines

This note uses a minimal example to explain coroutines intuitively.

The purpose is to show:

- what a coroutine is
- how control is yielded
- how multiple tasks cooperate without traditional threading

Coroutines become much easier to understand once you stop thinking of them as "magic async syntax" and start seeing them as controlled suspension and resumption of execution.
