# Lilly's Lasagna

Welcome to Lilly's Lasagna on Exercism's Common Lisp Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

To define a global function in Common Lisp one uses the `defun` expression.
This expression takes as its first argument a list of parameters (an empty list means the function has no parameters).
This is followed by an optional documentation string (see below), then zero or more expressions which make up the "body" of the function.

Functions may have zero or more parameters.

```lisp
(defun no-args () (+ 1 1))

(defun add-one (x) (+1 x))

(defun add-nums (x y) (+ x y))
```

Calling a function is done by evaluating an expression with the symbol designating the function as the first element of the expression with the arguments to the function (if any) as the remaining items in the expression.

The value that a function evaluates to is the value of the last expression in the function body that was evaluated. 
All functions evaluate to a value.

```lisp
(add-nums 2 2) ;; => 4
```

Functions can also have, optionally, a documentation string (also called a 'docstring').
If provided it comes after the argument list but before the body of the function.
The documentation string can be accessed via `documentation`.

```lisp
(defun add-nums (x y) "Add X and Y together" (+ x y))

(documentation 'add-nums 'function) ;; => "Add X and Y together"

;; Note that if one provides a docstring but fails to provide a body
;; then the docstring is interpreted by Common Lisp as the body, not
;; the docstring
(defun no-body ())
(no-body) ;; => NIL

(defun mistake () "This is not a docstring")
(mistake) ;; => "This is not a docstring"
(documentation 'mistake 'function) ;; => NIL
```

## Instructions

Lilly the Lisp Alien is back and doing more cooking! This time they
are going to create Lisp Alien Lasagna which is not entirely unlike
Human Lasagna.

Lilly will need some functions written to help figure out the timing
of the cooking of the lasagna. And each one needs to have good
documentation so Lilly won't forget what each one does.

Can you help Lilly write functions to help them time the cooking of
the Lasagna?

## 1. Define the expected oven time in minutes

Define the `expected-time-in-oven` function that does not take any
parameters and returns how many minutes the lasagna should be in the
oven. According to the Lisp Alien tradition (just like Lilly's
parental-unit used to cook), the expected oven time in minutes is 337:

```lisp
(expected-time-in-oven) ;; => 337
```

## 2. Calculate the remaining oven time in minutes

Define the `remaining-minutes-in-oven` function that takes the actual
minutes the lasagna has been in the oven as a parameter and returns
how many minutes the lasagna still has to remain in the oven, based on
the expected oven time in minutes from the previous task.

```lisp
(remaining-minutes-in-oven 100) ;; => 237
```

## 3. Calculate the preparation time in minutes

Define the `preparation-time-in-minutes` function that takes the
number of layers Lilly added to the lasagna as a parameter and returns
how many minutes Lilly spent preparing the lasagna, assuming each
layer takes 19 minutes to prepare.

```lisp
(preparation-time-in-minutes 3) ;; => 57
```

## 4. Calculate the elapsed time in minutes

Define the `elapsed-time-in-minutes` function that takes two
parameters: the first parameter is the number of layers Lilly added to
the lasagna, and the second parameter is the number of minutes the
lasagna has been in the oven. The function should return how many
minutes Lilly has worked on cooking the lasagna, which is the sum of
the preparation time in minutes, and the time in minutes the lasagna
has spent in the oven at the moment.

```lisp
(elapsed-time-in-minutes 3 100) ;; => 157
```

## Source

### Created by

- @verdammelt