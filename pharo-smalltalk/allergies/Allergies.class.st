Class {
	#name : #Allergies,
	#superclass : #Object,
	#classVars : [
		'Allergens',
		'AllergyScores'
	],
	#category : #'Exercise@Allergies'
}

{ #category : #exercism }
Allergies >> allergicToItem: anItem forScore: aScore [
	"Determine if a person with a certain score is allergic to a certain item"	
			
	^(self allergyListForScore: aScore) includes: anItem.
]

{ #category : #exercism }
Allergies >> allergyListForScore: aScore [
	"Return a list of allergens for a given score"	

	| allergies |
	allergies := OrderedCollection new.
	(Allergens reverse) "Reverse array to reflect the fact that we start from LSB"
		with: (aScore printStringBase: 2 nDigits: (Allergens size)) "Convert score to binary mask"
		do: [ :allergen :isAllergic | (isAllergic = $1) "Only include items masked by 1 in the list of allergens"
			ifTrue: [ allergies add: allergen ] ].
	^allergies reverse asArray.
]

{ #category : #initialization }
Allergies >> initialize [
	Allergens := #('eggs' 'peanuts' 'shellfish' 'strawberries' 
							'tomatoes' 'chocolate' 'pollen' 'cats').
]
