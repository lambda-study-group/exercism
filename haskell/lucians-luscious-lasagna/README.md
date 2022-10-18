# Lucian's Luscious Lasagna

Welcome to Lucian's Luscious Lasagna on Exercism's Haskell Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Constants and functions

Haskell programs are composed of definitions and expressions.

A constant value is defined with `name = expression`.

```haskell
five = 5

six = 3 + 3
```

Functions are defined with `name parameters... = expression`, parameters being only separated by space.

```haskell
add number1 number2 = number1 + number2
```

Invoking a function is also an expression and is done by specifying its name and passing arguments for each of the function's parameters, separated by spaces, just like for function definitions.

```haskell
five = add 2 3
```

Parentheses can be used to specify the order of evaluation of an expression.

```haskell
six = add 2 (1 * 4)

twelve = add 2 1 * 4
```

## Indentation / significant whitespace

Haskell uses whitespaces and indentation to specify code boundaries.
***Code which is part of some expression should be indented further in than the beginning of that expression.***

- Module, import, and top-level function definitions must start at the leftmost column.
- If an expression is split into multiple lines, the code that is part of that expression must be indented under that expression with at least one space.
- Parts of the expression that are grouped together should be indented with equal numbers of spaces.

```haskell
-- A function split over multiple lines, so subsequent lines must be indented
add number1 number2 =
    number1 + number2
```

https://en.wikibooks.org/wiki/Haskell/Indentation

## Modules

Modules export functions.
That means you can use the functions the module makes available in its export statement.
A module can also define functions only for internal use.
By default, functions that are not explicitly exported cannot be used from outside the module.

At the beginning of a module, we specify the module name.
If we have a file called Calculator.hs, then we should name our module Calculator.
Then, we specify the functions that it exports and after that, we can start writing the functions.
So we'll start with this.

```haskell
module Calculator ( add ) where
```

https://learnyouahaskell.github.io/modules#making-our-own-modules

## Comments

A comment is some text within the Haskell file that is not interpreted as code.
It is mainly intended to be read by yourself and other programmers.
There is a lightweight syntax for single line comments, based on double dashes.
Multiline comments are also possible with the `{-` and `-}` pair of opening and closing delimiters.

```haskell
-- a single line comment
-- another single line comment

{- a multiline comment
   spanning multiple lines
-}
```

### Credits

This exercise introduction borrows liberally from [Learn You a Haskell for Great Good!](https://learnyouahaskell.github.io/chapters),
under [Creative Commons Attribution-Noncommercial-Share Alike 3.0 Unported License](https://creativecommons.org/licenses/by-nc-sa/3.0/)

## Instructions

In this exercise you're going to write some code to help you cook a brilliant lasagna from your favorite cooking book.

You have three tasks, all related to the time spent cooking the lasagna.

## 1. Define the expected oven time in minutes

Define the `expectedMinutesInOven` constant to check how many minutes the lasagna should be in the oven. According to the cooking book, the expected oven time in minutes is 40:

```Haskell
expectedMinutesInOven
    --> 40
```

## 2. Calculate the preparation time in minutes

Define the `preparationTimeInMinutes` function that takes the number of layers you added to the lasagna as a parameter and returns how many minutes you spent preparing the lasagna, assuming each layer takes you 2 minutes to prepare.

```Haskell
preparationTimeInMinutes 3
    --> 6
```

## 3. Calculate the elapsed time in minutes

Define the `elapsedTimeInMinutes` function that takes two parameters: the first parameter is the number of layers you added to the lasagna, and the second parameter is the number of minutes the lasagna has been in the oven. The function should return how many minutes you've worked on cooking the lasagna, which is the sum of the preparation time in minutes, and the time in minutes the lasagna has spent in the oven at the moment.

```Haskell
elapsedTimeInMinutes 3 20
    --> 26
```

## Source

### Created by

- @pwadsworth