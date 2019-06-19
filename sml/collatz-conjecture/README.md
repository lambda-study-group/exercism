# Collatz Conjecture

The Collatz Conjecture or 3x+1 problem can be summarized as follows:

Take any positive integer n. If n is even, divide n by 2 to get n / 2. If n is
odd, multiply n by 3 and add 1 to get 3n + 1. Repeat the process indefinitely.
The conjecture states that no matter which number you start with, you will
always reach 1 eventually.

Given a number n, return the number of steps required to reach 1.

## Examples

Starting with n = 12, the steps would be as follows:

- 12
- 6
- 3
- 10
- 5
- 16
- 8
- 4
- 2
- 1

Resulting in 9 steps. So for input n = 12, the return value would be 9.

## Loading your exercise implementation in PolyML

```
$ poly --use collatz-conjecture.sml
```

Or:

```
$ poly
> use "collatz-conjecture.sml";
```

## Running the tests

```
$ poly -q --use test.sml
```

## Feedback, Issues, Pull Requests

The [exercism/sml](https://github.com/exercism/sml) repository on
GitHub is the home for all of the Standard ML exercises.

If you have feedback about an exercise, or want to help implementing a new
one, head over there and create an issue. We'll do our best to help you!

## Source

An unsolved problem in mathematics named after mathematician Lothar Collatz [https://en.wikipedia.org/wiki/3x\_%2B_1_problem](https://en.wikipedia.org/wiki/3x_%2B_1_problem)

## Submitting Incomplete Solutions

It's possible to submit an incomplete solution so you can see how others have completed the exercise.
