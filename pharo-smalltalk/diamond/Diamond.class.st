Class {
	#name : #Diamond,
	#superclass : #Object,
	#category : #'Exercise@Diamond'
}

{ #category : #'as yet unclassified' }
Diamond >> rowsLetter: aString [ 
	|lettersAboveA side genRow result|
	lettersAboveA := aString first charCode - $A charCode.
	side := 2 * lettersAboveA + 1.
	result := OrderedCollection new.
	genRow := [ :c | 
		|ch|
		ch := ($A charCode + c) asCharacter.
		(String new: side withAll: $ )
			 at: lettersAboveA + 1 - c put: ch;
			 at: lettersAboveA + 1 + c put: ch;
			 yourself].
	0 to: lettersAboveA - 1 do: [ :i | result addLast: (genRow value: i) ].
	result addLast: (genRow value: lettersAboveA).
	lettersAboveA - 1 to: 0 by: -1 do: [ :i | result addLast: (genRow value: i) ].
	^result asArray.
]
