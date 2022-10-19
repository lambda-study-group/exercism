"
# Reverse String

Reverse a string

For example:
input: ""cool""
output: ""looc""

## Hint

While there is are `#reversed` and `#reverseDo:` methods for Strings, can you figure out how to do this yourself using lower level character iteration and streams? 

To help you browse code, Pharo has a neat code finder tool. Press Shift-Enter to activate it.

NOTE: We have followed the Exercism convention of calling the solution ReverseString, however a more Smalltalk name would be StringReverser.

## Smalltalk and Strings

Concerning strings, there are some obvious little details like double quotes for comments, single quotes for strings, and special syntax for characters (e.g., $x for character “x”) that might confuse you on first reading as the conventions are different from those used by other languages. 

There is also the notion of a symbol which is a string that is unique memory-wide; i.e. when it is constructed (typically at compile-time), a memory search is made to determine if another one like it exists; and only the original is used. The rationale is not just memory saving but significant speed-up when comparing symbols.

```smalltalk
""this is a comment""
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
"
Class {
	#name : #ReverseStringTest,
	#superclass : #ExercismTest,
	#instVars : [
		'reverseStringCalculator'
	],
	#category : #'Exercise@ReverseString'
}

{ #category : #config }
ReverseStringTest class >> exercise [
	"Answer the configured exercise meta data for this exercise, an ExercismExercise"
	
	^(self createExerciseAfter: LeapTest)
		isCore: true;
		difficulty: 1;
		topics: #('strings' 'iteration');
		yourself
	
				
]

{ #category : #config }
ReverseStringTest class >> uuid [
	"Answer a unique id for this exercise"
	^'bab40685-2f87-4d4f-8886-0a4d21a0d90d'
]

{ #category : #config }
ReverseStringTest class >> version [
	"Generated from specification: 25 February 2019"
	^'1.1.0'
]

{ #category : #running }
ReverseStringTest >> setUp [
	super setUp.
	reverseStringCalculator := ReverseString new
]

{ #category : #tests }
ReverseStringTest >> test01_AnEmptyString [
	| result |

	result := reverseStringCalculator reverseValue: '' .
	self assert: result equals: ''
]

{ #category : #tests }
ReverseStringTest >> test02_AWord [
	| result |

	result := reverseStringCalculator reverseValue: 'robot' .
	self assert: result equals: 'tobor'
]

{ #category : #tests }
ReverseStringTest >> test03_ACapitalizedWord [
	| result |

	result := reverseStringCalculator reverseValue: 'Ramen' .
	self assert: result equals: 'nemaR'
]

{ #category : #tests }
ReverseStringTest >> test04_ASentenceWithPunctuation [
	| result |

	result := reverseStringCalculator reverseValue: 'I''m hungry!' .
	self assert: result equals: '!yrgnuh m''I'
]

{ #category : #tests }
ReverseStringTest >> test05_APalindrome [
	| result |

	result := reverseStringCalculator reverseValue: 'racecar' .
	self assert: result equals: 'racecar'
]

{ #category : #extra }
ReverseStringTest >> testMisuseOfSelector [
	self verifySolution: reverseStringCalculator class avoidsSelector: #reverse.
	self verifySolution: reverseStringCalculator class avoidsSelector: #reversed
]
