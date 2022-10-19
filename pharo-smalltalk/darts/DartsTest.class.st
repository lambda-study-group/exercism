"
# Darts

Write a function that returns the earned points in a single toss of a Darts game.

[Darts](https://en.wikipedia.org/wiki/Darts) is a game where players
throw darts to a [target](https://en.wikipedia.org/wiki/Darts#/media/File:Darts_in_a_dartboard.jpg).

In our particular instance of the game, the target rewards with 4 different amounts of points, depending on where the dart lands:

* If the dart lands outside the target, player earns no points (0 points).
* If the dart lands in the outer circle of the target, player earns 1 point.
* If the dart lands in the middle circle of the target, player earns 5 points.
* If the dart lands in the inner circle of the target, player earns 10 points.

The outer circle has a radius of 10 units (This is equivalent to the total radius for the entire target), the middle circle a radius of 5 units, and the inner circle a radius of 1. Of course, they are all centered to the same point (That is, the circles are [concentric](http://mathworld.wolfram.com/ConcentricCircles.html)) defined by the coordinates (0, 0).

Write a function that given a point in the target (defined by its `real` cartesian coordinates `x` and `y`), returns the correct amount earned by a dart landing in that point.

## Hint

The Pythagorean theorum will help.

"
Class {
	#name : #DartsTest,
	#superclass : #ExercismTest,
	#instVars : [
		'dartsCalculator'
	],
	#category : #'Exercise@Darts'
}

{ #category : #config }
DartsTest class >> exercise [
	"Answer the configured exercise meta data for this exercise, an ExercismExercise"

	^ (self createExerciseAfter: LeapTest)
		isCore: false;
		difficulty: 2;
		topics: #('conditionals' 'math');
		yourself
]

{ #category : #config }
DartsTest class >> uuid [
	"Answer a unique id for this exercise"
	^'98fc253b-e642-0d00-8e1a-5ef3059054ed'
]

{ #category : #config }
DartsTest class >> version [
	"Generated from specification: 14 April 2019"
	^'1.2.1'
]

{ #category : #running }
DartsTest >> setUp [
	super setUp.
	dartsCalculator := Darts new
]

{ #category : #tests }
DartsTest >> test01_ADartLandsOutsideTheTarget [
	| result |

	result := dartsCalculator scoreX:  -9 y: 9 .
	self assert: result equals: 0
]

{ #category : #tests }
DartsTest >> test02_ADartLandsJustInTheBorderOfTheTarget [
	| result |

	result := dartsCalculator scoreX: 0 y: 10 .
	self assert: result equals: 1
]

{ #category : #tests }
DartsTest >> test03_ADartLandsInTheOuterCircle [
	| result |

	result := dartsCalculator scoreX: 4 y: 4 .
	self assert: result equals: 1
]

{ #category : #tests }
DartsTest >> test04_ADartLandsRightInTheBorderBetweenOuterAndMiddleCircles [
	| result |

	result := dartsCalculator scoreX: 5 y: 0 .
	self assert: result equals: 5
]

{ #category : #tests }
DartsTest >> test05_ADartLandsInTheMiddleCircle [
	| result |

	result := dartsCalculator scoreX: 0.8 y:  -0.8 .
	self assert: result equals: 5
]

{ #category : #tests }
DartsTest >> test06_ADartLandsRightInTheBorderBetweenMiddleAndInnerCircles [
	| result |

	result := dartsCalculator scoreX: 0 y:  -1 .
	self assert: result equals: 10
]

{ #category : #tests }
DartsTest >> test07_ADartLandsInTheInnerCircle [
	| result |

	result := dartsCalculator scoreX:  -0.1 y:  -0.1 .
	self assert: result equals: 10
]

{ #category : #tests }
DartsTest >> test08_ADartWhoseCoordinatesSumToGreaterThan1ButWhoseRadiusToOriginIsLessThanOrEqualTo1IsScoredInTheInnerCircle [
	| result |

	result := dartsCalculator scoreX: 0.4 y: 0.8 .
	self assert: result equals: 10
]

{ #category : #tests }
DartsTest >> test09_ADartWhoseCoordinatesSumToGreaterThan5ButWhoseRadiusToOriginIsLessThanOrEqualTo5IsScoredInTheMiddleCircle [
	| result |

	result := dartsCalculator scoreX: 2 y: 4 .
	self assert: result equals: 5
]

{ #category : #tests }
DartsTest >> test10_ADartWhoseCoordinatesSumToGreaterThan10ButWhoseRadiusToOriginIsLessThanOrEqualTo10IsScoredInTheOuterCircle [
	| result |

	result := dartsCalculator scoreX: 4 y: 8 .
	self assert: result equals: 1
]
