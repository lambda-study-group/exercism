# Log Levels

Welcome to Log Levels on Exercism's Common Lisp Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

In Common Lisp strings are [vectors][concept-vectors] of [characters][concept-characters].
They are written as characters surrounded by double quotes (_e.g_ "Hello World!").

The `stringp` predicate will return true only if the given value is a string.

Strings can be split into sub-strings with the `subseq` function which takes the string a start index and optionally an end index.
The indexing is zero-based.

```lisp
(subseq "Hello World" 1 5) ; => "ello"
(subseq "skip to the end" 5) ; => "to the end"
```

Strings can be compared for equality with `string=`.
If case of the characters should be ignored then `string-equal` can be used.

```lisp
(string= "macaroni" "macaroni") ; => T
(string= "macaroni" "MACARONI") ; => NIL
(string-equal "macaroni" "MACARONI") ; => T
```

Operations like upper-casing, lower-casing and capitalization of strings can be done with `string-upcase` `string-downcase` and `string-capitalize`.

```lisp
(string-upcase "not too loud") ; => "NOT TOO LOUD"
(string-downcase "YELL IT FROM THE ROOFTOPS") ; => "yell it from the rooftops"
(string-capitalize "practical COMMON LiSP") ; => "Practical Common Lisp"
```

[concept-characters]: /tracks/common-lisp/concepts/characters
[concept-vectors]: /tracks/common-lisp/concepts/vectors

## Instructions

In this exercise you will write some code to help Larry the Lisp Alien parse and format log strings. These log strings come in from various systems and need to be processed so that their messages can be display on an informative monitoring display.

Log strings are in the form `"[<level>]: <message>"`. Level will be one of the following values: `info`, `warn`, or `ohno`.

## 1. Extract the message

Define a function `log-message` which will take a log string and evaluate to the message it contains.

```lisp
(log-message "[ohno]: whoops!") ; => "whoops!"
```

## 2. Determine the severity

The level of the log string determines its severity. 

- a level of `info` means a severity of `:everything-ok`
- a level of `warn` means a severity of `:getting-worried`
- a level of `ohno` means a severity of `:run-for-cover`

Define a function `log-severity` which will take a log string and evaluate to the correct severity.

```lisp
(log-message "[warn]: might want to get that checked") ; => :getting-worried
```

## 3. Dealing with the vagaries of reality

Unfortunately sometimes the log strings are not always formatted correctly. Specifically the log level may be not all lower case as specified above. Modify `log-severity` to handle this.

```lisp
(log-message "[WaRn] string case system failing") ; => :getting-worried
```

## 4. Reformatting the log message according to log severity

Depending upon the severity the message should be modified in different ways:

- a severity of `:everything-ok` should have its message changed to all lower-case.
- a severity of `:getting-worried` should have its message changed to have each word capitalized.
- a severity of `:run-for-cover` should have its message changed to be all upper-case.

Define a function `log-format` that takes a log message and evaluates to a properly formatted message.

```lisp
(log-format "[ohno]: whoops!") ; => WHOOPS!
```

## Source

### Created by

- @verdammelt