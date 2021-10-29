# Anagram

Welcome to Anagram on Exercism's Rust Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

An anagram is a rearrangement of letters to form a new word.
Given a word and a list of candidates, select the sublist of anagrams of the given word.

Given `"listen"` and a list of candidates like `"enlists" "google"
"inlets" "banana"` the program should return a list containing
`"inlets"`.

The solution is case insensitive, which means `"WOrd"` is the same as `"word"` or `"woRd"`. It may help to take a peek at the [std library](https://doc.rust-lang.org/std/primitive.char.html) for functions that can convert between them.

The solution cannot contain the input word. A word is always an anagram of itself, which means it is not an interesting result. Given `"hello"` and the list `["hello", "olleh"]` the answer is `["olleh"]`.

You are going to have to adjust the function signature provided in the stub in order for the lifetimes to work out properly. This is intentional: what's there demonstrates the basics of lifetime syntax, and what's missing teaches how to interpret lifetime-related compiler errors.

Try to limit case changes. Case changes are expensive in terms of time, so it's faster to minimize them.

If sorting, consider [sort_unstable](https://doc.rust-lang.org/std/primitive.slice.html#method.sort_unstable) which is typically faster than stable sorting. When applicable, unstable sorting is preferred because it is generally faster than stable sorting and it doesn't allocate auxiliary memory.

## Source

### Created by

- @EduardoBautista

### Contributed to by

- @andrewclarkson
- @ashleygwilliams
- @bobahop
- @chancancode
- @ClashTheBunny
- @coriolinus
- @cwhakes
- @Dimkar3000
- @EduardoBautista
- @efx
- @ErikSchierboom
- @gris
- @IanWhitney
- @kytrinyx
- @lutostag
- @mkantor
- @nfiles
- @petertseng
- @pminten
- @quartsize
- @rofrol
- @stevejb71
- @stringparser
- @xakon
- @ZapAnton

### Based on

Inspired by the Extreme Startup game - https://github.com/rchatley/extreme_startup