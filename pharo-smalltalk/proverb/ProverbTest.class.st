"
# Proverb

For want of a horseshoe nail, a kingdom was lost, or so the saying goes.

Given a list of inputs, generate the relevant proverb. For example, given the list `[""nail"", ""shoe"", ""horse"", ""rider"", ""message"", ""battle"", ""kingdom""]`, you will output the full text of this proverbial rhyme:

```text
For want of a nail the shoe was lost.
For want of a shoe the horse was lost.
For want of a horse the rider was lost.
For want of a rider the message was lost.
For want of a message the battle was lost.
For want of a battle the kingdom was lost.
And all for the want of a nail.
```

Note that the list of inputs may vary; your solution should be able to handle lists of arbitrary length and content. No line of the output text should be a static, unchanging string; all should vary according to the input given.

## Hint

This one can be quite simple if you look at ways to iterate over the list of inputs.

"
Class {
	#name : #ProverbTest,
	#superclass : #ExercismTest,
	#instVars : [
		'proverbCalculator'
	],
	#category : #'Exercise@Proverb'
}

{ #category : #config }
ProverbTest class >> exercise [
	"Answer the configured exercise meta data for this exercise, an ExercismExercise"
	
	^(self createExerciseAfter: ReverseStringTest)
		isCore: false;
		difficulty: 3;
		topics: #('strings' 'iteration' );
		yourself

]

{ #category : #config }
ProverbTest class >> uuid [
	"Answer a unique id for this exercise"
	^'b4e3babb-8040-0d00-80fa-71e001deb008'
]

{ #category : #config }
ProverbTest class >> version [
	"Generated from specification: 15 March 2019"
	^'1.1.0'
]

{ #category : #running }
ProverbTest >> setUp [
	super setUp.
	proverbCalculator := Proverb new
]

{ #category : #tests }
ProverbTest >> test01_ZeroPieces [
	| result |

	result := proverbCalculator reciteStrings: #() .
	self assert: result equals: #()
]

{ #category : #tests }
ProverbTest >> test02_OnePiece [
	| result |

	result := proverbCalculator reciteStrings: #('nail' ) .
	self assert: result equals: #('And all for the want of a nail.' )
]

{ #category : #tests }
ProverbTest >> test03_TwoPieces [
	| result |

	result := proverbCalculator reciteStrings: #('nail' 'shoe' ) .
	self assert: result equals: #('For want of a nail the shoe was lost.' 'And all for the want of a nail.' )
]

{ #category : #tests }
ProverbTest >> test04_ThreePieces [
	| result |

	result := proverbCalculator reciteStrings: #('nail' 'shoe' 'horse' ) .
	self assert: result equals: #('For want of a nail the shoe was lost.' 'For want of a shoe the horse was lost.' 'And all for the want of a nail.' )
]

{ #category : #tests }
ProverbTest >> test05_FullProverb [
	| result |

	result := proverbCalculator reciteStrings: #('nail' 'shoe' 'horse' 'rider' 'message' 'battle' 'kingdom' ) .
	self assert: result equals: #('For want of a nail the shoe was lost.' 'For want of a shoe the horse was lost.' 'For want of a horse the rider was lost.' 'For want of a rider the message was lost.' 'For want of a message the battle was lost.' 'For want of a battle the kingdom was lost.' 'And all for the want of a nail.' )
]

{ #category : #tests }
ProverbTest >> test06_FourPiecesModernized [
	| result |

	result := proverbCalculator reciteStrings: #('pin' 'gun' 'soldier' 'battle' ) .
	self assert: result equals: #('For want of a pin the gun was lost.' 'For want of a gun the soldier was lost.' 'For want of a soldier the battle was lost.' 'And all for the want of a pin.' )
]
