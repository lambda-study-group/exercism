"
# Luhn

Given a number determine whether or not it is valid per the Luhn formula.

The [Luhn algorithm](https://en.wikipedia.org/wiki/Luhn_algorithm) is
a simple checksum formula used to validate a variety of identification
numbers, such as credit card numbers and Canadian Social Insurance
Numbers.

The task is to check if a given string is valid.

Validating a Number
------

Strings of length 1 or less are not valid. Spaces are allowed in the input,
but they should be stripped before checking. All other non-digit characters
are disallowed.

## Example 1: valid credit card number

```text
4539 1488 0343 6467
```

The first step of the Luhn algorithm is to double every second digit,
starting from the right. We will be doubling

```text
4_3_ 1_8_ 0_4_ 6_6_
```

If doubling the number results in a number greater than 9 then subtract 9
from the product. The results of our doubling:

```text
8569 2478 0383 3437
```

Then sum all of the digits:

```text
8+5+6+9+2+4+7+8+0+3+8+3+3+4+3+7 = 80
```

If the sum is evenly divisible by 10, then the number is valid. This number is valid!

## Example 2: invalid credit card number

```text
8273 1232 7352 0569
```

Double the second digits, starting from the right

```text
7253 2262 5312 0539
```

Sum the digits

```text
7+2+5+3+2+2+6+2+5+3+1+2+0+5+3+9 = 57
```

57 is not evenly divisible by 10, so this number is not valid.

## Hint

Read the instructions carefully, if you skim you might miss some important details about direction. 


"
Class {
	#name : #LuhnTest,
	#superclass : #ExercismTest,
	#instVars : [
		'luhnCalculator'
	],
	#category : #'Exercise@Luhn'
}

{ #category : #config }
LuhnTest class >> exercise [
	"Answer the configured exercise meta data for this exercise, an ExercismExercise"
	
	^(self createExerciseAfter: GrainsTest)
		isCore: false;
		difficulty: 4;
		topics: #('strings' 'math' 'algorithms');
		yourself
]

{ #category : #config }
LuhnTest class >> uuid [
	"Answer a unique id for this exercise"
	^'6298e416-9d41-0d00-8ffa-c83508866539'
]

{ #category : #config }
LuhnTest class >> version [
	"Generated from specification: 29 March 2019"
	^'1.5.0'
]

{ #category : #running }
LuhnTest >> setUp [
	super setUp.
	luhnCalculator := Luhn new
]

{ #category : #tests }
LuhnTest >> test01_SingleDigitStringsCanNotBeValid [
	| result |

	result := luhnCalculator validValue: '1' .
	self assert: result equals: false
]

{ #category : #tests }
LuhnTest >> test02_ASingleZeroIsInvalid [
	| result |

	result := luhnCalculator validValue: '0' .
	self assert: result equals: false
]

{ #category : #tests }
LuhnTest >> test03_ASimpleValidSINThatRemainsValidIfReversed [
	| result |

	result := luhnCalculator validValue: '059' .
	self assert: result equals: true
]

{ #category : #tests }
LuhnTest >> test04_ASimpleValidSINThatBecomesInvalidIfReversed [
	| result |

	result := luhnCalculator validValue: '59' .
	self assert: result equals: true
]

{ #category : #tests }
LuhnTest >> test05_AValidCanadianSIN [
	| result |

	result := luhnCalculator validValue: '055 444 285' .
	self assert: result equals: true
]

{ #category : #tests }
LuhnTest >> test06_InvalidCanadianSIN [
	| result |

	result := luhnCalculator validValue: '055 444 286' .
	self assert: result equals: false
]

{ #category : #tests }
LuhnTest >> test07_InvalidCreditCard [
	| result |

	result := luhnCalculator validValue: '8273 1232 7352 0569' .
	self assert: result equals: false
]

{ #category : #tests }
LuhnTest >> test08_ValidNumberWithAnEvenNumberOfDigits [
	| result |

	result := luhnCalculator validValue: '095 245 88' .
	self assert: result equals: true
]

{ #category : #tests }
LuhnTest >> test09_ValidStringsWithANondigitAddedAtTheEndBecomeInvalid [
	| result |

	result := luhnCalculator validValue: '059a' .
	self assert: result equals: false
]

{ #category : #tests }
LuhnTest >> test10_ValidStringsWithPunctuationIncludedBecomeInvalid [
	| result |

	result := luhnCalculator validValue: '055-444-285' .
	self assert: result equals: false
]

{ #category : #tests }
LuhnTest >> test11_ValidStringsWithSymbolsIncludedBecomeInvalid [
	| result |

	result := luhnCalculator validValue: '055£ 444$ 285' .
	self assert: result equals: false
]

{ #category : #tests }
LuhnTest >> test12_SingleZeroWithSpaceIsInvalid [
	| result |

	result := luhnCalculator validValue: ' 0' .
	self assert: result equals: false
]

{ #category : #tests }
LuhnTest >> test13_MoreThanASingleZeroIsValid [
	| result |

	result := luhnCalculator validValue: '0000 0' .
	self assert: result equals: true
]

{ #category : #tests }
LuhnTest >> test14_InputDigit9IsCorrectlyConvertedToOutputDigit9 [
	| result |

	result := luhnCalculator validValue: '091' .
	self assert: result equals: true
]

{ #category : #tests }
LuhnTest >> test15_UsingAsciiValueForNondoubledNondigitIsntAllowed [
	| result |

	result := luhnCalculator validValue: '055b 444 285' .
	self assert: result equals: false
]

{ #category : #tests }
LuhnTest >> test16_UsingAsciiValueForDoubledNondigitIsntAllowed [
	| result |

	result := luhnCalculator validValue: ':9' .
	self assert: result equals: false
]
