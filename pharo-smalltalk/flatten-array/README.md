# Flatten Array

Welcome to Flatten Array on Exercism's Pharo Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

Take a nested list and return a single flattened list with all values except nil/null.

The challenge is to write a function that accepts an arbitrarily-deep nested list-like structure and returns a flattened structure without any nil/null values.

For Example

input: [1,[2,3,null,4],[null],5]

output: [1,2,3,4,5]

Without using the built-in flattening method, you can derive your own, but you will need to differentiate between what is a collection and what is not. Alternatively, if you decide to use the built-in flattening methods, you will need to create a new Stream type to override incorrect behaviour.

## Source

### Created by

- @macta

### Based on

Interview Question - https://reference.wolfram.com/language/ref/Flatten.html