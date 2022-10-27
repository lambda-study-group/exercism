# Logan's Numeric Partition

Welcome to Logan's Numeric Partition on Exercism's Common Lisp Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

Reducing is the repeated application of a function to each element of
a sequence and accumulating, in some way, the results. 
The function applied takes two parameters: the current accumulated value and the item to process. 
It must evaluate to the new accumulated value.

In Common Lisp the process is done with the `reduce` function.
In its simplest form it looks like:

`(reduce #'function-to-apply sequence :initial-value value)`

Notice that an initial value is provided - this will be the 'current accumulated value' that is passed into the function when the first element is processed.

Here is an example which adds the numbers of the list together starting with an initial value of 10:

`(reduce #'+ '(1 2 3 4) :initial-value 10) ; => 20`

Note that if the sequence is empty the function is never called and the form evaluates to the initial-value.

## Instructions

Logan the Lisp alien likes numbers and also like organizing.

They ask you to help them write a function that will take a list of numbers and produce a pair of two lists - the first is all the odd numbers, the second are all the even numbers.

## 1. Categorizing a number

First you'll need to create a function which takes a pair of two lists and a number and put that number into the correct sub-list depending on if it is odd or even:

```lisp
(categorize-number '((1) . (2)) 23) ; => ((23 1) . (2))
(categorize-number '((1) . (2)) 42) ; => ((1) . (42 2))
```

## 2. Categorizing lots of numbers

Now that function you can write a function which takes a list of numbers and categorizes them like you did above:

```lisp
(partition-numbers '(1 2 3 4))     ; => ((3 1) . (4 2))
(partition-numbers '(42 31 24 13)) ; => ((13 31) . (24 42))
```

## Source

### Created by

- @verdammelt