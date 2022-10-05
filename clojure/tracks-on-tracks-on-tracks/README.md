# Tracks on Tracks on Tracks

Welcome to Tracks on Tracks on Tracks on Exercism's Clojure Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

In Clojure, Lists are [collections][type-collection], just as like [lists in other languages][type-list]. Similar to other languages in the Lisp family, Clojure uses parentheses to express lists.

Clojure lists can be created in one of two ways. The `list` function can create a list, or you can `quote` a literal list.

Lists are special because Clojure will treat them as _calls_. It expects the call to start with an _operator_, which is usually a function. The remaining items of the list are considered _operands_, meaning they become the function's arguments.

Clojure's special treatment of lists is why we cannot create a list literal directly. Quoting a list using `quote` or its shorthand `'` indicates that the list should not be evaluated.

Unlike some modern languages, Clojure lists are _heterogeneous_, meaning they can contain multiple types of items internally e.g., `'(2 "a" "b" 3)`.
Unlike other Lisps, an empty list in Clojure is truthy and is not equivalent to `nil` or `false`.

[type-list]: https://github.com/exercism/v3/blob/main/reference/types/list.md
[type-collection]: https://github.com/exercism/v3/blob/main/reference/types/collection.md

## Instructions

In this exercise you'll be writing code to process a list of programming languages you are planning to practice from Exercism platform.

You have six tasks.

## 1. Create a new list

Before you can add languages, you'll need to start by creating a new list. Define a function that returns an empty list.

```clojure
(new-list)
;; => ()
```

## 2. Add a new language to the list

As you explore Exercism and find languages you want to learn, you'll need to be able to add them to your list. Define a function to add a new language the beginning of your list.

```clojure
(add-language '("Clojurescript") "JavaScript")
;; => '("JavaScript" "Clojurescript")
```

## 3. Check the language last added

You'll want to quickly check which language you just added. Define a function that returns the first language from your list.

```clojure
(first-language '("Haskell" "Python"))
;; => "Haskell"
```

## 4. Remove the first language from the list

Sometimes you'll change your mind about a language you just added. Define a function to remove the first language from your list.

```clojure
(remove-language '("Common Lisp" "Racket" "Scheme"))
;; => '("Racket" "Scheme")
```

## 5. Count the languages in the list

Counting the languages one-by-one is inconvenient. Define function to count the number of languages on your list.

```clojure
(count-languages '("C#" "Racket" "Rust" "Ruby"))
;; => 4
```

## 6. Put it all together

Define a `learning-list` function, within which you will use the some of the functions you've defined above.

- Create an empty list
- Add 2 new programming languages to the list.

  - "Clojure"
  - "Lisp"

- Remove "Lisp" from the list, as you might not have enough time for the year, and it's quite similar to Clojure.
- Add 2 more programming languages to the list.

  - "Java"
  - "JavaScript"

- Return the total number of languages. Hint: it should be 3.

```clojure
(learning-list)
;; => 3
```

## Source

### Created by

- @bemself

### Contributed to by

- @porkostomus
- @cstby