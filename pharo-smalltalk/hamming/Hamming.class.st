Class {
	#name : #Hamming,
	#superclass : #Object,
	#category : #'Exercise@Hamming'
}

{ #category : #'as yet unclassified' }
Hamming >> distanceStrand1: aString strand2: aString2 [ 	
	(aString size) ~= (aString2 size)
		ifTrue: [ aString isEmpty
					 	ifTrue: [ self error: 'left strand must not be empty' ].
					 aString2 isEmpty
						ifTrue: [ self error: 'right strand must not be empty' ].
					 self error: 'left and right strands must be of equal length' ].
	^aString size - (aString howManyMatch: aString2).
]
