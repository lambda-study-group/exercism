# The Key to Comparison

Welcome to The Key to Comparison on Exercism's Common Lisp Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

Common Lisp has many different equality predicates.
This differs from other programming languages which may have only one or two (perhaps `==` and `===` for example).
Some of these predicates in Common Lisp are specific to types, while others are generic.
It is these latter that will be covered here.

There are four generic equality predicates and they differ by their restrictiveness on what they consider "equal".
They are, in order from most restrictive to least restrictive: `eq`, `eql`, `equal`, and `equalp`.

A quick set of definitions (leaving out a few details) are as follows:

- `eq`: defines equality as meaning the two objects are identical.
  _e.g._:

```lisp
(eq 'a 'a)                 ; => T
(eq (list 1 2) (list 1 2)) ; => NIL
```

- `eql`: defines equality as meaning two numbers with the same type and value, two characters which are the same,
  or for anything else if they are `eq`.
  _e.g._:

```lisp
(eql 1 1)     ; => T
(eql #\a #\a) ; => T
(eql 1 1.0)   ; => NIL
(eql #\a #\A) ; => NIL
```

- `equal`: defines equality as meaning: two lists are `equal` if each element is also `equal`; two arrays are `equal` if each element is `eq`; two strings are `equal` if each element is `eql`; everything else is `equal` if they are `eql`.
  _e.g._:

```lisp
(equal (list 1 2) (list 1 2)) ; => T
(equal #(1 2) #(1 2))         ; => T
(equal "foo" "foo")           ; => T
```

- `equalp`: defines equality as meaning: strings and characters are compared in a case-insensitive manner; numbers are compared with some type conversion; lists and arrays are `equalp` if every element is also `equalp`, structures if they are the same type and all slots are `equalp` and hash-tables if their keys and values are `equalp`
  _e.g._:

```lisp
(equal "foo" "FoO")                          ; => T
(equal 3 3.0)                                ; => T
(equal (make-a-structure :slot1 1 :slot2 2) 
       (make-a-structure :slot1 1 :slot2 2)) ; => T
```

## Instructions

Leslie the Lisp Alien is programming their maze-robot (as young Lisp Aliens are wont to do) and needs some help. The maze consists of a series of rooms. Each room as a choices of doors. Each door needs a key. If you use the wrong key at a door it is likely to explode (do not worry for the robot, there will be no damage but buffing out the scorch marks is quite annoying for Leslie). If the robot doesn't have a key that opens any doors then the whole room will explode! (Again, do not worry it will not damage but will be annoying to clean.)

What you need to help Leslie with is to give the robot the correct key for each room. The robot will use the key on each door in the room in order and go through the first door that opens.

Each test represents a maze and each assertion is a room. You will need to write predicate functions that evaluate to `T` when the arguments are equal and `NIL` when they are not.

## 1. The maze of object equality

This maze has only a single room. You need to provide a function that can tell if two objects are the same object.

For example:

```lisp
a                         ; => "pizza"
b                         ; => "pizza"

(key-object-equality a a) ; => T
(key-object-equality a b) ; => NIL
```

because while `a` and `b` appear to be the same, they are not the same object.

## 2. The maze of numbers

This maze has two rooms. The first has a door that can be opened if your key can tell if two numbers are strictly equal to each other. The second room needs a key that allows some flexibility on checking for equal numbers.

For example:

```lisp
a                                    ; => 13
b                                    ; => 13.0
c                                    ; => 13

(key-numbers a b)                    ; => NIL
(key-numbers a c)                    ; => T
(key-numbers-of-different-types a b) ; => T
```

because while `a` and `b` are numerically the same they are of different types.

## 3. The maze of characters

This maze has two rooms. The first has a door that can be opened if your key can tell if two characters are strictly equal to each other. The second room needs a key that allows for case-insensitive comparison of the characters.

For example:

```lisp
a                                       ; => #\X
b                                       ; => #\x
c                                       ; => #\X

(key-characters a b)                    ; => NIL
(key-characters a c)                    ; => T
(key-characters-case-insensitively a b) ; => T
```

because only very permissive equality predicates ignore case when comparing two characters.

## 4. The maze of strings

Like the maze of characters the first room needs a key that checks if two strings are equal; the second room needs a key that allows for case-insensitive comparison.

For example:

```lisp
a                                    ; => "pizza"
b                                    ; => "PIZZA"
c                                    ; => "pizza"

(key-strings a b)                    ; => NIL
(key-strings a c)                    ; => T
(key-strings-case-insensitively a b) ; => T
```

because only very permissive equality predicates ignore case when comparing two strings.

## 5. The maze of conses

This is a big maze with many rooms. Each room needs a key that will check if the conses _contain_ the things which are equal. Each room will check for equality of conses with different contents: symbols, numbers, characters, and some will need more flexible equality definitions for those contents.

For example:

```lisp
syms-a                                     ; => (left . right)
syms-b                                     ; => (up . down)
syms-c                                     ; => (left . right)
chars-a                                    ; => (#\x . #\y)
chars-b                                    ; => (#\x . #\Y)
chars-c                                    ; => (#\x . #\y)
nums-a                                     ; => (13 . 23)
nums-b                                     ; => (13 . 23.0)
nums-c                                     ; => (13 . 23)


(key-conses-of-symbols syms-a syms-b)      ; => NIL
(key-conses-of-symbols syms-a syms-c)      ; => T

(key-conses-of-characters chars-a chars-b) ; => NIL
(key-conses-of-characters chars-a chars-c) ; => T
(key-conses-of-characters-case-insensitively 
  chars-a chars-b)                         ; => T

(key-conses-of-numbers nums-a nums-b)      ; => NIL
(key-conses-of-numbers nums-a nums-c)      ; => T
(key-conses-of-numbers-of-different-types 
  nums-a nums-b)                           ; => T
```

because even with an equality predicate that will look inside of a cons, it may still not be permissive enough to ignore case or numeric type when comparing.

## 6. The maze of arrays

This maze is simpler with only two rooms. The first needs a key that checks if the arrays contain the equal contents. The second needs a key that is more flexible about checking equality of numbers.

For example:

```lisp
a                        ; => #[13 23]
b                        ; => #[13 23.0]

(key-arrays a b)         ; => NIL
(key-arrays-loosely a b) ; => T
```

because a permissive equality predicate will not consider numeric type when comparing the contents of an array.

## Source

### Created by

- @verdammelt
- @TheLostLambda