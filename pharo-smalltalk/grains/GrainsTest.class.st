"
# Grains

Calculate the number of grains of wheat on a chessboard given that the number
on each square doubles.

There once was a wise servant who saved the life of a prince. The king
promised to pay whatever the servant could dream up. Knowing that the
king loved chess, the servant told the king he would like to have grains
of wheat. One grain on the first square of a chess board, with the number
of grains doubling on each successive square.

There are 64 squares on a chessboard (where square 1 has one grain, square 2 has two grains, and so on).

Write code that shows:
- how many grains were on a given square, and
- the total number of grains on the chessboard

## For bonus points

Did you get the tests passing and the code clean? If you want to, these
are some additional things you could try:

- Optimize for speed.
- Optimize for readability.

Then please share your thoughts in a comment on the submission. Did this
experiment make the code better? Worse? Did you learn anything from it?

## Hint

These kinds of problems (where an answer is dependent on a previous) one are often called recursion. There are different ways to code for recursion, it might be worth reasearching if you are not familiar with this. Pharo is well optimised for recursion, and it is a commonly used pattern.

Note: in the original problem specification, the grainsCalculator is called via #square, however we have renamed this method #atSquare: which is a more Smalltalk like name, that better describes that you are asking for an answer ""at a square"".  

"
Class {
	#name : #GrainsTest,
	#superclass : #ExercismTest,
	#instVars : [
		'grainsCalculator'
	],
	#category : #'Exercise@Grains'
}

{ #category : #config }
GrainsTest class >> exercise [
	"Answer the configured exercise meta data for this exercise, an ExercismExercise"
	
	^(self createExerciseAfter: IsogramTest)
		isCore: true;
		difficulty: 2;
		topics: #('math' 'recursion');
		yourself

]

{ #category : #config }
GrainsTest class >> uuid [
	"Answer a unique id for this exercise"
	^'93dde1bb-8040-0d00-812a-052301deb008'
]

{ #category : #config }
GrainsTest class >> version [
	"Generated from specification: 15 March 2019"
	^'1.2.0'
]

{ #category : #running }
GrainsTest >> setUp [
	super setUp.
	grainsCalculator := Grains new
]

{ #category : #tests }
GrainsTest >> test01_ReturnsTheNumberOfGrainsOnTheSquareAt1 [
	| result |

	result := grainsCalculator atSquare: 1 .
	self assert: result equals: 1
]

{ #category : #tests }
GrainsTest >> test02_ReturnsTheNumberOfGrainsOnTheSquareAt2 [
	| result |

	result := grainsCalculator atSquare: 2 .
	self assert: result equals: 2
]

{ #category : #tests }
GrainsTest >> test03_ReturnsTheNumberOfGrainsOnTheSquareAt3 [
	| result |

	result := grainsCalculator atSquare: 3 .
	self assert: result equals: 4
]

{ #category : #tests }
GrainsTest >> test04_ReturnsTheNumberOfGrainsOnTheSquareAt4 [
	| result |

	result := grainsCalculator atSquare: 4 .
	self assert: result equals: 8
]

{ #category : #tests }
GrainsTest >> test05_ReturnsTheNumberOfGrainsOnTheSquareAt16 [
	| result |

	result := grainsCalculator atSquare: 16 .
	self assert: result equals: 32768
]

{ #category : #tests }
GrainsTest >> test06_ReturnsTheNumberOfGrainsOnTheSquareAt32 [
	| result |

	result := grainsCalculator atSquare: 32 .
	self assert: result equals: 2147483648
]

{ #category : #tests }
GrainsTest >> test07_ReturnsTheNumberOfGrainsOnTheSquareAt64 [
	| result |

	result := grainsCalculator atSquare: 64 .
	self assert: result equals: 9223372036854775808
]

{ #category : #tests }
GrainsTest >> test08_ReturnsTheNumberOfGrainsOnTheSquareSquare0RaisesAnException [
	self
		should: [grainsCalculator atSquare: 0]
		raise: Error
		whoseDescriptionIncludes: 'square must be between 1 and 64'
		description: 'Should get an error with the correct description'.
		
		
		

]

{ #category : #tests }
GrainsTest >> test09_ReturnsTheNumberOfGrainsOnTheSquareNegativeSquareRaisesAnException [
	self
		should: [grainsCalculator atSquare: -1]
		raise: Error
		whoseDescriptionIncludes: 'square must be between 1 and 64'
		description: 'Should get an error with the correct description'.
]

{ #category : #tests }
GrainsTest >> test10_ReturnsTheNumberOfGrainsOnTheSquareSquareGreaterThan64RaisesAnException [
	self
		should: [grainsCalculator atSquare: 65]
		raise: Error
		whoseDescriptionIncludes: 'square must be between 1 and 64'
		description: 'Should get an error with the correct description'.
]

{ #category : #tests }
GrainsTest >> test11_ReturnsTheTotalNumberOfGrainsOnTheBoard [
	| result |

	result := grainsCalculator total.
	self assert: result equals: 18446744073709551615
]
