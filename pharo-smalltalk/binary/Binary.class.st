Class {
	#name : #Binary,
	#superclass : #Object,
	#category : #'Exercise@Binary'
}

{ #category : #'as yet unclassified' }
Binary >> decimalFromBinary: aString [ 
	|dec|
	dec := 0.
	aString do: [ :d |
		('01' includes: d)
			ifTrue: [ dec := dec * 2 + ((d codePoint)-($0 codePoint)) ]
			ifFalse: [ ^nil ]].
	^dec.
	

]
