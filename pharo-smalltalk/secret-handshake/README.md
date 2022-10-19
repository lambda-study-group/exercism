# Secret Handshake

Welcome to Secret Handshake on Exercism's Pharo Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

> There are 10 types of people in the world: Those who understand
> binary, and those who don't.

You and your fellow cohort of those in the "know" when it comes to
binary decide to come up with a secret "handshake".

```text
1 = wink
10 = double blink
100 = close your eyes
1000 = jump


10000 = Reverse the order of the operations in the secret handshake.
```

Given a decimal number, convert it to the appropriate sequence of events for a secret handshake.

Here's a couple of examples:

Given the input 3, the function would return the array
["wink", "double blink"] because 3 is 11 in binary.

Given the input 19, the function would return the array
["double blink", "wink"] because 19 is 10011 in binary.
Notice that the addition of 16 (10000 in binary)
has caused the array to be reversed.

The Integer class has a bit manipulation protocol which may be useful.

## Source

### Created by

- @carlotxra

### Contributed to by

- @bencoman
- @macta

### Based on

Bert, in Mary Poppins - http://www.imdb.com/title/tt0058331/quotes/qt0437047