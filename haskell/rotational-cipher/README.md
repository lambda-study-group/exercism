# Rotational Cipher

Welcome to Rotational Cipher on Exercism's Haskell Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

Create an implementation of the rotational cipher, also sometimes called the Caesar cipher.

The Caesar cipher is a simple shift cipher that relies on
transposing all the letters in the alphabet using an integer key
between `0` and `26`. Using a key of `0` or `26` will always yield
the same output due to modular arithmetic. The letter is shifted
for as many values as the value of the key.

The general notation for rotational ciphers is `ROT + <key>`.
The most commonly used rotational cipher is `ROT13`.

A `ROT13` on the Latin alphabet would be as follows:

```text
Plain:  abcdefghijklmnopqrstuvwxyz
Cipher: nopqrstuvwxyzabcdefghijklm
```

It is stronger than the Atbash cipher because it has 27 possible keys, and 25 usable keys.

Ciphertext is written out in the same formatting as the input including spaces and punctuation.

## Examples

- ROT5  `omg` gives `trl`
- ROT0  `c` gives `c`
- ROT26 `Cool` gives `Cool`
- ROT13 `The quick brown fox jumps over the lazy dog.` gives `Gur dhvpx oebja sbk whzcf bire gur ynml qbt.`
- ROT13 `Gur dhvpx oebja sbk whzcf bire gur ynml qbt.` gives `The quick brown fox jumps over the lazy dog.`

You need to implement the `rotate` function, which takes an `Int` and a `String`, and then encodes it using an rotational cipher.
You can use the provided signature if you are unsure about the types, but don't let it restrict your creativity.

This exercise works with textual data. For historical reasons, Haskell's
`String` type is synonymous with `[Char]`, a list of characters. For more
efficient handling of textual data, the `Text` type can be used.

As an optional extension to this exercise, you can

- read about [string types](https://haskell-lang.org/tutorial/string-types) in
  Haskell.
- add `- text` to your list of dependencies in package.yaml.
- import `Data.Text` in [the following
  way](https://hackernoon.com/4-steps-to-a-better-imports-list-in-haskell-43a3d868273c):

```haskell
import qualified Data.Text as T
import           Data.Text (Text)
```

- use the `Text` type e.g. `rotate :: Int -> Text -> Text` and refer to
  `Data.Text` combinators as e.g. `T.pack`.
- look up the documentation for
  [`Data.Text`](https://hackage.haskell.org/package/text/docs/Data-Text.html).
- replace all occurrences of `String` with `Text` in RotationalCipher.hs, i.e.:

```haskell
rotate :: Int -> Text -> Text
```

This part is entirely optional.

## Source

### Created by

- @Average-user

### Contributed to by

- @iHiD
- @JavierGelatti
- @petertseng
- @ppartarr
- @sshine
- @tejasbubane

### Based on

Wikipedia - https://en.wikipedia.org/wiki/Caesar_cipher