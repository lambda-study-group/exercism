# Pizza Pi

Welcome to Pizza Pi on Exercism's Common Lisp Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

In Common Lisp, like many languages, numbers come in a few of types – two of the most basic are:

## Integers

Like many languages Common Lisp contains integers.
These are whole numbers without a decimal point (like `-6`, `0`, `25`, `1234`, etc.)

Common Lisp defines no limits on the magnitude of integers.
Integers can be arbitrarily large (or small if negative).

In general, if you are working with only whole numbers, you should prefer integers as they don't suffer from the same loss of precision as floating-point numbers do over many calculations.

## Floating Point Numbers

Like many languages, Common Lisp contains floating point numbers.
These are fractional or whole numbers including a decimal point (like `3.14`, `-1.7`, `99.99`, `2048.0`).

## Arithmetic

Common Lisp uses the standard arithmetic operators for most operations but is somewhat unique in using a "prefix-notation" as  opposed to the more familiar "infix-notion".

More visually:

```lisp
;; Infix-notation (non-lisp languages)
1 + 2 + 3 + 4 + 5 ; => 15
;; Prefix-notation (lisp languages)
(+ 1 2 3 4 5) ; => 15
```

While prefix notion turns some operations like `2 + 2` into the somewhat unfamiliar `(+ 2 2)` form, it makes it much easier to operate on more than one number at a time.

## Basic Math

Common Lisp has all the typical functions: `+`, `-`, `*`, `/` for addition, subtraction, multiplication and division.

When considering division one may want to know the remainder of a division, that is done by the `mod` (for modulo) function which takes a number and a divisor as arguments: 

```lisp
(mod 4 2)  ; => 0
(mod 2 4)  ; => 2
(mod 10 3) ; => 1
```

## Comparing Numbers

Finally, you may find it useful to compare different numbers using functions like `=` (equal), `/=` (not equal to), and `>=` (greater than or equal to).
When these comparisons are true (as in `(= 1 1)`), they return `T` and when they aren't (as in `(> 0 1)`), they return `NIL`.

## Instructions

Lilly, a culinarily-inclined Lisp Alien, wants to throw a pizza party for themselves and some friends but, wanting to make the most of their ingredients, would like to know exactly how much of each component they'll need before starting.

To solve this problem, Lilly has drafted a program to automate some of the planning but needs your help finishing it.
Will you help Lilly throw the proportionally perfect pizza party?

## 1. A Dough Ratio

First things first, every great pizza starts with a delicious dough!
Lilly is a fan of thin, crispy pizzas with a thicker crust, so the amount of dough needed for the middle of the pizza remains relatively constant (200g) but the amount needed for the crust increases as the pizza's size does.
Every 20cm of crust requires 45g of dough.

Lilly is looking to write a function that takes the number of pizzas to make and their diameters then returns the exact amount of dough (to the nearest gram) that they'll need.
For example, to make 4 pizzas 30cm in diameter:

```lisp
(dough-calculator 4 30) ; => 1648
```

Helpfully, Lilly has worked out the following equation for calculating grams of dough (g) from the number of pizzas (n) and their diameters (d): 

`g = n * (((45 * pi * d) / 20) + 200)`

## 2. A Splash of Sauce

Lilly is astonishingly meticulous when it comes to their sauce application and always applies exactly 3ml of sauce to every 10 square centimeters of pizza.
Ironically, the size of their pizzas can be incredibly inconsistent.
Lilly needs your help defining a function that calculates the pizza size (the diameter) from the amount of sauce applied.
For example, given Lilly has used 250ml of sauce:

```lisp
(size-from-sauce 250) ; => 32.57
```

For this task, Lilly has prepped the following equation relating milliliters of sauce applied (s) to the pizza diameter (d): 

`d = square-root of ((40 * s) / (3 * pi))`

## 3. Some Cheese, Please

On Lilly's planet, all cheese comes in perfect cubes and is sold by size.
(What were you expecting? This is an alien planet after all...)
Your task is to help Lilly calculate how many pizzas they can make using any given cheese cube.
Mozzarella cheese has a density of 0.5 grams per cubic centimeter and every pizza needs 3 grams of cheese per square centimeter.
Given the side-length of some cheese cube and the pizzas' diameter, calculate the number of pizzas that can be made (always rounded down).
For example, given a 25x25x25cm cheese cube and pizzas 30cm in diameter:

```lisp
(pizzas-per-cube 25 30) ; => 3
```

Once again, Lilly has come to the rescue with an equation calculating the number of pizzas (n) of some diameter (d) that can be made from a cheese cube of a side-length (l):

`n = (2 * (l^3))/(3 * pi * (d^2))`

## 4. A Fair Share

Finally, Lilly wants to be sure that their pizzas (each made up of 8 slices) can be evenly divided between their friends.
Your task is to define a function that takes a number of pizzas and number of friends then returns `T` if the pizza can be evenly divided between friends and `NIL` otherwise.
For example:

```lisp
;; For splitting 3 pizzas between 4 friends
(fair-share-p 3 4) ; => T
;; For splitting 2 pizzas between 3 friends
(fair-share-p 2 3) ; => NIL
```

## Source

### Created by

- @TheLostLambda
- @verdammelt