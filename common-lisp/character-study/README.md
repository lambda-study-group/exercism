# Character Study

Welcome to Character Study on Exercism's Common Lisp Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

Common Lisp has characters like other programming languages.
Characters are objects which represent an item in a quantity of text (e.g. a string or text stream).

Characters can be converted to and from integers. (But they are *not* integers - they are a distinct type.)

Characters are represented as `#\` followed by its name.
The 'name' for common characters such as 'A' or 'b' or '9' or '!' are simply that: so `#\A`, `#\b`, `#\9` and `#\!`.
Some non-graphical characters such as space or new-line have names such as `#\Space` and `#\Newline`.

The standard only requires an implementation to have 96 characters (upper and lower case Latin alphabetic characters (`A-Za-z`), the digits (`0-9`), space (`#\Space`), newline (`#\Newline`) and punctuation (e.g. ``!$"'(),_-./:;?+<=>#%&*@[\]{|}`^~``)
However most implementations will offer more than that, including implementations which provide all Unicode characters.

## Comparing characters.

Characters can be compared for equality by `char=` or `char-equal` (the latter being case-insensitive).

Characters can be ordered with functions such as `char<`, `char>`, `char<=`, `char>=` and their case-insensitive versions `char-lessp` and `char-greaterp`.

## Types of characters

Characters can be categorized as different types: graphical, alphabetic, alpha-numeric, digit, upper-case or lower-case. 
A character can be more than one type such as an upper-case alphabetic character.
There are predicates for each of these types: `graphic-char-p`, `alpha-char-p`, `alphanumericp`, `digit-char-p`, `upper-case-p` and `lower-case-p`.

## Converting character case

Some characters can be upper or lower case and can be converted between them with `char-upcase` and `char-downcase`.

## Instructions

Lewis, a young Lisp Alien, needs to get some work done on their Human alphabets project and asks if you can help them program some functions they will need.

## 1. Comparing characters

Lewis will need a function to compare two characters, determining if the first is greater-than, less-than or equal-to the second.
Write a function `compare-chars` which will take two characters and evaluate to `:greater-than`, `:less-than`, or `:equal-to` appropriately.
The function should compare in a case-sensitive manner.

## 2. Determine the "size" of the character

Lewis needs to know the if a character is "big" (a uppercase character) or "little" (a lowercase character), or "no-size" if it is neither. 
Write a function `size-of-char` that will evaluate to `:big`, `:small` or `:no-size` depending upon the "size" of the character:

## 3. Changing the "size" of the character

Lewis may need to make a big character small, or a small character big.
Write a function `change-size-of-char` which takes two parameters a character and a desired size (`:big` or `:small`). 
It should evaluate to the corresponding character of the correct size.

## 4. Determine the "type" of a character

Not only will Lewis need to know what the 'size' of the character is but also its 'type'. 
Write a function `type-of-char` that will evaluate to `:alpha` if the character is an alphabetic character, `:numeric` if it is a numeric character, `:space` if it is a space character, `:newline` if it is a newline character and `:unknown` otherwise

## Source

### Created by

- @verdammelt