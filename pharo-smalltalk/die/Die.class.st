Class {
	#name : #Die,
	#superclass : #Object,
	#instVars : [
		'faces'
	],
	#category : #'Exercise@Die'
}

{ #category : #'as yet unclassified' }
Die class >> withFaces: anInteger [ 
	^self new
		faces: anInteger.

]

{ #category : #exercism }
Die >> faces [
	"Return the number of faces in a die"
	
	^faces.
]

{ #category : #accessing }
Die >> faces: anInteger [
	"Set the number of faces on a die"

	faces := anInteger.
]

{ #category : #initialization }
Die >> initialize [
	"6 faces by default"

	faces := 6.
]

{ #category : #'as yet unclassified' }
Die >> roll [
	"Choose a random face"

	^faces atRandom.
]
