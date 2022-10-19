"
# Isbn Verifier

The [ISBN-10 verification process](https://en.wikipedia.org/wiki/International_Standard_Book_Number) is used to validate book identification
numbers. These normally contain dashes and look like: `3-598-21508-8`

## ISBN

The ISBN-10 format is 9 digits (0 to 9) plus one check character (either a digit or an X only). In the case the check character is an X, this represents the value '10'. These may be communicated with or without hyphens, and can be checked for their validity by the following formula:

```
(x1 * 10 + x2 * 9 + x3 * 8 + x4 * 7 + x5 * 6 + x6 * 5 + x7 * 4 + x8 * 3 + x9 * 2 + x10 * 1) mod 11 == 0
```

If the result is 0, then it is a valid ISBN-10, otherwise it is invalid.

## Example

Let's take the ISBN-10 `3-598-21508-8`. We plug it in to the formula, and get:
```
(3 * 10 + 5 * 9 + 9 * 8 + 8 * 7 + 2 * 6 + 1 * 5 + 5 * 4 + 0 * 3 + 8 * 2 + 8 * 1) mod 11 == 0
```

Since the result is 0, this proves that our ISBN is valid.

## Task

Given a string the program should check if the provided string is a valid ISBN-10.
Putting this into place requires some thinking about preprocessing/parsing of the string prior to calculating the check digit for the ISBN.

The program should be able to verify ISBN-10 both with and without separating dashes.


## Caveats

Converting from strings to numbers can be tricky in certain languages.
Now, it's even trickier since the check digit of an ISBN-10 may be 'X' (representing '10'). For instance `3-598-21507-X` is a valid ISBN-10.

## Bonus tasks

* Generate a valid ISBN-13 from the input ISBN-10 (and maybe verify it again with a derived verifier).

* Generate valid ISBN, maybe even from a given starting ISBN.

## Hint

Use the lessons from previous exercises, try and keep your methods small

"
Class {
	#name : #IsbnVerifierTest,
	#superclass : #ExercismTest,
	#instVars : [
		'isbnVerifierCalculator'
	],
	#category : #'Exercise@IsbnVerifier'
}

{ #category : #config }
IsbnVerifierTest class >> exercise [
	"Answer the configured exercise meta data for this exercise, an ExercismExercise"
	
	^(self createExerciseAfter: LeapTest)
		isCore: false;
		difficulty: 3;
		topics: #('characters' 'collections' 'validation');
		yourself
]

{ #category : #config }
IsbnVerifierTest class >> uuid [
	"Answer a unique id for this exercise"
	^'d166a016-9d41-0d00-8fc3-1ee008866539'
]

{ #category : #config }
IsbnVerifierTest class >> version [
	"Generated from specification: 29 March 2019"
	^'2.7.0'
]

{ #category : #running }
IsbnVerifierTest >> setUp [
	super setUp.
	isbnVerifierCalculator := IsbnVerifier new
]

{ #category : #tests }
IsbnVerifierTest >> test01_ValidIsbnNumber [
	| result |

	result := isbnVerifierCalculator isValidIsbn: '3-598-21508-8' .
	self assert: result equals: true
]

{ #category : #tests }
IsbnVerifierTest >> test02_InvalidIsbnCheckDigit [
	| result |

	result := isbnVerifierCalculator isValidIsbn: '3-598-21508-9' .
	self assert: result equals: false
]

{ #category : #tests }
IsbnVerifierTest >> test03_ValidIsbnNumberWithACheckDigitOf10 [
	| result |

	result := isbnVerifierCalculator isValidIsbn: '3-598-21507-X' .
	self assert: result equals: true
]

{ #category : #tests }
IsbnVerifierTest >> test04_CheckDigitIsACharacterOtherThanX [
	| result |

	result := isbnVerifierCalculator isValidIsbn: '3-598-21507-A' .
	self assert: result equals: false
]

{ #category : #tests }
IsbnVerifierTest >> test05_InvalidCharacterInIsbn [
	| result |

	result := isbnVerifierCalculator isValidIsbn: '3-598-P1581-X' .
	self assert: result equals: false
]

{ #category : #tests }
IsbnVerifierTest >> test06_XIsOnlyValidAsACheckDigit [
	| result |

	result := isbnVerifierCalculator isValidIsbn: '3-598-2X507-9' .
	self assert: result equals: false
]

{ #category : #tests }
IsbnVerifierTest >> test07_ValidIsbnWithoutSeparatingDashes [
	| result |

	result := isbnVerifierCalculator isValidIsbn: '3598215088' .
	self assert: result equals: true
]

{ #category : #tests }
IsbnVerifierTest >> test08_IsbnWithoutSeparatingDashesAndXAsCheckDigit [
	| result |

	result := isbnVerifierCalculator isValidIsbn: '359821507X' .
	self assert: result equals: true
]

{ #category : #tests }
IsbnVerifierTest >> test09_IsbnWithoutCheckDigitAndDashes [
	| result |

	result := isbnVerifierCalculator isValidIsbn: '359821507' .
	self assert: result equals: false
]

{ #category : #tests }
IsbnVerifierTest >> test10_TooLongIsbnAndNoDashes [
	| result |

	result := isbnVerifierCalculator isValidIsbn: '3598215078X' .
	self assert: result equals: false
]

{ #category : #tests }
IsbnVerifierTest >> test11_TooShortIsbn [
	| result |

	result := isbnVerifierCalculator isValidIsbn: '00' .
	self assert: result equals: false
]

{ #category : #tests }
IsbnVerifierTest >> test12_IsbnWithoutCheckDigit [
	| result |

	result := isbnVerifierCalculator isValidIsbn: '3-598-21507' .
	self assert: result equals: false
]

{ #category : #tests }
IsbnVerifierTest >> test13_CheckDigitOfXShouldNotBeUsedFor0 [
	| result |

	result := isbnVerifierCalculator isValidIsbn: '3-598-21515-X' .
	self assert: result equals: false
]

{ #category : #tests }
IsbnVerifierTest >> test14_EmptyIsbn [
	| result |

	result := isbnVerifierCalculator isValidIsbn: '' .
	self assert: result equals: false
]

{ #category : #tests }
IsbnVerifierTest >> test15_InputIs9Characters [
	| result |

	result := isbnVerifierCalculator isValidIsbn: '134456729' .
	self assert: result equals: false
]

{ #category : #tests }
IsbnVerifierTest >> test16_InvalidCharactersAreNotIgnored [
	| result |

	result := isbnVerifierCalculator isValidIsbn: '3132P34035' .
	self assert: result equals: false
]

{ #category : #tests }
IsbnVerifierTest >> test17_InputIsTooLongButContainsAValidIsbn [
	| result |

	result := isbnVerifierCalculator isValidIsbn: '98245726788' .
	self assert: result equals: false
]
