# Lilly's Lasagna Leftovers

Welcome to Lilly's Lasagna Leftovers on Exercism's Common Lisp Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

In Common Lisp a function's argument list is known as a ['lambda list'][lambda-list].
A lambda list can can have arguments of different types.
These different types are designated with the use of ['lambda list keywords'][lambda-list-keyword] which all begin with `&`.
The most commonly used types are optional, keyword and rest arguments types.
Every parameter in the lambda list after a particular lambda list keyword is will be of that type.
A lambda list keyword can only be used once in a lambda list.

Lambda lists are also used in other constructs which will be discussed later such as destructuring and macros.

[lambda-list]: http://www.lispworks.com/documentation/HyperSpec/Body/26_glo_l.htm#lambda_list
[lambda-list-keyword]: http://www.lispworks.com/documentation/HyperSpec/Body/26_glo_l.htm#lambda_list_keyword

## Optional Parameters

In Common Lisp a function can have some arguments are are optional.
These are designated in the lambda list by `&optional` lambda list keyword.
A parameter will be bound to the value `nil` if it is not specified.
If there are several optional parameters they are bound in order.
Default values can be specified for optional parameters.
Finally a symbol an be specified for each optional parameter which will be bound to true or false depending on whether that parameter was supplied by the caller of the function (this is referred to as the "supplied-p parameter").

```lisp
(defun optional-parameters (&optional x (y 'default) (z nil z-supplied-p))
  (list x y (if z-supplied-p (list :z-was-supplied z)
                             (list :z-was-not-supplied z))))

(optional-parameters)          ; => (NIL DEFAULT (:Z-WAS-NOT-SUPPLIED NIL))
(optional-parameters 5 nil 10) ; => (5 NIL (:Z-WAS-SUPPLIED 10))
```

## Keyword Parameters

In Common Lisp a function can have named parameters (referred to as  "keyword parameters").
These are designated in the lambda list by the `&key` lambda list keyword.
Keyword parameters are not required parameters.
Like optional parameters they can be given default values and symbols to bind to their 'supplied-or-not' state.

When calling a function with keyword parameters the name of the parameter as a keyword is used in front of the parameter value.
Keyword parameters can be specified by the caller of the function in any order.

```lisp
(defun keyword-parameters (&key x (y 'default) (z nil z-supplied-p))
  (list x y (if z-supplied-p (list :z-was-supplied z)
                             (list :z-was-not-supplied z))))

(keyword-parameters)            ; => (NIL DEFAULT (:Z-WAS-NOT-SUPPLIED NIL))
(keyword-parameters :y 5)       ; => (NIL 5 (:Z-WAS-NOT-SUPPLIED NIL))
(keyword-parameters :z 10 :x 5) ; => (5 NIL (:Z-WAS-SUPPLIED 10))
```

Care should be taken when combining optional and keyword parameters as the keyword name and argument could be consumed by optional parameters:

```lisp
(defun could-be-confusing (&optional x y &key z) (list x y z))
(could-be-confusing :z 'huh?) ; => (:Z HUH? NIL)
```

## Rest Parameters

In Common Lisp a function can have a parameter that will contain the "rest" of the arguments after any required or optional parameters are processed.
This parameter is designated by the `&rest` lambda list keyword.
If all arguments to a function are used by by other types of parameters then the rest parameter will be bound to an empty list.
If there are unused arguments then the rest parameter will be bound to a list of those arguments.

```lisp
(defun rest-of-it (req &optional opt &rest rest) (list req opt rest))
(rest-of-it 1)         ; => (1 NIL NIL)
(rest-of-it 1 2)       ; => (1 2 NIL)
(rest-of-it 1 2 3)     ; => (1 2 (3))
(rest-of-it 1 2 3 4 5) ; => (1 2 (3 4 5))
```

[lambda-list]: http://www.lispworks.com/documentation/HyperSpec/Body/26_glo_l.htm#lambda_list
[lambda-list-keyword]: http://www.lispworks.com/documentation/HyperSpec/Body/26_glo_l.htm#lambda_list_keyword

## Instructions

Lilly the Lisp Alien has definitely made a lot of Lasagna with your
help. They want to thank you by giving you some leftovers. But first
they have some feedback about one of the functions you helped them
with.

