# Series

Welcome to Series on Exercism's Haskell Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

Given a string of digits, output all the contiguous substrings of length `n` in
that string in the order that they appear.

For example, the string "49142" has the following 3-digit series:

- "491"
- "914"
- "142"

And the following 4-digit series:

- "4914"
- "9142"

And if you ask for a 6-digit series from a 5-digit string, you deserve
whatever you get.

Note that these series are only required to occupy *adjacent positions*
in the input; the digits need not be *numerically consecutive*.

To complete this exercise you need to implement the function `slices`,
that takes a *text* and returns the subsequences of digits with a
specified size:

If it is your first time solving this exercise, it is recommended that you
stick to the provided signature:

```haskell
slices :: Int -> String -> [[Int]]
```

Later, it may be a good idea to revisit this problem and play with other data
types and libraries:

- `ByteString`, from package *bytestring*.
- `Sequence`, from package *containers*.
- `Text`, from package *text*.
- `Vector`, from package *vector*.

The test suite was intentionally designed to accept almost any type signature
that makes sense, so you are encouraged to find the one you think is the best.

## Source

### Created by

- @etrepum

### Contributed to by

- @iHiD
- @kytrinyx
- @petertseng
- @ppartarr
- @rbasso
- @sshine
- @stevejb71
- @tejasbubane

### Based on

A subset of the Problem 8 at Project Euler - http://projecteuler.net/problem=8