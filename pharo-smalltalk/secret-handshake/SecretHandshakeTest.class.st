"
# Secret Handshake

> There are 10 types of people in the world: Those who understand
> binary, and those who don't.

You and your fellow cohort of those in the ""know"" when it comes to
binary decide to come up with a secret ""handshake"".

```text
1 = wink
10 = double blink
100 = close your eyes
1000 = jump


10000 = Reverse the order of the operations in the secret handshake.
```

Given a decimal number, convert it to the appropriate sequence of events for a secret handshake.

Here's a couple of examples:

Given the input 3, the function would return the array
[""wink"", ""double blink""] because 3 is 11 in binary.

Given the input 19, the function would return the array
[""double blink"", ""wink""] because 19 is 10011 in binary.
Notice that the addition of 16 (10000 in binary)
has caused the array to be reversed.

## Hint

The Integer class has a bit manipulation protocol which may be useful.

"
Class {
	#name : #SecretHandshakeTest,
	#superclass : #ExercismTest,
	#instVars : [
		'secretHandshakeCalculator'
	],
	#category : #'Exercise@SecretHandshake'
}

{ #category : #config }
SecretHandshakeTest class >> exercise [
	^ (self createExerciseAfter: IsogramTest)
		isCore: false;
		difficulty: 2;
		topics: #('arrays' 'bitwise operations');
		yourself
]

{ #category : #config }
SecretHandshakeTest class >> uuid [
	"Answer a unique id for this exercise"
	^'2020ac16-9d41-0d00-8fcd-fe0908866539'
]

{ #category : #config }
SecretHandshakeTest class >> version [
	"Generated from specification: 29 March 2019"
	^'1.2.0'
]

{ #category : #running }
SecretHandshakeTest >> setUp [
	super setUp.
	secretHandshakeCalculator := SecretHandshake new
]

{ #category : #tests }
SecretHandshakeTest >> test01_CreateAHandshakeForANumberWinkFor1 [
	| result |

	result := secretHandshakeCalculator commandsNumber: 1 .
	self assert: result equals: #('wink' )
]

{ #category : #tests }
SecretHandshakeTest >> test02_CreateAHandshakeForANumberDoubleBlinkFor10 [
	| result |

	result := secretHandshakeCalculator commandsNumber: 2 .
	self assert: result equals: #('double blink' )
]

{ #category : #tests }
SecretHandshakeTest >> test03_CreateAHandshakeForANumberCloseYourEyesFor100 [
	| result |

	result := secretHandshakeCalculator commandsNumber: 4 .
	self assert: result equals: #('close your eyes' )
]

{ #category : #tests }
SecretHandshakeTest >> test04_CreateAHandshakeForANumberJumpFor1000 [
	| result |

	result := secretHandshakeCalculator commandsNumber: 8 .
	self assert: result equals: #('jump' )
]

{ #category : #tests }
SecretHandshakeTest >> test05_CreateAHandshakeForANumberCombineTwoActions [
	| result |

	result := secretHandshakeCalculator commandsNumber: 3 .
	self assert: result equals: #('wink' 'double blink' )
]

{ #category : #tests }
SecretHandshakeTest >> test06_CreateAHandshakeForANumberReverseTwoActions [
	| result |

	result := secretHandshakeCalculator commandsNumber: 19 .
	self assert: result equals: #('double blink' 'wink' )
]

{ #category : #tests }
SecretHandshakeTest >> test07_CreateAHandshakeForANumberReversingOneActionGivesTheSameAction [
	| result |

	result := secretHandshakeCalculator commandsNumber: 24 .
	self assert: result equals: #('jump' )
]

{ #category : #tests }
SecretHandshakeTest >> test08_CreateAHandshakeForANumberReversingNoActionsStillGivesNoActions [
	| result |

	result := secretHandshakeCalculator commandsNumber: 16 .
	self assert: result equals: #()
]

{ #category : #tests }
SecretHandshakeTest >> test09_CreateAHandshakeForANumberAllPossibleActions [
	| result |

	result := secretHandshakeCalculator commandsNumber: 15 .
	self assert: result equals: #('wink' 'double blink' 'close your eyes' 'jump' )
]

{ #category : #tests }
SecretHandshakeTest >> test10_CreateAHandshakeForANumberReverseAllPossibleActions [
	| result |

	result := secretHandshakeCalculator commandsNumber: 31 .
	self assert: result equals: #('jump' 'close your eyes' 'double blink' 'wink' )
]

{ #category : #tests }
SecretHandshakeTest >> test11_CreateAHandshakeForANumberDoNothingForZero [
	| result |

	result := secretHandshakeCalculator commandsNumber: 0 .
	self assert: result equals: #()
]
