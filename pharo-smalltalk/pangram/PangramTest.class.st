"
# Pangram

Determine if a sentence is a pangram. A pangram (Greek: παν γράμμα, pan gramma,
""every letter"") is a sentence using every letter of the alphabet at least once.
The best known English pangram is:
> The quick brown fox jumps over the lazy dog.

The alphabet used consists of ASCII letters `a` to `z`, inclusive, and is case
insensitive. Input will not contain non-ASCII symbols.

## Hint

It pays off to carefully read the exercise description as this can simplify your solution and make it quite compact.

"
Class {
	#name : #PangramTest,
	#superclass : #ExercismTest,
	#instVars : [
		'pangramCalculator'
	],
	#category : #'Exercise@Pangram'
}

{ #category : #config }
PangramTest class >> exercise [
	"Answer the configured exercise meta data for this exercise, an ExercismExercise"
	
	^(self createExerciseAfter: IsogramTest)
		isCore: false;
		difficulty: 2;
		topics: #('strings' 'filtering');
		yourself
	
]

{ #category : #config }
PangramTest class >> uuid [
	"Answer a unique id for this exercise"
	^'6be398be-4a3f-0d00-bb67-0d71071d6982'
]

{ #category : #config }
PangramTest class >> version [
	"Generated from specification: 28 February 2019"
	^'1.4.1'
]

{ #category : #running }
PangramTest >> setUp [
	super setUp.
	pangramCalculator := Pangram new
]

{ #category : #tests }
PangramTest >> test01_CheckIfTheGivenStringIsAPangramSentenceEmpty [
	| result |

	result := pangramCalculator isPangramSentence: '' .
	self assert: result equals: false
]

{ #category : #tests }
PangramTest >> test02_CheckIfTheGivenStringIsAPangramRecognizesAPerfectLowerCasePangram [
	| result |

	result := pangramCalculator isPangramSentence: 'abcdefghijklmnopqrstuvwxyz' .
	self assert: result equals: true
]

{ #category : #tests }
PangramTest >> test03_CheckIfTheGivenStringIsAPangramPangramWithOnlyLowerCase [
	| result |

	result := pangramCalculator isPangramSentence: 'the quick brown fox jumps over the lazy dog' .
	self assert: result equals: true
]

{ #category : #tests }
PangramTest >> test04_CheckIfTheGivenStringIsAPangramMissingCharacterx [
	| result |

	result := pangramCalculator isPangramSentence: 'a quick movement of the enemy will jeopardize five gunboats' .
	self assert: result equals: false
]

{ #category : #tests }
PangramTest >> test05_CheckIfTheGivenStringIsAPangramAnotherMissingCharacterEgh [
	| result |

	result := pangramCalculator isPangramSentence: 'five boxing wizards jump quickly at it' .
	self assert: result equals: false
]

{ #category : #tests }
PangramTest >> test06_CheckIfTheGivenStringIsAPangramPangramWithUnderscores [
	| result |

	result := pangramCalculator isPangramSentence: 'the_quick_brown_fox_jumps_over_the_lazy_dog' .
	self assert: result equals: true
]

{ #category : #tests }
PangramTest >> test07_CheckIfTheGivenStringIsAPangramPangramWithNumbers [
	| result |

	result := pangramCalculator isPangramSentence: 'the 1 quick brown fox jumps over the 2 lazy dogs' .
	self assert: result equals: true
]

{ #category : #tests }
PangramTest >> test08_CheckIfTheGivenStringIsAPangramMissingLettersReplacedByNumbers [
	| result |

	result := pangramCalculator isPangramSentence: '7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog' .
	self assert: result equals: false
]

{ #category : #tests }
PangramTest >> test09_CheckIfTheGivenStringIsAPangramPangramWithMixedCaseAndPunctuation [
	| result |

	result := pangramCalculator isPangramSentence: '"Five quacking Zephyrs jolt my wax bed."' .
	self assert: result equals: true
]

{ #category : #tests }
PangramTest >> test10_CheckIfTheGivenStringIsAPangramUpperAndLowerCaseVersionsOfTheSameCharacterShouldNotBeCountedSeparately [
	| result |

	result := pangramCalculator isPangramSentence: 'the quick brown fox jumps over with lazy FX' .
	self assert: result equals: false
]
