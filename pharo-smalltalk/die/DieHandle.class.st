Class {
	#name : #DieHandle,
	#superclass : #Object,
	#instVars : [
		'dice'
	],
	#category : #'Exercise@Die'
}

{ #category : #arithmetic }
DieHandle >> + aHandle [
	"Combine two die handles"	
			
	^self class new 
		addDice: self dice;
		addDice: aHandle dice;
		yourself.
]

{ #category : #adding }
DieHandle >> addDice: aCollection [
	"Add dice to handle"	
			
	aCollection do: [ :d | dice add: d ].
]

{ #category : #adding }
DieHandle >> addDie: aDie [
	"Add die to handle"	
			
	dice add: aDie.
]

{ #category : #accessing }
DieHandle >> dice [
	"Return the collection of dice"	
			
	^dice.
]

{ #category : #exercism }
DieHandle >> diceNumber [
	"Return the number of dice in a handle"	
			
	^dice size.
]

{ #category : #initialization }
DieHandle >> initialize [
			
	dice := OrderedCollection new.
]

{ #category : #exercism }
DieHandle >> roll [
	"Roll the entire die handle and return the sum"	
			
	^(dice collect: #roll) sum. 
]
