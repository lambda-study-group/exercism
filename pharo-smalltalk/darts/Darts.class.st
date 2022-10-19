Class {
	#name : #Darts,
	#superclass : #Object,
	#category : #'Exercise@Darts'
}

{ #category : #'as yet unclassified' }
Darts >> scoreX: anInteger y: anInteger2 [ 
	|r|
	r := (anInteger squared + anInteger2 squared) sqrt.
	r > 10
		ifTrue: [ ^0 ].
	r > 5
		ifTrue: [ ^1 ].
	r > 1
		ifTrue: [ ^5 ].
	^10.
]
