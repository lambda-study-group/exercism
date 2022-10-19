Class {
	#name : #IsbnVerifier,
	#superclass : #Object,
	#category : #'Exercise@IsbnVerifier'
}

{ #category : #'as yet unclassified' }
IsbnVerifier >> isValidIsbn: aString [ 
	|controlSum i|
	controlSum := 0.
	i := 0.
	aString do: [ :c | 
		i >= 10
			ifTrue: [ ^false ].
		c isDigit
			ifTrue: [ i := i + 1.
						 controlSum := controlSum + ((c charCode - $0 charCode) * i) ]
			ifFalse: [ (('Xx' includes: c) and: (i = 9))
						  		ifTrue: [ i := i + 1.
									       controlSum := controlSum + (10*i) ]
								ifFalse: [ c = $-												
												ifFalse: [ ^false ] ] ] ].
	i ~= 10
		ifTrue: [ ^false ].
	^controlSum \\ 11 = 0.
]
