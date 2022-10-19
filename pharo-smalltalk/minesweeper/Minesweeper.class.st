Class {
	#name : #Minesweeper,
	#superclass : #Object,
	#classVars : [
		'directions'
	],
	#category : #'Exercise@Minesweeper'
}

{ #category : #'class initialization' }
Minesweeper class >> initialize [ 
	
	"Array spanning all possible directions of motion - vertical, horizontal and diagonal"
	directions := { 
		(-1 @ -1) . (0 @ -1) . (1 @ -1) .
		(-1 @ 0) . (1 @ 0) .
		(-1 @ 1) . (0 @ 1) . (1 @ 1)
	}
]

{ #category : #exercism }
Minesweeper >> annotateMinefield: anArray [
	"Process a minefield array to contain the numbers of mines in neighboring fields"	

	| rows columns |
	rows := anArray size.
	columns := (rows isZero) ifTrue: [ 0 ] ifFalse: [ (anArray at: 1) size ].
	^(1 to: rows) collect: [ :row | 
		(1 to: columns) collect: [ :col |
			self processPoint: (col @ row) in: anArray ] as:String ].
]

{ #category : #'as yet unclassified' }
Minesweeper >> countMinesAround: aPoint in: anArray [
	"Return the number of mines in a minefield directly neighboring the specified point"	
	
	| minesAround neighbor rows columns |		
	rows := anArray size.
	columns := (rows isZero) ifTrue: [ 0 ] ifFalse: [ (anArray at: 1) size ].
	minesAround := 0.
	directions do: [ :dir | "Iterate through all possible directions"
		neighbor := aPoint + dir.
		(((neighbor x) between: 1 and: columns) & ((neighbor y) between: 1 and: rows))
		"Only consider neighbors within the array"
			ifTrue: [ (((anArray at: (neighbor y)) at: (neighbor x)) = $*)
				"Increment counter when neighbor contains a mine"
				ifTrue: [ minesAround := minesAround + 1 ] ] ].
	^minesAround.
]

{ #category : #exercism }
Minesweeper >> processPoint: aPoint in: anArray [
	"Return appropriate character based on the point's content and its neighborhood"	
	| row col |
	row := aPoint y.
	col := aPoint x.	
	^(((anArray at: row) at: col) = $*)
		ifTrue: [ $* ] "If field contains a mine, do nothing"
		ifFalse: [ | minesAround currPt | "Otherwise, print the number of neighboring mines if non-zero"
			currPt := col @ row.
			minesAround := self countMinesAround: currPt in: anArray.
			minesAround isZero
				ifTrue: [ $  ]
				ifFalse: [ (($0 asciiValue)+minesAround) asCharacter ] ].
]
