# Raindrops

Welcome to Raindrops on Exercism's Rust Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

Your task is to convert a number into a string that contains raindrop sounds corresponding to certain potential factors. A factor is a number that evenly divides into another number, leaving no remainder. The simplest way to test if a one number is a factor of another is to use the [modulo operation](https://en.wikipedia.org/wiki/Modulo_operation).

The rules of `raindrops` are that if a given number:

- has 3 as a factor, add 'Pling' to the result.
- has 5 as a factor, add 'Plang' to the result.
- has 7 as a factor, add 'Plong' to the result.
- _does not_ have any of 3, 5, or 7 as a factor, the result should be the digits of the number.

## Examples

- 28 has 7 as a factor, but not 3 or 5, so the result would be "Plong".
- 30 has both 3 and 5 as factors, but not 7, so the result would be "PlingPlang".
- 34 is not factored by 3, 5, or 7, so the result would be "34".

## Source

### Created by

- @EduardoBautista

### Contributed to by

- @ashleygwilliams
- @ClashTheBunny
- @coriolinus
- @cwhakes
- @eddyp
- @EduardoBautista
- @efx
- @ErikSchierboom
- @IanWhitney
- @kytrinyx
- @leoyvens
- @lutostag
- @mkantor
- @nfiles
- @petertseng
- @rofrol
- @stevejb71
- @stringparser
- @xakon
- @ZapAnton

### Based on

A variation on FizzBuzz, a famous technical interview question that is intended to weed out potential candidates. That question is itself derived from Fizz Buzz, a popular children's game for teaching division. - https://en.wikipedia.org/wiki/Fizz_buzz