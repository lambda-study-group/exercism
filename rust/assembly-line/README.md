# Assembly Line

Welcome to Assembly Line on Exercism's Rust Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Numbers

There are two different categories of numbers in Rust: integers (which can be signed or unsigned) and floating-point numbers.

## Integers

- Integers: numbers with no digits behind the decimal separator (whole numbers).
  Integer types can either store only positive numbers (unsigned) or store either positive and negative numbers (signed).
  Examples are -6, 0, 1, 25, 976 and 500000.

## Floating-Point Numbers

- Floating-point numbers: numbers with zero or more digits behind the decimal separator.
  Examples are -2.4, 0.1, 3.14, 16.984025 and 1024.0.

## Naming numeric types

The name of a numeric type consists of two parts:

- A letter to specify whether it's an unsigned integer (u), signed integer (i), or floating-point number (f).
- A number to specify the type's size in bits. Larger types have a greater range between minimum and maximum values.
  For floating points it will also allow for more numbers behind the decimal separator.

The following combinations are possible:

- 8 bits: `u8`, `i8`
- 16 bits: `u16`, `i16`
- 32 bits: `u32`, `i32`, `f32`
- 64 bits: `u64`, `i64`, `f64`
- 128 bits: `u128`, `i128`

Note that there are only 32-bits and 64-bits variants for floating-point numbers.

## Converting between number types

Rust doesn't do any implicit type conversion.
This means that if you need to turn one numeric type into another, you have to do so explicitly.
When converting from a larger type to a smaller one (for instance `u64` to `u32`) you could lose data.
Converting from a floating point to an integer **will** lose everything behind the decimal point, effectively rounding down.

## Instructions

In this exercise you'll be writing code to analyze the production of an assembly line in a car factory. The assembly line's speed can range from `0` (off) to `10` (maximum).

At its lowest speed (`1`), `221` cars are produced each hour. The production increases linearly with the speed. So with the speed set to `4`, it should produce `4 * 221 = 884` cars per hour. However, higher speeds increase the likelihood that faulty cars are produced, which then have to be discarded. The following table shows how speed influences the success rate:

- `1` to `4`: 100% success rate.
- `5` to `8`: 90% success rate.
- `9` and `10`: 77% success rate.

You have two tasks.

## 1. Calculate the production rate per hour

Implement a method to calculate the assembly line's production rate per hour, taking into account its success rate:

```rust
assembly_line::production_rate_per_hour(6)
// Returns: 1193.4
```

Note that the value returned is an `f64`.

## 2. Calculate the number of working items produced per minute

Implement a method to calculate how many working cars are produced per minute:

```rust
assembly_line::working_items_per_minute(6)
// Returns: 19
```

Note that the value returned is an `u32`.

## Source

### Created by

- @LewisClement
- @efx