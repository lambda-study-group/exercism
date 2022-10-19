"
# Acronym

Convert a phrase to its acronym.

Techies love their TLA (Three Letter Acronyms)!

Help generate some jargon by writing a program that converts a long name
like Portable Network Graphics to its acronym (PNG).

## Hint

Try to find a way to split up a String and then iterate over the resulting sections to output a result.

"
Class {
	#name : #AcronymTest,
	#superclass : #ExercismTest,
	#instVars : [
		'acronymCalculator'
	],
	#category : #'Exercise@Acronym'
}

{ #category : #config }
AcronymTest class >> exercise [
	^(self createExerciseAfter: ReverseStringTest)
		isCore: false;
		difficulty: 2;
		topics: #('strings' 'iteration' 'parsing');
		yourself
]

{ #category : #config }
AcronymTest class >> uuid [
	"Answer a unique id for this exercise"
	^'dc7b1fff-f0be-460d-b146-ee84c2acc10b'
]

{ #category : #config }
AcronymTest class >> version [
	"Generated from specification: 25 February 2019"
	^'1.7.0'
]

{ #category : #running }
AcronymTest >> setUp [
	super setUp.
	acronymCalculator := Acronym new
]

{ #category : #tests }
AcronymTest >> test01_AbbreviateAPhraseBasic [
	| result |

	result := acronymCalculator abbreviatePhrase: 'Portable Network Graphics' .
	self assert: result equals: 'PNG'
]

{ #category : #tests }
AcronymTest >> test02_AbbreviateAPhraseLowercaseWords [
	| result |

	result := acronymCalculator abbreviatePhrase: 'Ruby on Rails' .
	self assert: result equals: 'ROR'
]

{ #category : #tests }
AcronymTest >> test03_AbbreviateAPhrasePunctuation [
	| result |

	result := acronymCalculator abbreviatePhrase: 'First In, First Out' .
	self assert: result equals: 'FIFO'
]

{ #category : #tests }
AcronymTest >> test04_AbbreviateAPhraseAllCapsWord [
	| result |

	result := acronymCalculator abbreviatePhrase: 'GNU Image Manipulation Program' .
	self assert: result equals: 'GIMP'
]

{ #category : #tests }
AcronymTest >> test05_AbbreviateAPhrasePunctuationWithoutWhitespace [
	| result |

	result := acronymCalculator abbreviatePhrase: 'Complementary metal-oxide semiconductor' .
	self assert: result equals: 'CMOS'
]

{ #category : #tests }
AcronymTest >> test06_AbbreviateAPhraseVeryLongAbbreviation [
	| result |

	result := acronymCalculator abbreviatePhrase: 'Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me' .
	self assert: result equals: 'ROTFLSHTMDCOALM'
]

{ #category : #tests }
AcronymTest >> test07_AbbreviateAPhraseConsecutiveDelimiters [
	| result |

	result := acronymCalculator abbreviatePhrase: 'Something - I made up from thin air' .
	self assert: result equals: 'SIMUFTA'
]

{ #category : #tests }
AcronymTest >> test08_AbbreviateAPhraseApostrophes [
	| result |

	result := acronymCalculator abbreviatePhrase: 'Halley''s Comet' .
	self assert: result equals: 'HC'
]

{ #category : #tests }
AcronymTest >> test09_AbbreviateAPhraseUnderscoreEmphasis [
	| result |

	result := acronymCalculator abbreviatePhrase: 'The Road _Not_ Taken' .
	self assert: result equals: 'TRNT'
]
