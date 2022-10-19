"
# Etl

We are going to do the `Transform` step of an Extract-Transform-Load.

### ETL

Extract-Transform-Load (ETL) is a fancy way of saying, ""We have some crufty, legacy data over in this system, and now we need it in this shiny new system over here, so
we're going to migrate this.""

(Typically, this is followed by, ""We're only going to need to run this
once."" That's then typically followed by much forehead slapping and
moaning about how stupid we could possibly be.)

### The goal

We're going to extract some scrabble scores from a legacy system.

The old system stored a list of letters per score:

- 1 point: ""A"", ""E"", ""I"", ""O"", ""U"", ""L"", ""N"", ""R"", ""S"", ""T"",
- 2 points: ""D"", ""G"",
- 3 points: ""B"", ""C"", ""M"", ""P"",
- 4 points: ""F"", ""H"", ""V"", ""W"", ""Y"",
- 5 points: ""K"",
- 8 points: ""J"", ""X"",
- 10 points: ""Q"", ""Z"",

The shiny new scrabble system instead stores the score per letter, which
makes it much faster and easier to calculate the score for a word. It
also stores the letters in lower-case regardless of the case of the
input letters:

- ""a"" is worth 1 point.
- ""b"" is worth 3 points.
- ""c"" is worth 3 points.
- ""d"" is worth 2 points.
- Etc.

Your mission, should you choose to accept it, is to transform the legacy data
format to the shiny new format.

### Notes

A final note about scoring, Scrabble is played around the world in a
variety of languages, each with its own unique scoring table. For
example, an ""E"" is scored at 2 in the Māori-language version of the
game while being scored at 4 in the Hawaiian-language version.

## Hint

While readability is preferred over efficiency, there is a solution that avoids multiple input looksups when solving this.

"
Class {
	#name : #EtlTest,
	#superclass : #ExercismTest,
	#instVars : [
		'etlCalculator'
	],
	#category : #'Exercise@Etl'
}

{ #category : #config }
EtlTest class >> exercise [
	"Answer the configured exercise meta data for this exercise, an ExercismExercise"
	
	^(self createExerciseAfter: ReverseStringTest)
		isCore: false;
		difficulty: 2;
		topics: #('maps' 'iteration' 'transforming');
		yourself

]

{ #category : #config }
EtlTest class >> uuid [
	"Answer a unique id for this exercise"
	^'d6303b3f-0f41-0d00-a5e1-db510c056502'
]

{ #category : #config }
EtlTest class >> version [
	"Generated from specification: 22 March 2019"
	^'1.0.1'
]

{ #category : #running }
EtlTest >> setUp [
	super setUp.
	etlCalculator := Etl new
]

{ #category : #tests }
EtlTest >> test01_TransformsASingleLetter [
	| result |

	result := etlCalculator transformData: ((Dictionary new) add: ('1'->#('A' )); yourself) .
	self assert: result equals: ((Dictionary new) add: ('a'->1); yourself)
]

{ #category : #tests }
EtlTest >> test02_TransformASingleScoreWithMultipleLetters [
	| result |

	result := etlCalculator transformData: ((Dictionary new) add: ('1'->#('A' 'E' 'I' 'O' 'U' )); yourself) .
	self assert: result equals: ((Dictionary new) add: ('i'->1); add: ('e'->1); add: ('a'->1); add: ('u'->1); add: ('o'->1); yourself)
]

{ #category : #tests }
EtlTest >> test03_TransformMultipleScoresWithMultipleLetters [
	| result |

	result := etlCalculator transformData: ((Dictionary new) add: ('1'->#('A' 'E' )); add: ('2'->#('D' 'G' )); yourself) .
	self assert: result equals: ((Dictionary new) add: ('g'->2); add: ('a'->1); add: ('d'->2); add: ('e'->1); yourself)
]

{ #category : #tests }
EtlTest >> test04_TransformsMultipleScoresWithDifferingNumbersOfLetters [
	| result |

	result := etlCalculator transformData: ((Dictionary new) add: ('8'->#('J' 'X' )); add: ('4'->#('F' 'H' 'V' 'W' 'Y' )); add: ('2'->#('D' 'G' )); add: ('5'->#('K' )); add: ('3'->#('B' 'C' 'M' 'P' )); add: ('1'->#('A' 'E' 'I' 'O' 'U' 'L' 'N' 'R' 'S' 'T' )); add: ('10'->#('Q' 'Z' )); yourself) .
	self assert: result equals: ((Dictionary new) add: ('g'->2); add: ('z'->10); add: ('s'->1); add: ('l'->1); add: ('e'->1); add: ('x'->8); add: ('q'->10); add: ('j'->8); add: ('c'->3); add: ('v'->4); add: ('o'->1); add: ('h'->4); add: ('a'->1); add: ('t'->1); add: ('m'->3); add: ('f'->4); add: ('y'->4); add: ('r'->1); add: ('k'->5); add: ('d'->2); add: ('w'->4); add: ('p'->3); add: ('i'->1); add: ('b'->3); add: ('u'->1); add: ('n'->1); yourself)
]
