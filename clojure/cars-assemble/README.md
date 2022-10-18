# Cars, Assemble!

Welcome to Cars, Assemble! on Exercism's Clojure Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

Numbers in Clojure include:

- Integers: numbers with no digits behind the decimal separator (whole numbers). Examples are `-6`, `0`, `1`, `25`, `976` and `500000`.
- Floating-point numbers: numbers with zero or more digits behind the decimal separator. Examples are `-2.4`, `0.1`, `3.14`, `16.984025` and `1024.0`.

Two common numeric types are `int` and `float`. An `int` is a 32-bit integer and a `float` is a 64-bit floating-point number.

Arithmetic is done using the standard arithmetic operators. Numbers can be compared using the standard numeric comparison operators and the equality (`=`) and inequality (`<>`) operators.

In this exercise you must conditionally execute logic. A common way to do this in Clojure is by using `cond`:

```clojure
(cond (= x 5) "Expression to evaluate when x equals 5"
      (> x 7) "Expression to evaluate when x is greater than 7"
      :else   "Expression to evaluate in all other cases")
```

## Instructions

In this exercise you'll be writing code to analyze the production of an assembly line in a car factory. The assembly line's speed can range from `0` (off) to `10` (maximum).

At its lowest speed (`1`), `221` cars are produced each hour. The production increases linearly with the speed. So with the speed set to `4`, it should produce `4 * 221 = 884` cars per hour. However, higher speeds increase the likelihood that faulty cars are produced, which then have to be discarded. The following table shows how speed influences the success rate:

- `0`: 0% success rate.
- `1` to `4`: 100% success rate.
- `5` to `8`: 90% success rate.
- `9`: 80% success rate.
- `10`: 77% success rate.

You have two tasks.

## 1. Calculate the production rate per hour

Implement the `production-rate` function to calculate the assembly line's production rate per hour, taking into account its success rate:

```clojure
(production-rate 6)
;;=> 1193.4
```

Note that the value returned is a `double`.

## 2. Calculate the number of working items produced per minute

Implement the `working-items` function to calculate how many working cars are produced per minute:

```clojure
(working-items 6)
;;=> 19
```

Note that the value returned is an `int`.

## Source

### Created by

- @porkostomus