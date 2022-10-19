"
# Isogram

Determine if a word or phrase is an isogram.

An isogram (also known as a ""nonpattern word"") is a word or phrase without a repeating letter, however spaces and hyphens are allowed to appear multiple times.

Examples of isograms:

- lumberjacks
- background
- downstream
- six-year-old

The word *isograms*, however, is not an isogram, because the s repeats.

## Hint

There is a range of interesting data types in Pharo, it's worth taking the time to browse the  hierarchy of class Collection and reading some of the class comments and running some of the examples.

"
Class {
	#name : #IsogramTest,
	#superclass : #ExercismTest,
	#instVars : [
		'isogramCalculator'
	],
	#category : #'Exercise@Isogram'
}

{ #category : #config }
IsogramTest class >> exercise [
	"Answer the configured exercise meta data for this exercise, an ExercismExercise"
	
	^(self createExerciseAfter: ReverseStringTest)
		isCore: true;
		difficulty: 2;
		topics: #('strings' 'iteration');
		yourself

]

{ #category : #config }
IsogramTest class >> uuid [
	"Answer a unique id for this exercise"
	^'9e0074be-4a3f-0d00-bb4e-73e5071d6982'
]

{ #category : #config }
IsogramTest class >> version [
	"Generated from specification: 28 February 2019"
	^'1.7.0'
]

{ #category : #running }
IsogramTest >> setUp [
	super setUp.
	isogramCalculator := Isogram new
]

{ #category : #tests }
IsogramTest >> test01_CheckIfTheGivenStringIsAnIsogramEmptyString [
	| result |

	result := isogramCalculator isIsogramPhrase: '' .
	self assert: result equals: true
]

{ #category : #tests }
IsogramTest >> test02_CheckIfTheGivenStringIsAnIsogramIsogramWithOnlyLowerCaseCharacters [
	| result |

	result := isogramCalculator isIsogramPhrase: 'isogram' .
	self assert: result equals: true
]

{ #category : #tests }
IsogramTest >> test03_CheckIfTheGivenStringIsAnIsogramWordWithOneDuplicatedCharacter [
	| result |

	result := isogramCalculator isIsogramPhrase: 'eleven' .
	self assert: result equals: false
]

{ #category : #tests }
IsogramTest >> test04_CheckIfTheGivenStringIsAnIsogramWordWithOneDuplicatedCharacterFromTheEndOfTheAlphabet [
	| result |

	result := isogramCalculator isIsogramPhrase: 'zzyzx' .
	self assert: result equals: false
]

{ #category : #tests }
IsogramTest >> test05_CheckIfTheGivenStringIsAnIsogramLongestReportedEnglishIsogram [
	| result |

	result := isogramCalculator isIsogramPhrase: 'subdermatoglyphic' .
	self assert: result equals: true
]

{ #category : #tests }
IsogramTest >> test06_CheckIfTheGivenStringIsAnIsogramWordWithDuplicatedCharacterInMixedCase [
	| result |

	result := isogramCalculator isIsogramPhrase: 'Alphabet' .
	self assert: result equals: false
]

{ #category : #tests }
IsogramTest >> test07_CheckIfTheGivenStringIsAnIsogramWordWithDuplicatedCharacterInMixedCaseLowercaseFirst [
	| result |

	result := isogramCalculator isIsogramPhrase: 'alphAbet' .
	self assert: result equals: false
]

{ #category : #tests }
IsogramTest >> test08_CheckIfTheGivenStringIsAnIsogramHypotheticalIsogrammicWordWithHyphen [
	| result |

	result := isogramCalculator isIsogramPhrase: 'thumbscrew-japingly' .
	self assert: result equals: true
]

{ #category : #tests }
IsogramTest >> test09_CheckIfTheGivenStringIsAnIsogramHypotheticalWordWithDuplicatedCharacterFollowingHyphen [
	| result |

	result := isogramCalculator isIsogramPhrase: 'thumbscrew-jappingly' .
	self assert: result equals: false
]

{ #category : #tests }
IsogramTest >> test10_CheckIfTheGivenStringIsAnIsogramIsogramWithDuplicatedHyphen [
	| result |

	result := isogramCalculator isIsogramPhrase: 'six-year-old' .
	self assert: result equals: true
]

{ #category : #tests }
IsogramTest >> test11_CheckIfTheGivenStringIsAnIsogramMadeupNameThatIsAnIsogram [
	| result |

	result := isogramCalculator isIsogramPhrase: 'Emily Jung Schwartzkopf' .
	self assert: result equals: true
]

{ #category : #tests }
IsogramTest >> test12_CheckIfTheGivenStringIsAnIsogramDuplicatedCharacterInTheMiddle [
	| result |

	result := isogramCalculator isIsogramPhrase: 'accentor' .
	self assert: result equals: false
]

{ #category : #tests }
IsogramTest >> test13_CheckIfTheGivenStringIsAnIsogramSameFirstAndLastCharacters [
	| result |

	result := isogramCalculator isIsogramPhrase: 'angola' .
	self assert: result equals: false
]
