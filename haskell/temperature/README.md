# Temperature

Welcome to Temperature on Exercism's Haskell Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

`Integer`s hold any number no matter how big, up to the limit of your machine's memory, while `Int` corresponds to the set of positive and negative integers that can be expressed in 32 or 64 bits (guaranteed at least -2^29 to 2^29).

`Float` corresponds to the set of real numbers, limited by the precision of the computer.
Operations defined on numbers usually work on one type or the other, but not both.

Functions to convert between `Float` and `Integer` include, among others, `toFloat` which converts `Int`/`Integer` to `Float` and `ceiling` which converts a `Float` to an `Int`.

Conversion from an integer type (`Int` or `Integer`) to any other numeric type is done using the function `fromIntegral`.
The target type is inferred automatically.
For example:

```haskell
n :: Integer
n = 6
x :: Float
x = fromIntegral n      --> x = 6.0

m :: Int
m = 7
y :: Double
y = fromIntegral m      --> y = 7.0
```

## Instructions

You are part of a firefighter organization made of international volunteers.
Due to the international nature of the team, valuable time has been wasted over the last few calls translating between Fahrenheit and Celcius while estimating the temperature inside the burning buildings.
To save time, and people, you decide to create a program to automatically convert between Fahrenheit and Celsius for your international team.

## 1. Convert Farenheit to Celsius

Implement the `tempToC` function to convert an `Integer` temperature in Fahrenheit to its equivalent `Float` in Celsius rounded to the nearest hundredth.
Temperature in degrees Celsius is defined as: T(°C) = (T(°F) - 32) / 1.8.

```haskell
> tempToC 32
0.00
```

## 2. Convert Celsius to Farenheit

Implement the `tempToF` function to convert a `Float` temperature in Celsius to its equivalent in Fahrenheit.
For safety reasons, **round up** the result to the **next-highest** `Integer`.
Temperature in degrees Farenheit is defined as: T(°F) = T(°C) × 1.8 + 32.

```Haskell
> tempToF 4
40
```

## Source

### Created by

- @pwadsworth