Class {
	#name : #CollatzConjecture,
	#superclass : #Object,
	#category : #'Exercise@CollatzConjecture'
}

{ #category : #'as yet unclassified' }
CollatzConjecture >> stepsFrom: anInteger [
	|i n| 
	anInteger <= 0
		ifTrue: [ self error: 'Only positive numbers are allowed' ].
	i := anInteger.
	n := 0.
	[ i > 1 ] whileTrue: [ 
		n := n + 1.
		i := (i even 
			ifTrue: [ i // 2 ]
			ifFalse: [ 3 * i + 1 ]).
	 ].
	^n.
]
