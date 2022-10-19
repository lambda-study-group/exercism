# Grains

Welcome to Grains on Exercism's Pharo Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

Calculate the number of grains of wheat on a chessboard given that the number
on each square doubles.

There once was a wise servant who saved the life of a prince. The king
promised to pay whatever the servant could dream up. Knowing that the
king loved chess, the servant told the king he would like to have grains
of wheat. One grain on the first square of a chess board, with the number
of grains doubling on each successive square.

There are 64 squares on a chessboard (where square 1 has one grain, square 2 has two grains, and so on).

Write code that shows:
- how many grains were on a given square, and
- the total number of grains on the chessboard

## For bonus points

Did you get the tests passing and the code clean? If you want to, these
are some additional things you could try:

- Optimize for speed.
- Optimize for readability.

Then please share your thoughts in a comment on the submission. Did this
experiment make the code better? Worse? Did you learn anything from it?

These kinds of problems (where an answer is dependent on a previous) one are often called recursion. There are different ways to code for recursion, it might be worth reasearching if you are not familiar with this. Pharo is well optimised for recursion, and it is a commonly used pattern.Note: in the original problem specification, the grainsCalculator is called via #square, however we have renamed this method #atSquare: which is a more Smalltalk like name, that better describes that you are asking for an answer "at a square".

## Source

### Created by

- @macta

### Contributed to by

- @bencoman

### Based on

JavaRanch Cattle Drive, exercise 6 - http://www.javaranch.com/grains.jsp