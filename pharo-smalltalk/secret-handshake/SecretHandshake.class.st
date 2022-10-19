Class {
	#name : #SecretHandshake,
	#superclass : #Object,
	#classVars : [
		'actions'
	],
	#category : #'Exercise@SecretHandshake'
}

{ #category : #'class initialization' }
SecretHandshake class >> initialize [
	
	actions := #('wink' 'double blink' 'close your eyes' 'jump')
]

{ #category : #exercism }
SecretHandshake >> commandsNumber: aNumber [
	"Return a sequence of actions based on a number"	
			
	| decoded actionsTaken |
	decoded := (aNumber printStringBase: 2 nDigits: 5) asArray.
	actionsTaken := OrderedCollection new.
	actions with: ((decoded copyFrom: 2 to: 5) reverse) 
		do: [ :action :takeIt | (takeIt = $1)
			ifTrue: [ actionsTaken add: action ] ].
	((decoded at: 1) = $1)
		ifTrue: [ ^actionsTaken reverse asArray ]
		ifFalse: [ ^actionsTaken asArray ].
]
