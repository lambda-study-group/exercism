# Reporting for Duty

Welcome to Reporting for Duty on Exercism's Common Lisp Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Format - Basics

Common Lisp has a concept of The Printer which includes all functions for writing textural representations of Lisp data. One such function is `format` which allows the programmer to format the data as they want.

The abilities of `format` and the Lisp Printer in general is a large topic; here the basics of the use of `format` will be described.

### The FORMAT function

The function `format` takes at least two arguments: a stream to print to and control string defining what and how is to be printed. 

Streams are a concept of their own and will be described elsewhere. But for now all one needs to know is that the printing is done to the stream and there are two special values: `t` and `nil` for this argument. `t` means to print to standard output (actually the stream to which the variable `*standard-output*` is bound). and `nil` means to create a string and return it.

Note that `format` will always evaluate to `nil` except in that latter case where `nil` is specified as the stream. This is a common way to do simply string interpolation or construction.

```lisp
(format nil "hello world") ; => "hello world"
(format t "hello world")   ; => NIL (but "hello world" is printed to standard output)
```

### Format Directives

The control string can contain "format directives" which give instructions to `format` about what to print and how to interpret any other parameters to `format`. In a sense the control string is a program which `format` will interpret and run. All directives start with `~` and are followed by a character (_e.g._ `~A`, `~D`, `~&`). The case of the character does not matter.

Most format directives simply interpolate an argument to `format` into the output. This is said to "consume" the argument. Some directives do not consume arguments, or consume more than one. One directive even allows you to jump around in the argument list or skip arguments.

### Basic formatting

A very general purpose format directive is `~A`. This will print a 'human readable' version of the data.

```lisp
(format nil "Value = ~a" 10)                ; => "10"
(format nil "hello ~a" "world")             ; => "hello world"
(format nil "The list is: ~A" (list 1 2 3)) ; => "The list is: (1 2 3)"
```

Another useful format directive is `~S`. This will print a 'machine readable' version of the data. This can be very useful if you want to be able to interpret the output created as Lisp data. For many things it will look the same as `~A` but note that for strings for example the output will include the quotation marks (escaped when included in another string) so that the value could be read back in as the string parameter.

```lisp
(format nil "~s" 10)            ; => "10"
(format nil "~s" "hello world") ; => "\"hello world\""
(format nil "~s" (list 1 2 3))  ; => "(1 2 3)"
```

Two more very useful directives are `~%` and `~&`. The first outputs a newline character while the latter outputs a "fresh line". The difference is that `~%` always outputs a newline while `~&` will output one if not currently at the beginning of a line. Neither of these consume an argument.

```lisp
(format nil "~%new~%lines") ; => "
                                  new
                                  lines"

(format nil "~&new~&lines"  ; => "new
                                  lines"
```

Finally `~~` is a simple directive that will output a literal `~`.

## Instructions

Like just about everyone with a job Layla the Lisp Alien sometimes needs to make reports to let others know information. They  ask if you could help them format data she has for these reports.

## 1. Formatting quarterly values

The first thing Layla needs is a function: `format-quarter-value` that takes two parameters: the calendar quarter and the value and formats it for a report. It should evaluate to a string.

```lisp
(format-quarter-value "last" 3.14) ; => "The value last quarter: 3.14"
(format-quarter-value "this" 0) ; => "The value this quarter: 0"
```

## 2. The Two-Quarter report

Layla thanks you for the `format-quarter-value` function and says it will be very useful in the *next* function that is needed.

The next report needs to show the quarter and value from 2 quarters printed on two lines. 

Also the output needs to go to the stream provided as the first argument.

For example: `(format-two-quarters t "last" 3.14 "this" 0)` will produce the following on standard output:

```

The value last quarter: 3.14
The value this quarter: 0

```

Note the blank lines around it.

## 3. Human vs. Lisp Alien readable

Layla forgot to tell you that Lisp Aliens like to see values in a way that is readable as Lisp data. So they need a new function that could be read as lisp data (again to the specified stream):

```lisp
(format-two-quarters-for-reading nil "last" 3.14 "this" 0) ; =>

"(\"The value last quarter: 3.14\" \"The value this quarter: 0\")"
```

## Source

### Created by

- @verdammelt