"
RobotSimulator makes use of complex numbers for internal representation of direction and position. Advancing of the robot is carried out by complex addition (position + bearing) while turning uses the fact that multiplying by i and -i rotates any complex number (of non-zero modulus) by pi/2 clockwise and counterclockwise, respectively.

Since Pharo does not, by default, offer complex numbers (a pity!), this solution requires installing the 'ConfigurationOfComplex' package from the Metacello Repository. Installation instructions below:

Gofer new
squeaksource: 'MetacelloRepository';
package: 'ConfigurationOfComplex';
load.
((Smalltalk at: #ConfigurationOfComplex) project version: #'stable') perform: #load.
"
Class {
	#name : #RobotSimulator,
	#superclass : #Object,
	#instVars : [
		'position',
		'bearing',
		'bearingToDirection',
		'directionToBearing'
	],
	#category : #'Exercise@RobotSimulator'
}

{ #category : #'class initialization' }
RobotSimulator >> initialize [
	"Initialize dictionaries for translating between directions and bearings."

	bearingToDirection := Dictionary new
		add: (Complex real: 0 imaginary: 1)->'north';
		add: (Complex real: 1 imaginary: 0)->'east';
		add: (Complex real: 0 imaginary: -1)->'south';
		add: (Complex real: -1 imaginary: 0)->'west'; yourself.
	directionToBearing := Dictionary new
		add: 'north'->(Complex real: 0 imaginary: 1);
		add: 'east'->(Complex real: 1 imaginary: 0);
		add: 'south'->(Complex real: 0 imaginary: -1);
		add: 'west'->(Complex real: -1 imaginary: 0); yourself.
]

{ #category : #public }
RobotSimulator >> report [
	"Convert the internal complex number representation to expected dictionary format."

	^Dictionary new
		add: 'direction'->(bearingToDirection at: bearing);
		add: 'position'->(Dictionary new
									add: 'x'->(position real);
									add: 'y'->(position imaginary);
									yourself);
		yourself.
]

{ #category : #'as yet unclassified' }
RobotSimulator >> sendInstructions: aString [ 
	"Rotate L or R by multiplying bearing by i or -i respectively. Advance by adding bearing to position."
	aString do: [ :op |
		op = $L
			ifTrue: [ bearing := bearing * (Complex real: 0 imaginary: 1) ].
		op = $R
			ifTrue: [ bearing := bearing * (Complex real: 0 imaginary: -1) ].
		op = $A
			ifTrue: [ position := position + bearing ] ].
	^self report.
]

{ #category : #'as yet unclassified' }
RobotSimulator >> startFacing: aString atPosition: aCollection [ 
	"Convert external representation of direction and position to complex numbers."
	position := Complex real: (aCollection at: 'x') imaginary: (aCollection at: 'y').
	bearing := directionToBearing at: aString.
	^self report.
]
