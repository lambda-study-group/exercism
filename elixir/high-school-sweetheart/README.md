# High School Sweetheart

Welcome to High School Sweetheart on Exercism's Elixir Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Strings

Strings in Elixir are delimited by double quotes, and they are encoded in UTF-8:

```elixir
"Hi!"
```

Strings can be concatenated using the `<>/2` operator:

```elixir
"Welcome to" <> " " <> "New York"
# => "Welcome to New York"
```

Strings in Elixir support interpolation using the `#{}` syntax:

```elixir
"6 * 7 = #{6 * 7}"
# => "6 * 7 = 42"
```

To put a newline character in a string, use the `\n` escape code:

```elixir
"1\n2\n3\n"
```

To comfortably work with texts with a lot of newlines, use the triple-double-quote heredoc syntax instead:

```elixir
"""
1
2
3
"""
```

Elixir provides many functions for working with strings in the `String` module.

## Pipe Operator

The `|>` operator is called the pipe operator. It can be used to chain function calls together in such a way that the value returned by the previous function call is passed as the first argument to the next function call.

```elixir
"hello"
|> String.upcase()
|> Kernel.<>("?!")
# => "HELLO?!"
```

## Instructions

In this exercise, you are going to help high school sweethearts profess their love on social media by generating an ASCII heart with their initials:

```
     ******       ******
   **      **   **      **
 **         ** **         **
**            *            **
**                         **
**     J. K.  +  M. B.     **
 **                       **
   **                   **
     **               **
       **           **
         **       **
           **   **
             ***
              *
```

## 1. Get the name's first letter

Implement the `HighSchoolSweetheart.first_letter/1` function. It should take a name and return its first letter. It should clean up any unnecessary whitespace from the name.

```elixir
HighSchoolSweetheart.first_letter("Jane")
# => "J"
```

## 2. Format the first letter as an initial

Implement the `HighSchoolSweetheart.initial/1` function. It should take a name and return its first letter, uppercase, followed by a dot. Make sure to reuse `HighSchoolSweetheart.first_letter/1` that you defined in the previous step.

```elixir
HighSchoolSweetheart.initial("Robert")
# => "R."
```

## 3. Split the full name into the first name and the last name

Implement the `HighSchoolSweetheart.initials/1` function. It should take a full name, consisting of a first name and a last name separated by a space, and return the initials. Make sure to reuse `HighSchoolSweetheart.initial/1` that you defined in the previous step.

```elixir
HighSchoolSweetheart.initials("Lance Green")
# => "L. G."
```

## 4. Put the initials inside of the heart

Implement the `HighSchoolSweetheart.pair/2` function. It should take two full names and return the initials. Make sure to reuse `HighSchoolSweetheart.initials/1` that you defined in the previous step.

```elixir
HighSchoolSweetheart.pair("Blake Miller", "Riley Lewis")
# => """
#      ******       ******
#    **      **   **      **
#  **         ** **         **
# **            *            **
# **                         **
# **     B. M.  +  R. L.     **
#  **                       **
#    **                   **
#      **               **
#        **           **
#          **       **
#            **   **
#              ***
#               *
# """
```

## Source

### Created by

- @angelikatyborska

### Contributed to by

- @neenjaw