# Clock

Welcome to Clock on Exercism's Haskell Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

Implement a clock that handles times without dates.

You should be able to add and subtract minutes to it.

Two clocks that represent the same time should be equal to each other.

It's a 24 hour clock going from "00:00" to "23:59".

To complete this exercise you need to define the data type `Clock`,
add an `Eq` instance, and implement the functions:

- addDelta
- fromHourMin
- toString

`addDelta` adds a duration, expressed in hours and minutes, to a given time,
represented by an instance of `Clock`.

`fromHourMin` takes an hour and minute, and returns an instance of `Clock` with 
those hours and minutes.

`toString` takes an instance of `Clock` and returns a string representation 
of the clock, in 0-padded format like "08:03" or "22:35"

You will find a dummy data declaration and type signatures already in place,
but it is up to you to define the functions and create a meaningful data type,
newtype or type synonym.

If you need help getting started with types, take a look at:
- [Data Types in 5 Steps][types]

[types]: https://mmhaskell.com/blog/2017/12/24/haskell-data-types-in-5-steps

## Source

### Created by

- @etrepum

### Contributed to by

- @felix91gr
- @iHiD
- @jeeger
- @kevin-meyers
- @kytrinyx
- @lpalma
- @petertseng
- @ppartarr
- @rbasso
- @sshine
- @tejasbubane
- @tiniuclx

### Based on

Pairing session with Erin Drummond - https://twitter.com/ebdrummond