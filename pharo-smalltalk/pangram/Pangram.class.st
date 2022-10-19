Class {
	#name : #Pangram,
	#superclass : #Object,
	#category : #'Exercise@Pangram'
}

{ #category : #'as yet unclassified' }
Pangram >> isPangramSentence: aString [ 
	^(($a to: $z) asSet difference: aString asLowercase asSet) isEmpty.
]
