Class {
	#name : #Isogram,
	#superclass : #Object,
	#category : #'Exercise@Isogram'
}

{ #category : #exercism }
Isogram >> isIsogramPhrase: aString [
	"Determine if a phrase is an isogram i.e. no letter is repeated"	

	| seen |
	seen := Bag new.
	aString asLowercase do: [ :c | c isLetter 
		ifTrue: [ (seen includes: c)
			ifTrue: [ ^false ]
			ifFalse: [ seen add: c ] ] ].
	^true.
]
