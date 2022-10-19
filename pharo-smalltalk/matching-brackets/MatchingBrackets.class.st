Class {
	#name : #MatchingBrackets,
	#superclass : #Object,
	#classVars : [
		'DelimiterPairs'
	],
	#category : #'Exercise@MatchingBrackets'
}

{ #category : #initialization }
MatchingBrackets >> initialize [
	
	DelimiterPairs := Dictionary new.
	DelimiterPairs at: $) put: $(;
		at: $] put: $[;
		at: $} put: ${.
]

{ #category : #exercism }
MatchingBrackets >> isPaired: aString [
	"Check if the parentheses, brackets and braces are balanced in the provided string"	

	| s |
	s := Stack new.
	aString do: [ :c | 
			('([{' includes: c)
				ifTrue: [ s push: c ].
			(')]}' includes: c)
				ifTrue: [ ((s isNotEmpty) and: [((s top) = (DelimiterPairs at: c))])
					ifTrue: [ s pop ]
					ifFalse: [ ^false ] ] ].
	^s isEmpty.
]
