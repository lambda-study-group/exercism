# Die

Welcome to Die on Exercism's Pharo Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

Develop a simple domain specific language (DSL) for rolling dice. Players of games such as Dungeons & Dragons are familiar with such a DSL. An example is the following expression: `2 D20 + 1 D6`, which means we should roll two 20-sided dice and one 6-sided die.

The expression `2 d20 + 3 d10` is possible to implement using Pharo syntax. `+` is a method like any other and can be implemented on classes other than numbers. Methods such as `d20` can be implemtented on the existing `Integer` class with class extensions, a method in another package other than the one the class is in.

This exercise has been sourced from the book: Learning Object-Oriented Programming, Design and TDD with Pharo available at http://books.pharo.org. Chapter 12: Crafting a simple embedded DSL with Pharo.

## Source

### Created by

- @macta

### Contributed to by

- @bencoman
- @samWson