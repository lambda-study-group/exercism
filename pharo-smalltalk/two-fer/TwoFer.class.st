Class {
	#name : #TwoFer,
	#superclass : #Object,
	#category : #'Exercise@TwoFer'
}

{ #category : #exercism }
TwoFer >> who [
	"Address a person by pronoun"
	^self who: 'you'.
]

{ #category : #exercism }
TwoFer >> who:person [
	"Address a person by name"	
	^'One for ', person, ', one for me.'.
]
