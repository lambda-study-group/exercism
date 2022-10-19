"
# Binary

Convert a binary number, represented as a string (e.g. '101010'), to its decimal equivalent using first principles.

Implement binary to decimal conversion. Given a binary input
string, your program should produce a decimal output. The
program should handle invalid inputs.

## Note

- Implement the conversion yourself.
  Do not use something else to perform the conversion for you.

## About Binary (Base-2)

Decimal is a base-10 system.

A number 23 in base 10 notation can be understood
as a linear combination of powers of 10:

- The rightmost digit gets multiplied by 10^0 = 1
- The next number gets multiplied by 10^1 = 10
- ...
- The *n*th number gets multiplied by 10^*(n-1)*.
- All these values are summed.

So: `23 => 2*10^1 + 3*10^0 => 2*10 + 3*1 = 23 base 10`

Binary is similar, but uses powers of 2 rather than powers of 10.

So: `101 => 1*2^2 + 0*2^1 + 1*2^0 => 1*4 + 0*2 + 1*1 => 4 + 1 => 5 base 10`.

## Hint

The ^ operation in Pharo is expressed as the descriptive keyword message #raisedTo:

"
Class {
	#name : #BinaryTest,
	#superclass : #ExercismTest,
	#instVars : [
		'binaryCalculator'
	],
	#category : #'Exercise@Binary'
}

{ #category : #config }
BinaryTest class >> exercise [
	"Answer the configured exercise meta data for this exercise, an ExercismExercise"
	
	^(self createExerciseAfter: IsogramTest )
		isCore: false;
		difficulty: 3;
		topics: #('strings' 'iteration' 'math');
		yourself
	
				
]

{ #category : #generator }
BinaryTest class >> generator [
	"Answer code generator aliases/hints"
	
	^{'binary'->'fromBinary'}
	
				
]

{ #category : #config }
BinaryTest class >> uuid [
	"Answer a unique id for this exercise"
	^'a90be8bb-8040-0d00-812e-0c1701deb008'
]

{ #category : #config }
BinaryTest class >> version [
	"Generated from specification: 15 March 2019"
	^'1.1.0'
]

{ #category : #running }
BinaryTest >> setUp [
	super setUp.
	binaryCalculator := Binary new
]

{ #category : #tests }
BinaryTest >> test01_Binary0IsDecimal0 [
	| result |

	result := binaryCalculator decimalFromBinary: '0' .
	self assert: result equals: 0
]

{ #category : #tests }
BinaryTest >> test02_Binary1IsDecimal1 [
	| result |

	result := binaryCalculator decimalFromBinary: '1' .
	self assert: result equals: 1
]

{ #category : #tests }
BinaryTest >> test03_Binary10IsDecimal2 [
	| result |

	result := binaryCalculator decimalFromBinary: '10' .
	self assert: result equals: 2
]

{ #category : #tests }
BinaryTest >> test04_Binary11IsDecimal3 [
	| result |

	result := binaryCalculator decimalFromBinary: '11' .
	self assert: result equals: 3
]

{ #category : #tests }
BinaryTest >> test05_Binary100IsDecimal4 [
	| result |

	result := binaryCalculator decimalFromBinary: '100' .
	self assert: result equals: 4
]

{ #category : #tests }
BinaryTest >> test06_Binary1001IsDecimal9 [
	| result |

	result := binaryCalculator decimalFromBinary: '1001' .
	self assert: result equals: 9
]

{ #category : #tests }
BinaryTest >> test07_Binary11010IsDecimal26 [
	| result |

	result := binaryCalculator decimalFromBinary: '11010' .
	self assert: result equals: 26
]

{ #category : #tests }
BinaryTest >> test08_Binary10001101000IsDecimal1128 [
	| result |

	result := binaryCalculator decimalFromBinary: '10001101000' .
	self assert: result equals: 1128
]

{ #category : #tests }
BinaryTest >> test09_BinaryIgnoresLeadingZeros [
	| result |

	result := binaryCalculator decimalFromBinary: '000011111' .
	self assert: result equals: 31
]

{ #category : #tests }
BinaryTest >> test10_2IsNotAValidBinaryDigit [
	| result |

	result := binaryCalculator decimalFromBinary: '2' .
	self assert: result equals: nil
]

{ #category : #tests }
BinaryTest >> test11_ANumberContainingANonbinaryDigitIsInvalid [
	| result |

	result := binaryCalculator decimalFromBinary: '01201' .
	self assert: result equals: nil
]

{ #category : #tests }
BinaryTest >> test12_ANumberWithTrailingNonbinaryCharactersIsInvalid [
	| result |

	result := binaryCalculator decimalFromBinary: '10nope' .
	self assert: result equals: nil
]

{ #category : #tests }
BinaryTest >> test13_ANumberWithLeadingNonbinaryCharactersIsInvalid [
	| result |

	result := binaryCalculator decimalFromBinary: 'nope10' .
	self assert: result equals: nil
]

{ #category : #tests }
BinaryTest >> test14_ANumberWithInternalNonbinaryCharactersIsInvalid [
	| result |

	result := binaryCalculator decimalFromBinary: '10nope10' .
	self assert: result equals: nil
]

{ #category : #tests }
BinaryTest >> test15_ANumberAndAWordWhitespaceSeparatedIsInvalid [
	| result |

	result := binaryCalculator decimalFromBinary: '001 nope' .
	self assert: result equals: nil
]
