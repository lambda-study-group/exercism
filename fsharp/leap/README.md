# Leap

Welcome to Leap on Exercism's F# Track.
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

The DateTime class in F# provides a built-in [IsLeapYear](https://msdn.microsoft.com/en-us/library/system.datetime.isleapyear(v=vs.110).aspx?cs-save-lang=1&cs-lang=fsharp) method
which you should pretend doesn't exist for the purposes of implementing this exercise.

## Source

### Created by

- @jwood803

### Contributed to by

- @ErikSchierboom
- @jrr
- @lestephane
- @robkeim
- @valentin-p
- @vrnithinkumar
- @wolf99

### Based on

JavaRanch Cattle Drive, exercise 3 - http://www.javaranch.com/leap.jsp