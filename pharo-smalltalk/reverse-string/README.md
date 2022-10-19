# Reverse String

Welcome to Reverse String on Exercism's Pharo Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

Reverse a string

For example:
input: "cool"
output: "looc"

While there is are `#reversed` and `#reverseDo:` methods for Strings, can you figure out how to do this yourself using lower level character iteration and streams? 

To help you browse code, Pharo has a neat code finder tool. Press Shift-Enter to activate it.

NOTE: We have followed the Exercism convention of calling the solution ReverseString, however a more Smalltalk name would be StringReverser.

## Smalltalk and Strings

Concerning strings, there are some obvious little details like double quotes for comments, single quotes for strings, and special syntax for characters (e.g., $x for character “x”) that might confuse you on first reading as the conventions are different from those used by other languages. 

There is also the notion of a symbol which is a string that is unique memory-wide; i.e. when it is constructed (typically at compile-time), a memory search is made to determine if another one like it exists; and only the original is used. The rationale is not just memory saving but significant speed-up when comparing symbols.

```smalltalk
"this is a comment"
'this is a string'
#'this is a symbol'
#thisIsASymbolToo
```

There are also very few commas in Smalltalk programs because they play no syntactic role.
That’s why array literals, for example, are comma-free; e.g.
`#(1 2 3 4 5)`
However, comma is an operator in its own right and you will notice it when concatenating two strings; e.g.
`'string1', 'string2'`

Finally, it's worth knowing that Strings and Characters are distinct classes. String are a collection of Characters. This can catch you off guard when iterating over strings as you can end up giving characters to a method that expects strings. Consider...
```smalltalk
(('hello' at: 2) = $e) inspect.
(('hello' at: 2) = 'e') inspect.
```

## Smalltalk and Streams
Streams are useful for sequential reading and writing.  They make code cleaner by avoiding the need to increment an index.
Streams operate on any collection.
```smalltalk
stream := WriteStream on: String new.
stream nextPut: $h ; nextPutAll: 'ell' ; nextPut: $o.
stream contents inspect
```

## Source

### Created by

- @macta

### Contributed to by

- @bencoman
- @chicoary
- @samWson

### Based on

Introductory challenge to reverse an input string - https://medium.freecodecamp.org/how-to-reverse-a-string-in-javascript-in-3-different-ways-75e4763c68cb