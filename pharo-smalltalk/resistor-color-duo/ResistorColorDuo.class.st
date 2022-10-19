Class {
	#name : #ResistorColorDuo,
	#superclass : #Object,
	#classVars : [
		'colorsToDigits'
	],
	#category : #'Exercise@ResistorColorDuo'
}

{ #category : #'class initialization' }
ResistorColorDuo class >> initialize [
	
	colorsToDigits := #('black' 'brown' 'red' 'orange' 'yellow' 'green' 'blue' 'violet' 'grey' 'white').

]

{ #category : #exercism }
ResistorColorDuo >> valueWithColors: anArray [
	"Convert color code to a number. Generic version - will work for any number of color bands."	
			
	^(anArray collect: [ :color | (colorsToDigits indexOf: color) - 1 ])
		inject: 0 into: [ :sum :digit | sum * 10 + digit ].
]
