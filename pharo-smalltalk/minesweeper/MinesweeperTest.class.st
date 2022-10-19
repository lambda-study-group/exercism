"
# Minesweeper

Add the numbers to a minesweeper board.

Minesweeper is a popular game where the user has to find the mines using
numeric hints that indicate how many mines are directly adjacent
(horizontally, vertically, diagonally) to a square.

In this exercise you have to create some code that counts the number of
mines adjacent to a square and transforms boards like this (where `*`
indicates a mine):

    +-----+
    | * * |
    |  *  |
    |  *  |
    |     |
    +-----+

into this:

    +-----+
    |1*3*1|
    |13*31|
    | 2*2 |
    | 111 |
    +-----+

## Hint

x,y locations are often represented as a Point, which then leads to some useful point functions that can help with this. Alternatively, representing this as a 2D Array can also be useful. Either way,  defining some descriptive extension methods that can make your solution much more readable and elegant.

"
Class {
	#name : #MinesweeperTest,
	#superclass : #ExercismTest,
	#instVars : [
		'minesweeperCalculator'
	],
	#category : #'Exercise@Minesweeper'
}

{ #category : #config }
MinesweeperTest class >> exercise [
	"Answer the configured exercise meta data for this exercise, an ExercismExercise"
	
	^(self createExerciseAfter: AllergiesTest)
		isCore: false;
		difficulty: 5;
		topics: #('parsing' 'iteration' 'transforming');
		yourself
	
]

{ #category : #config }
MinesweeperTest class >> uuid [
	"Answer a unique id for this exercise"
	^'1318c616-9d41-0d00-8fe3-676108866539'
]

{ #category : #config }
MinesweeperTest class >> version [
	"Generated from specification: 29 March 2019"
	^'1.1.0'
]

{ #category : #running }
MinesweeperTest >> setUp [
	super setUp.
	minesweeperCalculator := Minesweeper new
]

{ #category : #tests }
MinesweeperTest >> test01_NoRows [
	| result |

	result := minesweeperCalculator annotateMinefield: #() .
	self assert: result equals: #()
]

{ #category : #tests }
MinesweeperTest >> test02_NoColumns [
	| result |

	result := minesweeperCalculator annotateMinefield: #('' ) .
	self assert: result equals: #('' )
]

{ #category : #tests }
MinesweeperTest >> test03_NoMines [
	| result |

	result := minesweeperCalculator annotateMinefield: #('   ' '   ' '   ' ) .
	self assert: result equals: #('   ' '   ' '   ' )
]

{ #category : #tests }
MinesweeperTest >> test04_MinefieldWithOnlyMines [
	| result |

	result := minesweeperCalculator annotateMinefield: #('***' '***' '***' ) .
	self assert: result equals: #('***' '***' '***' )
]

{ #category : #tests }
MinesweeperTest >> test05_MineSurroundedBySpaces [
	| result |

	result := minesweeperCalculator annotateMinefield: #('   ' ' * ' '   ' ) .
	self assert: result equals: #('111' '1*1' '111' )
]

{ #category : #tests }
MinesweeperTest >> test06_SpaceSurroundedByMines [
	| result |

	result := minesweeperCalculator annotateMinefield: #('***' '* *' '***' ) .
	self assert: result equals: #('***' '*8*' '***' )
]

{ #category : #tests }
MinesweeperTest >> test07_HorizontalLine [
	| result |

	result := minesweeperCalculator annotateMinefield: #(' * * ' ) .
	self assert: result equals: #('1*2*1' )
]

{ #category : #tests }
MinesweeperTest >> test08_HorizontalLineMinesAtEdges [
	| result |

	result := minesweeperCalculator annotateMinefield: #('*   *' ) .
	self assert: result equals: #('*1 1*' )
]

{ #category : #tests }
MinesweeperTest >> test09_VerticalLine [
	| result |

	result := minesweeperCalculator annotateMinefield: #(' ' '*' ' ' '*' ' ' ) .
	self assert: result equals: #('1' '*' '2' '*' '1' )
]

{ #category : #tests }
MinesweeperTest >> test10_VerticalLineMinesAtEdges [
	| result |

	result := minesweeperCalculator annotateMinefield: #('*' ' ' ' ' ' ' '*' ) .
	self assert: result equals: #('*' '1' ' ' '1' '*' )
]

{ #category : #tests }
MinesweeperTest >> test11_Cross [
	| result |

	result := minesweeperCalculator annotateMinefield: #('  *  ' '  *  ' '*****' '  *  ' '  *  ' ) .
	self assert: result equals: #(' 2*2 ' '25*52' '*****' '25*52' ' 2*2 ' )
]

{ #category : #tests }
MinesweeperTest >> test12_LargeMinefield [
	| result |

	result := minesweeperCalculator annotateMinefield: #(' *  * ' '  *   ' '    * ' '   * *' ' *  * ' '      ' ) .
	self assert: result equals: #('1*22*1' '12*322' ' 123*2' '112*4*' '1*22*2' '111111' )
]
