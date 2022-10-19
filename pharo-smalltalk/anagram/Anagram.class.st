Class {
	#name : #Anagram,
	#superclass : #Object,
	#category : #'Exercise@Anagram'
}

{ #category : #'as yet unclassified' }
Anagram >> findAnagramsCandidates: aCollection subject: aString [ 
	|bag|
	bag := aString asLowercase asBag.
	^aCollection select: [ :item | (item asLowercase ~= aString asLowercase) and: (item asLowercase asBag = bag) ].
]
