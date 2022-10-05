# Robot Name

Welcome to Robot Name on Exercism's Haskell Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

Manage robot factory settings.

When a robot comes off the factory floor, it has no name.

The first time you turn on a robot, a random name is generated in the format
of two uppercase letters followed by three digits, such as RX837 or BC811.

Every once in a while we need to reset a robot to its factory settings,
which means that its name gets wiped. The next time you ask, that robot will
respond with a new random name.

The names must be random: they should not follow a predictable sequence.
Using random names means a risk of collisions. Your solution must ensure that
every existing robot has a unique name.

To complete this exercise, you need to create the data type `Robot`,
as a mutable variable, and the data type `RunState`. You also need to
implement the following functions:

- `initialState`
- `mkRobot`
- `resetName`
- `robotName`

You will find a dummy data declaration and type signatures already in place,
but it is up to you to define the functions and create a meaningful data type,
newtype or type synonym. To model state this exercise uses the
[`State`](https://en.wikibooks.org/wiki/Haskell/Understanding_monads/State)
monad. More specifically we combine the `State` monad with the `IO` monad using
the [`StateT` monad transfomers](http://book.realworldhaskell.org/read/monad-transformers.html).
All tests are run with `initialState` as the state fed into to `evalStateT`.

## Source

### Created by

- @etrepum

### Contributed to by

- @cmcaine
- @iHiD
- @khalilfazal
- @kytrinyx
- @lpalma
- @petertseng
- @ppartarr
- @rbasso
- @slava-sh
- @sshine
- @tejasbubane

### Based on

A debugging session with Paul Blackwell at gSchool.