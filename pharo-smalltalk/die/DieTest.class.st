"
# Die

Experimental Custom Exercise (Don't use yet)

A small DSL for dice rolling: a nice example to get started with Pharo.

## Hint

It is used in the book: Learning Object-Oriented Programming, Design and TDD with Pharo available at http://books.pharo.org

"
Class {
	#name : #DieTest,
	#superclass : #ExercismTest,
	#category : #'Exercise@Die'
}

{ #category : #config }
DieTest class >> customData [
	^{ 
	#blurb -> 'A small DSL for dice rolling'.
	#source -> 'Stephane Ducasse'.
	#source_url -> 'https://github.com/Ducasse/Dice'
	 } asOrderedDictionary 
]

{ #category : #config }
DieTest class >> exercise [
	"Answer the configured exercise meta data for this exercise, an ExercismExercise"
	
	^(ExercismExercise for: self)
		isCore: false;
		difficulty: 1;
		topics: #('math');
		yourself
	
				
]

{ #category : #config }
DieTest class >> uuid [
	"Answer a fixed String, the unique UUID for this exercise so the Exercism platform can identify it.
	The id should be like: 'b5812b5e-2788-4ea6-b948-bfe54edeb0da' "
	
	^'dbea4db3-5044-0d00-ab77-b35a0c226d01'
]

{ #category : #config }
DieTest class >> version [
	"Answer the exercise version number string this test was derived from"
	
	^'0.0.1' 
]

{ #category : #tests }
DieTest >> testCreationIsOk [

	self assert: (Die withFaces: 20) faces equals: 20

]

{ #category : #tests }
DieTest >> testInitializeIsOk [

	self assert: Die new faces equals: 6
]

{ #category : #tests }
DieTest >> testRolling [
	|d|
	d := Die new.
 	1000 timesRepeat: [ self assert: (d roll between: 1 and: 6) ]
]
