Class {
	#name : #Proverb,
	#superclass : #Object,
	#category : #'Exercise@Proverb'
}

{ #category : #exercism }
Proverb >> reciteStrings: anArray [
	"Return a sequence of sentences illustrating the causal chain"	
	
	| arr |
	arr := OrderedCollection new.
	anArray isEmpty
		ifTrue: [  ]
		ifFalse: [ (anArray copyFrom: 2 to: (anArray size)) with: 
					  (anArray copyFrom: 1 to: (anArray size - 1)) do: [ :x :y |
				arr add: ('For want of a ', y, ' the ', x, ' was lost.') ].
				arr add: ('And all for the want of a ', (anArray at: 1), '.'). ].
	^arr asArray.
]
