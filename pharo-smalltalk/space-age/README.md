# Space Age

Welcome to Space Age on Exercism's Pharo Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

Given an age in seconds, calculate how old someone would be on:

   - Mercury: orbital period 0.2408467 Earth years
   - Venus: orbital period 0.61519726 Earth years
   - Earth: orbital period 1.0 Earth years, 365.25 Earth days, or 31557600 seconds
   - Mars: orbital period 1.8808158 Earth years
   - Jupiter: orbital period 11.862615 Earth years
   - Saturn: orbital period 29.447498 Earth years
   - Uranus: orbital period 84.016846 Earth years
   - Neptune: orbital period 164.79132 Earth years

So if you were told someone were 1,000,000,000 seconds old, you should
be able to say that they're 31.69 Earth-years old.

If you're wondering why Pluto didn't make the cut, go watch [this
youtube video](http://www.youtube.com/watch?v=Z_2gbGXzFbs).

You might find Pharo dictionaries useful in completing this exercise.Pharo has several ways to construct dictionaries, including `Dictionary new: at:put:`and a literal syntax using `Association`s. An `Association` looks like `key -> value`and can be turned into a dictionary like this: `{ 'key' -> 'value' } asDictionary`.Remember that in Smalltalk, all infix operators are right-associative and that youcan browse any of the classes mentioned above live.

## Source

### Created by

- @macta

### Contributed to by

- @bencoman

### Based on

Partially inspired by Chapter 1 in Chris Pine's online Learn to Program tutorial. - http://pine.fm/LearnToProgram/?Chapter=01