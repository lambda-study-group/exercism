# Sorting Socks and Sexprs

Welcome to Sorting Socks and Sexprs on Exercism's Common Lisp Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Comments

Common Lisp allows the programmer to write "comments" that are ignored by the computer.
Single-line comments begin with one or more semi-colons (`;`) and, occasionally, you may see the following:

```lisp
(code...) ; => value
```

Where the comment is being used to indicate what value is returned by Common Lisp after running the code on that line.

It is idiomatic to use a single semi-colon for a short comment at the end of a line, two for a longer comment above a section of code, three for long comment describing something such as a function and four for a comment such as a header at the top of a source file.

## Cons

All Common Lisp code is either an "atom" (a single, indivisible value) or a list (also termed a "cons").
A cons is made up of two parts: the first element and the rest of the elements.
For historical reasons these two parts are called the `car` and the `cdr`.
When these conses are evaluated as code, the first element (`car`) represents the function being called while the rest of the elements
(`cdr`) represent the arguments to that function:

```lisp
(<function> <arg1> <arg2> ... <argN>)
; ^ car ^  |        ^ cdr ^
```

## Expressions

All Common Lisp code is made of S-Expressions (Symbolic Expressions). They are called sexprs for short. Every sexpr is either an atom or a cons. When S-Expressions are evaluated, they automatically return some value which takes the place of the expression. When writing your own functions (using `defun`), the last value within the body of the `defun` is automatically returned:

```lisp
;; Defining a new function
(defun gimme-foo () 'foo)
;; Calling the function as an S-Expression
(gimme-foo) ; => FOO
```

## Symbols

Symbols in Common Lisp are special values that can point to other values or, in the case of _keywords_, themselves.
When symbols are evaluated by Lisp, they are replaced with the values they point to:

```lisp
foo  ; => <whatever-foo-points-to>
:foo ; => :FOO
```

Note that keywords are denoted by a leading colon (`:`).

Quoting – the addition of `'` before an S-expression – tells Lisp to not evaluate that expression.
By quoting `'foo` in our `defun` example, we avoided Lisp attempting to look up (and failing to find) whatever `FOO` was supposed to point to, instead, returning the value `FOO` itself.
If `FOO` has not been defined anywhere in our program:

```lisp
foo  ; => <ERROR! Lisp doesn't know what foo points to!>
'foo ; => FOO
```

For now, you can consider this just as a way to return symbols from a function, but we will revisit quoting and further explore its implications in future concept exercises.

## Instructions

You! Yes you, brave lisper! [Lenny the lisp alien][alien] needs your help! Lenny
wants to go hang out with all the other lisp aliens, but their parents have told Lenny
that they're not going anywhere until their room is clean.

The issue is, Lenny can hardly see the floor! Lenny can't tell their atoms from their
conses, their symbols from their keywords, their `car`s from their `cdr`s!

Can you help Lenny sort this mess out? Don't forget [your parentheses][xkcd],
you'll be needing them!

## 1. Refresh Lenny on symbols

Before Lenny can get started, they need a refresher on what symbols and keywords
look like – it's been a while since they last tidied up... Help Lenny out by
defining two functions: `lennys-favorite-food` which evaluates to some symbol,
and `lennys-secret-keyword` which evaluates to some keyword. For example:

```lisp
(lennys-favorite-food) ; => LASAGNA
```

```lisp
(lennys-secret-keyword) ; => :ALIENS-ARE-REAL
```

Note that you can return any symbol or keyword you'd like (if you're not a fan
of lasagna or aren't a believer in aliens).

## 2. Help Lenny distinguish between atoms and conses

Once Lenny has had a refresher on symbols and keywords, it's time to get
cleaning! To sort through all of the S-Expressions laying around their room, Lenny
needs help determining what is a cons and what is an atom. You can help by
implementing two functions, `is-an-atom-p` and `is-a-cons-p`:

```lisp
(is-an-atom-p 'one-thing)    ; => T
(is-an-atom-p '(two things)) ; => NIL
```

```lisp
(is-a-cons-p 'one-thing)    ; => NIL
(is-a-cons-p '(two things)) ; => T
```

For this section, there are a number of built-in lisp functions that you may
find useful. Additionally, for now, you can simply consider `T` as true and
`NIL` as false.

## 3. Help Lenny split up their conses

Finally, Lenny's conses are too bulky to put away neatly, so they need to split
them up into smaller parts. Can you help by defining two more functions to break
up their conses (`first-thing` and `rest-of-it`)?

```lisp
(first-thing '(first second third)) ; => FIRST
(rest-of-it  '(first second third)) ; => (SECOND THIRD)
```

Again, some of Common Lisp's built-in functions might come in handy here.

[alien]: http://www.lisperati.com/logo.html
[xkcd]: https://xkcd.com/297/

## Source

### Created by

- @verdammelt
- @TheLostLambda