In this exercise you are going to write some more functions to help
Lilly with their Lasagna cooking as well as helping them split the
leftovers with you.

You have six tasks, three about improving the existing Lasagna cooking
functions and three about splitting the leftovers.

## 1. Make `preparation-time-in-minutes` easier to use

Lilly says they found using your `preparation-time-in-minutes` a
little awkward to use since they had to count all the layers before
using the functions. Lilly wonders if you could make a version of the
function that takes the layers (any number of them) as arguments and
then calculate the preparation time based upon how many layers there
were? As a reminder, it takes 19 minutes to prepare a single layer.

```lisp
(preparation-time 'sauce 'cheese 'right-handed-macaroni 'cheese 'sauce
                  'left-handed-macaroni 'sauce 'sauce 'cheese 'cheese)
                  ;; => 190 (because there are 10 layers.)
```

## 2. Allow changing the expected oven time

While Lilly's parental-units always cooked their lasagna for 337
minutes, Lilly does admit that other Lisp Aliens like to cook their
lasagna for longer or shorter amounts of time.

So it would be good if `remaining-minutes-in-oven` would not use
`expected-minutes-in-oven` but instead could take an _optional_
parameter to define if the time should be longer, very long, shorter
or very short. Longer or shorter means add or subtract 100 from the
default time of 337. Very long or very short means add or
subtract 200. If no parameter is provided, or the argument is 'normal'
then the default value of 337 should be returned.

```lisp
(remaining-minutes-in-oven)             ;; => 337
(remaining-minutes-in-oven :normal)     ;; => 337
(remaining-minutes-in-oven :shorter)    ;; => 237
(remaining-minutes-in-oven :very-short) ;; => 137
(remaining-minutes-in-oven :longer)     ;; => 437
(remaining-minutes-in-oven :very-long)  ;; => 537
```

## 3. Lilly remembers another preferred cooking style

Just after you finished that change Lilly remembers that there are
some Lisp Aliens that like _really short_ cooking times. Effectively
they want it raw. So now the function should return 0 if `NIL` was the
argument as well as the same values as in the previous task.

```lisp
(remaining-minutes-in-oven)     ;; => 337
(remaining-minutes-in-oven nil) ;; => 0
```

## 4. Splitting the leftovers

Now that you've helped improve the lasagna cooking functions there is
_a lot of lasagna_! Lilly wants to repay you for all your help by
splitting the leftovers with you. You will need to write a function
that takes three parameters: the total amount of leftovers, the number
of containers for leftovers Lilly found in their cupboards and the
same for you. Because searching for leftover containers may take
different amounts of time, and the exact amount of leftovers may be
determined while yourself and Lilly are out searching your cupboards
you both agree that the function should take the arguments in any
order, so as each number is determined you can write it down. When you
have all three numbers you can just close the parenthesis on the
function call and evaluate it.

The function should return the amount of leftovers which are leftover,
that is, the difference between the weight of left-overs and the total
number of containers that you and Lilly found.

```lisp
(split-leftovers :weight 20 :human 10 :alien 5) ;; => 5
(split-leftovers :weight 20 :alien 10 :human 2) ;; => 8
(split-leftovers :alien 12 :weight 20 :human 4) ;; => 4
```

## 5. Making assumptions

After a few trips back and forth to your respective cupboards, you
both agree that it would be great if the function could just _assume_
that you or Lilly had... say 10 containers if it were not specified.

```lisp
(split-leftovers :weight 20 :human 5) ;; => 5
(split-leftovers :weight 20 :alien 5) ;; => 5
(split-leftovers :weight 20)          ;; => 0
```

## 6. Standard amount of leftovers

Even better the function could _assume_ that there is enough leftovers
to fit into the containers. So if the weight is not provided the
function should return `:just-split-it`. _However_ if the weight is
provided and it is `nil` then it should return
`:looks-like-someone-was-hungry`.

```lisp
(split-leftovers :human 5 :alien 5) ;; => :JUST-SPLIT-IT
(split-leftovers :weight NIL :human 5 :alien 5) ;; => :LOOKS-LIKE-SOMEONE-WAS-HUNGRY
```

## Source

### Created by

- @verdammelt