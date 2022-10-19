Class {
	#name : #Sieve,
	#superclass : #Object,
	#category : #'Exercise@Sieve'
}

{ #category : #'as yet unclassified' }
Sieve >> primesLimit: anInteger [ 
	^Integer primesUpTo: (anInteger+1).
]
