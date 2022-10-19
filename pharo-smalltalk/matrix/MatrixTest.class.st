"
# Matrix

Given a string representing a matrix of numbers, return the rows and columns of
that matrix.

So given a string with embedded newlines like:

```text
9 8 7
5 3 2
6 6 7
```

representing this matrix:

```text
    1  2  3
  |---------
1 | 9  8  7
2 | 5  3  2
3 | 6  6  7
```

your code should be able to spit out:

- A list of the rows, reading each row left-to-right while moving
  top-to-bottom across the rows,
- A list of the columns, reading each column top-to-bottom while moving
  from left-to-right.

The rows for our example matrix:

- 9, 8, 7
- 5, 3, 2
- 6, 6, 7

And its columns:

- 9, 5, 6
- 8, 3, 6
- 7, 2, 7

## Hint

Try using the Finder - Examples searcher, to see if there is a useful method for parsing.

"
Class {
	#name : #MatrixTest,
	#superclass : #ExercismTest,
	#instVars : [
		'matrixCalculator'
	],
	#category : #'Exercise@Matrix'
}

{ #category : #config }
MatrixTest class >> exercise [
	"Answer the configured exercise meta data for this exercise, an ExercismExercise"
	
	^(self createExerciseAfter: AllergiesTest)
		isCore: true;
		difficulty: 4;
		topics: #('matrices' 'parsing');
		yourself
	
]

{ #category : #config }
MatrixTest class >> generator [
	"Potential generator hints"

	^ {('@Matrix' -> '#MatrixReader').
	('@columnString:index:' -> '#input:atColumn:').
	('@rowString:index:' -> '#input:atRow:')}
]

{ #category : #config }
MatrixTest class >> uuid [
	"Answer a unique id for this exercise"
	^'bea80017-9d41-0d00-900d-a13308866539'
]

{ #category : #config }
MatrixTest class >> version [
	"Generated from specification: 29 March 2019"
	^'1.1.0'
]

{ #category : #running }
MatrixTest >> setUp [
	super setUp.
	matrixCalculator := MatrixReader new
]

{ #category : #tests }
MatrixTest >> test01_ExtractRowFromOneNumberMatrix [
	| result |

	result := matrixCalculator input: '1' atRow: 1 .
	self assert: result equals: #(1 )
]

{ #category : #tests }
MatrixTest >> test02_CanExtractRow [
	| result |

	result := matrixCalculator input: '1 2
3 4' atRow: 2 .
	self assert: result equals: #(3 4 )
]

{ #category : #tests }
MatrixTest >> test03_ExtractRowWhereNumbersHaveDifferentWidths [
	| result |

	result := matrixCalculator input: '1 2
10 20' atRow: 2 .
	self assert: result equals: #(10 20 )
]

{ #category : #tests }
MatrixTest >> test04_CanExtractRowFromNonsquareMatrix [
	| result |

	result := matrixCalculator input: '1 2 3
4 5 6
7 8 9
8 7 6' atRow: 3 .
	self assert: result equals: #(7 8 9 )
]

{ #category : #tests }
MatrixTest >> test05_ExtractColumnFromOneNumberMatrix [
	| result |

	result := matrixCalculator input: '1' atColumn: 1 .
	self assert: result equals: #(1 )
]

{ #category : #tests }
MatrixTest >> test06_CanExtractColumn [
	| result |

	result := matrixCalculator input: '1 2 3
4 5 6
7 8 9' atColumn: 3 .
	self assert: result equals: #(3 6 9 )
]

{ #category : #tests }
MatrixTest >> test07_CanExtractColumnFromNonsquareMatrix [
	| result |

	result := matrixCalculator input: '1 2 3
4 5 6
7 8 9
8 7 6' atColumn: 3 .
	self assert: result equals: #(3 6 9 6 )
]

{ #category : #tests }
MatrixTest >> test08_ExtractColumnWhereNumbersHaveDifferentWidths [
	| result |

	result := matrixCalculator input: '89 1903 3
18 3 1
9 4 800' atColumn: 2 .
	self assert: result equals: #(1903 3 4 )
]
