Class {
	#name : #Clock,
	#superclass : #Object,
	#instVars : [
		'm'
	],
	#category : #'Exercise@Clock'
}

{ #category : #exercism }
Clock class >> hour: hours minute: minutes [
	^self new
		m: ((hours*60) + minutes) \\ (24*60).

]

{ #category : #exercism }
Clock >> + anInteger [
	"Add minutes"	
	
	self m: (m + anInteger \\ (24*60)).		

]

{ #category : #exercism }
Clock >> - anInteger [
	"Add minutes"	
			
	self + (anInteger negated)
]

{ #category : #comparing }
Clock >> = aClock [
	"Check equality of two clocks"	
			
	^self m = aClock m.
]

{ #category : #converting }
Clock >> asString [
	"Printable representation of clock state"
			
	^((m // 60) printStringLength: 2 padded: true),':',((m \\ 60) printStringLength: 2 padded: true).
]

{ #category : #accessing }
Clock >> m [
	^m.
]

{ #category : #accessing }
Clock >> m: anInteger [
	m := anInteger.
]
