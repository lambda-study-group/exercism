Class {
	#name : #Luhn,
	#superclass : #Object,
	#category : #'Exercise@Luhn'
}

{ #category : #exercism }
Luhn >> validValue: aString [
	"Validate a number as per Luhn's formula"	
			
	| digits |
	digits := OrderedCollection new.
	"Extract digits in reverse order"
	aString reverseDo: [ :c | (c isDigit)
		ifTrue: [ digits add: (c asString asNumber) ]
		ifFalse: [ ($  = c)
			ifFalse: [ ^false ] ] ].
	"Discard sequences shorter than 2"
	((digits size) <= 1) ifTrue: [ ^false ].
	"Apply modulo trick to make the doubling more concise"
	digits := digits with: (1 to: (digits size)) collect: [ :d :n | ((n odd) | (d isZero))
		ifTrue: [ d ]
		ifFalse: [ d*2\\(-9)+9 ] ].
	^(digits sum \\ 10) isZero.
]
