Class {
	#name : #RomanNumerals,
	#superclass : #Object,
	#classVars : [
		'decimalToRoman'
	],
	#category : #'Exercise@RomanNumerals'
}

{ #category : #'class initialization' }
RomanNumerals class >> initialize [
	decimalToRoman := #(
		#(1000 'M') #(900 'CM') #(500 'D') #(400 'CD') #(100 'C') #(90 'XC')
		#(50 'L') #(40 'XL') #(10 'X') #(9 'IX') #(5 'V') #(4 'IV') #(1 'I')
	)
]

{ #category : #exercism }
RomanNumerals >> romanNumber: anInteger [
	"Convert a decimal arabic number to a roman number"	
			
	| st n |
	n := anInteger.
	st := WriteStream on: String new.
	decimalToRoman do: [ :d |
		[ n >= (d first) ] 
			whileTrue: [ 
				n := n - (d first).
				st nextPutAll: (d second) ] ].
	^st contents.
]
