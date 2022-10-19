Class {
	#name : #TwelveDays,
	#superclass : #Object,
	#classVars : [
		'items',
		'ordinals'
	],
	#category : #'Exercise@TwelveDays'
}

{ #category : #'class initialization' }
TwelveDays class >> initialize [

	ordinals := #(
		'first' 'second' 'third' 'fourth' 'fifth'
		'sixth' 'seventh' 'eighth' 'ninth' 'tenth'
		'eleventh' 'twelfth'
	).
	
	items := #(
	'a Partridge in a Pear Tree'
	'two Turtle Doves'
	'three French Hens'
	'four Calling Birds'
	'five Gold Rings'
	'six Geese-a-Laying' 
	'seven Swans-a-Swimming' 
	'eight Maids-a-Milking' 
	'nine Ladies Dancing'
	'ten Lords-a-Leaping' 
	'eleven Pipers Piping' 
	'twelve Drummers Drumming'
	).
]

{ #category : #exercism }
TwelveDays >> generateVerse: aNumber [
	"Generate nth verse"	
			
	^'On the ', (ordinals at: aNumber), ' day of Christmas my true love gave to me: ',
	((items copyFrom: 1 to: aNumber) reverse joinUsing: ', ' last: ', and '), '.'.
]

{ #category : #exercism }
TwelveDays >> reciteStartVerse: start endVerse: end [
	"Return an array of verses based on the provided range"	
			
	^(start to: end) collect: [ :n | self generateVerse: n ].
]
