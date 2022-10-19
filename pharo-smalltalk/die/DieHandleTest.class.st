Class {
	#name : #DieHandleTest,
	#superclass : #ExercismTest,
	#category : #'Exercise@Die'
}

{ #category : #tests }
DieHandleTest >> testAddingTwiceTheSameDice [
	| handle |
	handle := DieHandle new.
	handle addDie: (Die withFaces: 6).
	self assert: handle diceNumber equals: 1.
	handle addDie: (Die withFaces: 6).
	self assert: handle diceNumber equals: 2.
]

{ #category : #tests }
DieHandleTest >> testCreationAdding [
	 | handle |
	handle := DieHandle new
             addDie: (Die withFaces: 6);
             addDie: (Die withFaces: 10);
             yourself.
	self assert: handle diceNumber equals: 2.
]

{ #category : #tests }
DieHandleTest >> testRoll [

	| handle |
	handle := DieHandle new 
		addDie: (Die withFaces: 6);
		addDie: (Die withFaces: 10);
		yourself.
	1000 timesRepeat: [ handle roll between: 2 and: 16 ]
]

{ #category : #tests }
DieHandleTest >> testSimpleHandle [
	self assert: 2 d20 diceNumber equals: 2.
]

{ #category : #tests }
DieHandleTest >> testSumming [

	| handle |
	handle := 2 d20 + 3 d10.
	self assert: handle diceNumber equals: 5.
]

{ #category : #tests }
DieHandleTest >> testSummingAndRolling [

	| handle |
	handle := 2 d20 + 3 d10.
	self assert: handle diceNumber equals: 5.
	100 timesRepeat: 
		[ handle roll between: 5 and: 70 ]
]
