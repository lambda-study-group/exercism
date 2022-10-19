"
# Space Age

Given an age in seconds, calculate how old someone would be on:

   - Earth: orbital period 365.25 Earth days, or 31557600 seconds
   - Mercury: orbital period 0.2408467 Earth years
   - Venus: orbital period 0.61519726 Earth years
   - Mars: orbital period 1.8808158 Earth years
   - Jupiter: orbital period 11.862615 Earth years
   - Saturn: orbital period 29.447498 Earth years
   - Uranus: orbital period 84.016846 Earth years
   - Neptune: orbital period 164.79132 Earth years

So if you were told someone were 1,000,000,000 seconds old, you should
be able to say that they're 31.69 Earth-years old.

If you're wondering why Pluto didn't make the cut, go watch [this
youtube video](http://www.youtube.com/watch?v=Z_2gbGXzFbs).

## Hint

You might find Pharo dictionaries useful in completing this exercise.
Pharo has several ways to construct dictionaries, including `Dictionary new: at:put:`
and a literal syntax using `Association`s. An `Association` looks like `key -> value`
and can be turned into a dictionary like this: `{ 'key' -> 'value' } asDictionary`.
Remember that in Smalltalk, all infix operators are right-associative and that you
can browse any of the classes mentioned above live.

"
Class {
	#name : #SpaceAgeTest,
	#superclass : #ExercismTest,
	#instVars : [
		'spaceAgeCalculator'
	],
	#category : #'Exercise@SpaceAge'
}

{ #category : #config }
SpaceAgeTest class >> exercise [
	"Answer the configured exercise meta data for this exercise, an ExercismExercise"

	^(self createExerciseAfter: TwoFerTest)
		isCore: false;
		difficulty: 1;
		topics: #('dictionaries' 'math');
		yourself
		
]

{ #category : #generator }
SpaceAgeTest class >> generator [
	"Answer code generator aliases/hints"

	^{'planet'->'onPlanet'}
]

{ #category : #config }
SpaceAgeTest class >> uuid [
	"Answer a unique id for this exercise"
	^'7bec34be-4a3f-0d00-bb23-9404071d6982'
]

{ #category : #config }
SpaceAgeTest class >> version [
	"Generated from specification: 28 February 2019"
	^'1.2.0'
]

{ #category : #assertions }
SpaceAgeTest >> assert: aNumber closeEnoughTo: aNumber2 [
	self assert: aNumber closeEnoughTo: aNumber2 by: 2
]

{ #category : #running }
SpaceAgeTest >> setUp [
	super setUp.
	spaceAgeCalculator := SpaceAge new
]

{ #category : #tests }
SpaceAgeTest >> test01_AgeOnEarth [
	| result |
	result := spaceAgeCalculator ageOnPlanet: 'Earth' at: 1000000000.
	self assert: result closeEnoughTo: 31.69
]

{ #category : #tests }
SpaceAgeTest >> test02_AgeOnMercury [
	| result |
	result := spaceAgeCalculator ageOnPlanet: 'Mercury' at: 2134835688.
	self assert: result closeEnoughTo: 280.88
]

{ #category : #tests }
SpaceAgeTest >> test03_AgeOnVenus [
	| result |
	result := spaceAgeCalculator ageOnPlanet: 'Venus' at: 189839836.
	self assert: result closeEnoughTo: 9.78
]

{ #category : #tests }
SpaceAgeTest >> test04_AgeOnMars [
	| result |
	result := spaceAgeCalculator ageOnPlanet: 'Mars' at: 2129871239.
	self assert: result closeEnoughTo: 35.88
]

{ #category : #tests }
SpaceAgeTest >> test05_AgeOnJupiter [
	| result |
	result := spaceAgeCalculator ageOnPlanet: 'Jupiter' at: 901876382.
	self assert: result closeEnoughTo: 2.41
]

{ #category : #tests }
SpaceAgeTest >> test06_AgeOnSaturn [
	| result |
	result := spaceAgeCalculator ageOnPlanet: 'Saturn' at: 2000000000.
	self assert: result closeEnoughTo: 2.15
]

{ #category : #tests }
SpaceAgeTest >> test07_AgeOnUranus [
	| result |
	result := spaceAgeCalculator ageOnPlanet: 'Uranus' at: 1210123456.
	self assert: result closeEnoughTo: 0.46
]

{ #category : #tests }
SpaceAgeTest >> test08_AgeOnNeptune [
	| result |
	result := spaceAgeCalculator ageOnPlanet: 'Neptune' at: 1821023456.
	self assert: result closeEnoughTo: 0.35
]
