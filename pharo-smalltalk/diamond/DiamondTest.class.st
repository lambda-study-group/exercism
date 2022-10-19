"
# Diamond

The diamond kata takes as its input a letter, and outputs it in a diamond
shape. Given a letter, it prints a diamond starting with 'A', with the
supplied letter at the widest point.

## Requirements

* The first row contains one 'A'.
* The last row contains one 'A'.
* All rows, except the first and last, have exactly two identical letters.
* All rows have as many trailing spaces as leading spaces. (This might be 0).
* The diamond is horizontally symmetric.
* The diamond is vertically symmetric.
* The diamond has a square shape (width equals height).
* The letters form a diamond shape.
* The top half has the letters in ascending order.
* The bottom half has the letters in descending order.
* The four corners (containing the spaces) are triangles.

## Examples

In the following examples, spaces are indicated by `·` characters.

Diamond for letter 'A':

```text
A
```

Diamond for letter 'C':

```text
··A··
·B·B·
C···C
·B·B·
··A··
```

Diamond for letter 'E':

```text
····A····
···B·B···
··C···C··
·D·····D·
E·······E
·D·····D·
··C···C··
···B·B···
····A····
```

## Hint

Extract clear, single purpose methods to keep your solution understandable

"
Class {
	#name : #DiamondTest,
	#superclass : #ExercismTest,
	#instVars : [
		'diamondCalculator'
	],
	#category : #'Exercise@Diamond'
}

{ #category : #config }
DiamondTest class >> exercise [
	"Answer the configured exercise meta data for this exercise, an ExercismExercise"
	
	^(self createExerciseAfter: ReverseStringTest )
		isCore: false;
		difficulty: 3;
		topics: #('strings' 'algorithms' 'lists' 'text_formatting');
		yourself
	
]

{ #category : #config }
DiamondTest class >> uuid [
	"Answer a unique id for this exercise"
	^'c0b69b16-9d41-0d00-8fbf-acfc08866539'
]

{ #category : #config }
DiamondTest class >> version [
	"Generated from specification: 29 March 2019"
	^'1.1.0'
]

{ #category : #running }
DiamondTest >> setUp [
	super setUp.
	diamondCalculator := Diamond new
]

{ #category : #tests }
DiamondTest >> test01_DegenerateCaseWithASingleARow [
	| result |

	result := diamondCalculator rowsLetter: 'A' .
	self assert: result equals: #('A' )
]

{ #category : #tests }
DiamondTest >> test02_DegenerateCaseWithNoRowContaining3DistinctGroupsOfSpaces [
	| result |

	result := diamondCalculator rowsLetter: 'B' .
	self assert: result equals: #(' A ' 'B B' ' A ' )
]

{ #category : #tests }
DiamondTest >> test03_SmallestNondegenerateCaseWithOddDiamondSideLength [
	| result |

	result := diamondCalculator rowsLetter: 'C' .
	self assert: result equals: #('  A  ' ' B B ' 'C   C' ' B B ' '  A  ' )
]

{ #category : #tests }
DiamondTest >> test04_SmallestNondegenerateCaseWithEvenDiamondSideLength [
	| result |

	result := diamondCalculator rowsLetter: 'D' .
	self assert: result equals: #('   A   ' '  B B  ' ' C   C ' 'D     D' ' C   C ' '  B B  ' '   A   ' )
]

{ #category : #tests }
DiamondTest >> test05_LargestPossibleDiamond [
	| result |

	result := diamondCalculator rowsLetter: 'Z' .
	self assert: result equals: #('                         A                         ' '                        B B                        ' '                       C   C                       ' '                      D     D                      ' '                     E       E                     ' '                    F         F                    ' '                   G           G                   ' '                  H             H                  ' '                 I               I                 ' '                J                 J                ' '               K                   K               ' '              L                     L              ' '             M                       M             ' '            N                         N            ' '           O                           O           ' '          P                             P          ' '         Q                               Q         ' '        R                                 R        ' '       S                                   S       ' '      T                                     T      ' '     U                                       U     ' '    V                                         V    ' '   W                                           W   ' '  X                                             X  ' ' Y                                               Y ' 'Z                                                 Z' ' Y                                               Y ' '  X                                             X  ' '   W                                           W   ' '    V                                         V    ' '     U                                       U     ' '      T                                     T      ' '       S                                   S       ' '        R                                 R        ' '         Q                               Q         ' '          P                             P          ' '           O                           O           ' '            N                         N            ' '             M                       M             ' '              L                     L              ' '               K                   K               ' '                J                 J                ' '                 I               I                 ' '                  H             H                  ' '                   G           G                   ' '                    F         F                    ' '                     E       E                     ' '                      D     D                      ' '                       C   C                       ' '                        B B                        ' '                         A                         ' )
]
