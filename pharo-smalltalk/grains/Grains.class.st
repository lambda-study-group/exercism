Class {
	#name : #Grains,
	#superclass : #Object,
	#category : #'Exercise@Grains'
}

{ #category : #exercism }
Grains >> atSquare: n [
	"Return the number of grains on square n"	
			
	(n between: 1 and: 64)
	ifTrue: [ ^1 bitShift: (n-1) ]
	ifFalse: [ self error: 'square must be between 1 and 64' ].
]

{ #category : #exercism }
Grains >> total [
	"Return the total number of grains on the board"	
			
	^(1 bitShift: 64) - 1.
]
