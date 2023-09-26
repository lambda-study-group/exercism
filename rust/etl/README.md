# ETL

Welcome to ETL on Exercism's Rust Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Introduction

You work for a company that makes an online multiplayer game called Lexiconia.

To play the game, each player is given 13 letters, which they must rearrange to create words.
Different letters have different point values, since it's easier to create words with some letters than others.

The game was originally launched in English, but it is very popular, and now the company wants to expand to other languages as well.

Different languages need to support different point values for letters.
The point values are determined by how often letters are used, compared to other letters in that language.

For example, the letter 'C' is quite common in English, and is only worth 3 points.
But in Norwegian it's a very rare letter, and is worth 10 points.

To make it easier to add new languages, your team needs to change the way letters and their point values are stored in the game.

## Instructions

Your task is to change the data format of letters and their point values in the game.

Currently, letters are stored in groups based on their score, in a one-to-many mapping.

- 1 point: "A", "E", "I", "O", "U", "L", "N", "R", "S", "T",
- 2 points: "D", "G",
- 3 points: "B", "C", "M", "P",
- 4 points: "F", "H", "V", "W", "Y",
- 5 points: "K",
- 8 points: "J", "X",
- 10 points: "Q", "Z",

This needs to be changed to store each individual letter with its score in a one-to-one mapping.

- "a" is worth 1 point.
- "b" is worth 3 points.
- "c" is worth 3 points.
- "d" is worth 2 points.
- etc.

As part of this change, the team has also decided to change the letters to be lower-case rather than upper-case.

~~~~exercism/note
If you want to look at how the data was previously structured and how it needs to change, take a look at the examples in the test suite.
~~~~

## Source

### Created by

- @EduardoBautista

### Contributed to by

- @ashleygwilliams
- @ClashTheBunny
- @coriolinus
- @cwhakes
- @EduardoBautista
- @efx
- @ErikSchierboom
- @IanWhitney
- @kotp
- @kytrinyx
- @lutostag
- @mkantor
- @navossoc
- @nfiles
- @petertseng
- @rofrol
- @stringparser
- @tushartyagi
- @xakon
- @ZapAnton

### Based on

The Jumpstart Lab team - http://jumpstartlab.com