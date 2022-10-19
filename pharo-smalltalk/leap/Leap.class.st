Class {
	#name : #Leap,
	#superclass : #Object,
	#category : #'Exercise@Leap'
}

{ #category : #exercism }
Leap >> leapYear: year [
	"Return true if year is a leap year"
	year \\ 400 = 0
		ifTrue: [ ^true ]
		ifFalse: [ year \\ 100 = 0
			ifTrue: [ ^false ]
			ifFalse: [ year \\ 4 = 0
				ifTrue: [ ^true ]
				ifFalse: [ ^false ] ] ].
]
