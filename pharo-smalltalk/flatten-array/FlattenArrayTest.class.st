"
# Flatten Array

Take a nested list and return a single flattened list with all values except nil/null.

The challenge is to write a function that accepts an arbitrarily-deep nested list-like structure and returns a flattened structure without any nil/null values.

For Example

input: [1,[2,3,null,4],[null],5]

output: [1,2,3,4,5]

## Hint

Without using the built-in flattening method, you can derive your own, but you will need to differentiate between what is a collection and what is not. Alternatively, if you decide to use the built-in flattening methods, you will need to create a new Stream type to override incorrect behaviour.
"
Class {
	#name : #FlattenArrayTest,
	#superclass : #ExercismTest,
	#instVars : [
		'flattenArrayCalculator'
	],
	#category : #'Exercise@FlattenArray'
}

{ #category : #config }
FlattenArrayTest class >> exercise [
	"Answer the configured exercise meta data for this exercise, an ExercismExercise"

	^ (self createExerciseAfter: ReverseStringTest)
		isCore: false;
		difficulty: 2;
		topics: #('lists' 'iteration' 'recursion' 'transforming');
		yourself
]

{ #category : #config }
FlattenArrayTest class >> solutionClasses [ 
 ^{FlattenArray. FlattenArray2}
]

{ #category : #config }
FlattenArrayTest class >> uuid [
	"Answer a unique id for this exercise"
	^'aa15f716-9d41-0d00-9006-3c7208866539'
]

{ #category : #config }
FlattenArrayTest class >> version [
	"Generated from specification: 29 March 2019"
	^'1.2.0'
]

{ #category : #running }
FlattenArrayTest >> setUp [
	super setUp.
	flattenArrayCalculator := FlattenArray new
]

{ #category : #tests }
FlattenArrayTest >> test01_NoNesting [
	| result |

	result := flattenArrayCalculator flattenArray: #(0 1 2 ) .
	self assert: result equals: #(0 1 2 )
]

{ #category : #tests }
FlattenArrayTest >> test02_FlattensArrayWithJustIntegersPresent [
	| result |

	result := flattenArrayCalculator flattenArray: #(1 #(2 3 4 5 6 7 ) 8 ) .
	self assert: result equals: #(1 2 3 4 5 6 7 8 )
]

{ #category : #tests }
FlattenArrayTest >> test03_5LevelNesting [
	| result |

	result := flattenArrayCalculator flattenArray: #(0 2 #(#(2 3 ) 8 100 4 #(#(#(50 ) ) ) )  -2 ) .
	self assert: result equals: #(0 2 2 3 8 100 4 50  -2 )
]

{ #category : #tests }
FlattenArrayTest >> test04_6LevelNesting [
	| result |

	result := flattenArrayCalculator flattenArray: #(1 #(2 #(#(3 ) ) #(4 #(#(5 ) ) ) 6 7 ) 8 ) .
	self assert: result equals: #(1 2 3 4 5 6 7 8 )
]

{ #category : #tests }
FlattenArrayTest >> test05_6LevelNestListWithNullValues [
	| result |

	result := flattenArrayCalculator flattenArray: #(0 2 #(#(2 3 ) 8 #(#(100 ) ) nil #(#(nil ) ) )  -2 ) .
	self assert: result equals: #(0 2 2 3 8 100  -2 )
]

{ #category : #tests }
FlattenArrayTest >> test06_AllValuesInNestedListAreNull [
	| result |

	result := flattenArrayCalculator flattenArray: #(nil #(#(#(nil ) ) ) nil nil #(#(nil nil ) nil ) nil ) .
	self assert: result equals: #()
]
