"
# Roman Numerals

Write a function to convert from normal numbers to Roman Numerals.

The Romans were a clever bunch. They conquered most of Europe and ruled
it for hundreds of years. They invented concrete and straight roads and
even bikinis. One thing they never discovered though was the number
zero. This made writing and dating extensive histories of their exploits
slightly more challenging, but the system of numbers they came up with
is still in use today. For example the BBC uses Roman numerals to date
their programmes.

The Romans wrote numbers using letters - I, V, X, L, C, D, M. (notice
these letters have lots of straight lines and are hence easy to hack
into stone tablets).

```text
 1  => I
10  => X
 7  => VII
```

There is no need to be able to convert numbers larger than about 3000.
(The Romans themselves didn't tend to go any higher)

Wikipedia says: Modern Roman numerals ... are written by expressing each
digit separately starting with the left most digit and skipping any
digit with a value of zero.

To see this in practice, consider the example of 1990.

In Roman numerals 1990 is MCMXC:

1000=M
900=CM
90=XC

2008 is written as MMVIII:

2000=MM
8=VIII

See also: http://www.novaroma.org/via_romana/numbers.html

## Hint

This exercise uses techniques from several of the others, but also requires some conditional looping.

"
Class {
	#name : #RomanNumeralsTest,
	#superclass : #ExercismTest,
	#instVars : [
		'romanNumeralsCalculator'
	],
	#category : #'Exercise@RomanNumerals'
}

{ #category : #config }
RomanNumeralsTest class >> exercise [
	"Answer the configured exercise meta data for this exercise, an ExercismExercise"
	
	^(self createExerciseAfter: ReverseStringTest)
		isCore: false;
		difficulty: 3;
		topics: #('iteration' 'maps' 'transforming');
		yourself
]

{ #category : #config }
RomanNumeralsTest class >> uuid [
	"Answer a unique id for this exercise"
	^'973e4910-7940-0d00-bbad-09db01dff3c9'
]

{ #category : #config }
RomanNumeralsTest class >> version [
	"Generated from specification: 15 March 2019"
	^'1.2.0'
]

{ #category : #running }
RomanNumeralsTest >> setUp [
	super setUp.
	romanNumeralsCalculator := RomanNumerals new
]

{ #category : #tests }
RomanNumeralsTest >> test01_1IsASingleI [
	| result |

	result := romanNumeralsCalculator romanNumber: 1 .
	self assert: result equals: 'I'
]

{ #category : #tests }
RomanNumeralsTest >> test02_2IsTwoIs [
	| result |

	result := romanNumeralsCalculator romanNumber: 2 .
	self assert: result equals: 'II'
]

{ #category : #tests }
RomanNumeralsTest >> test03_3IsThreeIs [
	| result |

	result := romanNumeralsCalculator romanNumber: 3 .
	self assert: result equals: 'III'
]

{ #category : #tests }
RomanNumeralsTest >> test04_4Being51IsIV [
	| result |

	result := romanNumeralsCalculator romanNumber: 4 .
	self assert: result equals: 'IV'
]

{ #category : #tests }
RomanNumeralsTest >> test05_5IsASingleV [
	| result |

	result := romanNumeralsCalculator romanNumber: 5 .
	self assert: result equals: 'V'
]

{ #category : #tests }
RomanNumeralsTest >> test06_6Being51IsVI [
	| result |

	result := romanNumeralsCalculator romanNumber: 6 .
	self assert: result equals: 'VI'
]

{ #category : #tests }
RomanNumeralsTest >> test07_9Being101IsIX [
	| result |

	result := romanNumeralsCalculator romanNumber: 9 .
	self assert: result equals: 'IX'
]

{ #category : #tests }
RomanNumeralsTest >> test08_20IsTwoXs [
	| result |

	result := romanNumeralsCalculator romanNumber: 27 .
	self assert: result equals: 'XXVII'
]

{ #category : #tests }
RomanNumeralsTest >> test09_48IsNot502ButRather408 [
	| result |

	result := romanNumeralsCalculator romanNumber: 48 .
	self assert: result equals: 'XLVIII'
]

{ #category : #tests }
RomanNumeralsTest >> test10_49IsNot4054ButRather5010101 [
	| result |

	result := romanNumeralsCalculator romanNumber: 49 .
	self assert: result equals: 'XLIX'
]

{ #category : #tests }
RomanNumeralsTest >> test11_50IsASingleL [
	| result |

	result := romanNumeralsCalculator romanNumber: 59 .
	self assert: result equals: 'LIX'
]

{ #category : #tests }
RomanNumeralsTest >> test12_90Being10010IsXC [
	| result |

	result := romanNumeralsCalculator romanNumber: 93 .
	self assert: result equals: 'XCIII'
]

{ #category : #tests }
RomanNumeralsTest >> test13_100IsASingleC [
	| result |

	result := romanNumeralsCalculator romanNumber: 141 .
	self assert: result equals: 'CXLI'
]

{ #category : #tests }
RomanNumeralsTest >> test14_60Being5010IsLX [
	| result |

	result := romanNumeralsCalculator romanNumber: 163 .
	self assert: result equals: 'CLXIII'
]

{ #category : #tests }
RomanNumeralsTest >> test15_400Being500100IsCD [
	| result |

	result := romanNumeralsCalculator romanNumber: 402 .
	self assert: result equals: 'CDII'
]

{ #category : #tests }
RomanNumeralsTest >> test16_500IsASingleD [
	| result |

	result := romanNumeralsCalculator romanNumber: 575 .
	self assert: result equals: 'DLXXV'
]

{ #category : #tests }
RomanNumeralsTest >> test17_900Being1000100IsCM [
	| result |

	result := romanNumeralsCalculator romanNumber: 911 .
	self assert: result equals: 'CMXI'
]

{ #category : #tests }
RomanNumeralsTest >> test18_1000IsASingleM [
	| result |

	result := romanNumeralsCalculator romanNumber: 1024 .
	self assert: result equals: 'MXXIV'
]

{ #category : #tests }
RomanNumeralsTest >> test19_3000IsThreeMs [
	| result |

	result := romanNumeralsCalculator romanNumber: 3000 .
	self assert: result equals: 'MMM'
]
