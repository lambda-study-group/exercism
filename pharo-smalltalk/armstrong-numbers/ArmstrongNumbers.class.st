Class {
	#name : #ArmstrongNumbers,
	#superclass : #Object,
	#category : #'Exercise@ArmstrongNumbers'
}

{ #category : #exercism }
ArmstrongNumbers >> isArmstrongNumber: aNumber [
	"Check if a number satisfies the Armstrong property"	
			
	| digits |
	digits := self numberToDigits: aNumber.
	^(digits inject: 0 into: [ :a :b | a + (b raisedTo: (digits size)) ]) = aNumber.
]

{ #category : #utility }
ArmstrongNumbers >> numberToDigits: n [
	"Convert a number to an array of digits"	
			
	| d nn st |
	nn := n.
	st := WriteStream on: Array new.
	[ d := nn \\ 10. nn isZero ] whileFalse: [ st nextPut: d. nn := nn // 10 ].
	st isEmpty
		ifTrue: [ ^#(0) ]
		ifFalse: [ ^(st contents) reverse ].
]
