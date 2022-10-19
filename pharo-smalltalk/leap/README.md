# Leap

Welcome to Leap on Exercism's Pharo Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

Given a year, report if it is a leap year.

The tricky thing here is that a leap year in the Gregorian calendar occurs:

```text
on every year that is evenly divisible by 4
  except every year that is evenly divisible by 100
    unless the year is also evenly divisible by 400
```

For example, 1997 is not a leap year, but 1996 is.  1900 is not a leap
year, but 2000 is.

## Notes

Though our exercise adopts some very simple rules, there is more to
learn!

For a delightful, four minute explanation of the whole leap year
phenomenon, go watch [this youtube video][video].

[video]: http://www.youtube.com/watch?v=xX96xng7sAE

The tests for this exercise (and future exercises), are prefix numbered like 'test00_'. This is not a normal convention in Pharo, however to ease the study of the language it is useful to present tests in a deterministic order.For this exercise, study the 'arithmetic' method category for class Number, as well as how boolean operators are also defined as messages. Notice how "and:" and "or:" are implented in the classes True and False. You can use the context menu item "senders of..." to view how other parts of Pharo use these operators.You may also find something useful trying... `World > Tools > Finder > Examples > 20 . 4 . true`<br> which is asking Pharo which operations between the first and second elements result in the third.<br> [View demo][demo][demo]: https://github.com/exercism/pharo-smalltalk/raw/master/docs/images/Hint-Finder-Leap.gif

## Source

### Created by

- @macta

### Contributed to by

- @bencoman

### Based on

JavaRanch Cattle Drive, exercise 3 - http://www.javaranch.com/leap.jsp