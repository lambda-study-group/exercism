Class {
	#name : #SpaceAge,
	#superclass : #Object,
	#classVars : [
		'EarthYear',
		'PlanetYears'
	],
	#category : #'Exercise@SpaceAge'
}

{ #category : #exercism }
SpaceAge >> ageOnPlanet: aPlanet at: aNumber [
	"Determine the number of years a given number of seconds is equivalent to on a given planet"	
			
	^aNumber / EarthYear  / (PlanetYears at: aPlanet).
]

{ #category : #initialization }
SpaceAge >> initialize [
			
	PlanetYears := Dictionary new.
	PlanetYears at: 'Mercury' put: 0.2408467;
		at: 'Venus' put: 0.61519726;
		at: 'Earth' put: 1.0;
		at: 'Mars' put: 1.8808158;
		at: 'Jupiter' put: 11.862615;
		at: 'Saturn' put: 29.447498;
		at: 'Uranus' put: 84.016846;
		at: 'Neptune' put: 164.79132.
		
	EarthYear := 31557600.
]
