"
# Collatz Conjecture

The Collatz Conjecture or 3x+1 problem can be summarized as follows:

Take any positive integer n. If n is even, divide n by 2 to get n / 2. If n is
odd, multiply n by 3 and add 1 to get 3n + 1. Repeat the process indefinitely.
The conjecture states that no matter which number you start with, you will
always reach 1 eventually.

Given a number n, return the number of steps required to reach 1.

## Examples

Starting with n = 12, the steps would be as follows:

0. 12
1. 6
2. 3
3. 10
4. 5
5. 16
6. 8
7. 4
8. 2
9. 1

Resulting in 9 steps. So for input n = 12, the return value would be 9.

## Hint

This is nicely suited for recursion

"
Class {
	#name : #CollatzConjectureTest,
	#superclass : #ExercismTest,
	#instVars : [
		'collatzConjectureCalculator'
	],
	#category : #'Exercise@CollatzConjecture'
}

{ #category : #config }
CollatzConjectureTest class >> exercise [
	"Answer the configured exercise meta data for this exercise, an ExercismExercise"

	^ (self createExerciseAfter: GrainsTest)
		isCore: false;
		difficulty: 2;
		topics:
			#('recursion' 'control_flow' 'math');
		yourself
]

{ #category : #generator }
CollatzConjectureTest class >> generator [
	"Potential generator hints"
	
	^ {('@stepsNumber:' -> #stepsFrom:)}
]

{ #category : #config }
CollatzConjectureTest class >> uuid [
	"Answer a unique id for this exercise"
	^'0dc70bf9-e642-0d00-8e2f-4d97059054ed'
]

{ #category : #config }
CollatzConjectureTest class >> version [
	"Generated from specification: 14 April 2019"
	^'1.2.1'
]

{ #category : #running }
CollatzConjectureTest >> setUp [
	super setUp.
	collatzConjectureCalculator := CollatzConjecture new
]

{ #category : #tests }
CollatzConjectureTest >> test01_ZeroStepsForOne [
	| result |

	result := collatzConjectureCalculator stepsFrom: 1 .
	self assert: result equals: 0
]

{ #category : #tests }
CollatzConjectureTest >> test02_DivideIfEven [
	| result |

	result := collatzConjectureCalculator stepsFrom: 16 .
	self assert: result equals: 4
]

{ #category : #tests }
CollatzConjectureTest >> test03_EvenAndOddSteps [
	| result |

	result := collatzConjectureCalculator stepsFrom: 12 .
	self assert: result equals: 9
]

{ #category : #tests }
CollatzConjectureTest >> test04_LargeNumberOfEvenAndOddSteps [
	| result |
	
	result := collatzConjectureCalculator stepsFrom: 1000000.
	self assert: result equals: 152
]

{ #category : #tests }
CollatzConjectureTest >> test05_ZeroIsAnError [
	| result |

	self
		should: [ result := collatzConjectureCalculator stepsFrom: 0 ]
		raise: Error
		whoseDescriptionIncludes: 'Only positive numbers are allowed'
		description: 'Should get an error with the correct description'
]

{ #category : #tests }
CollatzConjectureTest >> test06_NegativeValueIsAnError [
	| result |

	self
		should: [ result := collatzConjectureCalculator stepsFrom:  -15 ]
		raise: Error
		whoseDescriptionIncludes: 'Only positive numbers are allowed'
		description: 'Should get an error with the correct description'
]
