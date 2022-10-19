"
# Allergies

Given a person's allergy score, determine whether or not they're allergic to a given item, and their full list of allergies.

An allergy test produces a single numeric score which contains the
information about all the allergies the person has (that they were
tested for).

The list of items (and their value) that were tested are:

* eggs (1)
* peanuts (2)
* shellfish (4)
* strawberries (8)
* tomatoes (16)
* chocolate (32)
* pollen (64)
* cats (128)

So if Tom is allergic to peanuts and chocolate, he gets a score of 34.

Now, given just that score of 34, your program should be able to say:

- Whether Tom is allergic to any one of those allergens listed above.
- All the allergens Tom is allergic to.

Note: a given score may include allergens **not** listed above (i.e.
allergens that score 256, 512, 1024, etc.).  Your program should
ignore those components of the score.  For example, if the allergy
score is 257, your program should only report the eggs (1) allergy.

## Hint

Notice how each of the items is a power of 2, a property that you should be able to leverage.


"
Class {
	#name : #AllergiesTest,
	#superclass : #ExercismTest,
	#instVars : [
		'allergiesCalculator'
	],
	#category : #'Exercise@Allergies'
}

{ #category : #config }
AllergiesTest class >> exercise [
	"Answer the configured exercise meta data for this exercise, an ExercismExercise"

	^(self createExerciseAfter: GrainsTest)
		isCore: true;
		difficulty: 3;
		topics: #('bitwise_operations' 'filtering');
		yourself
]

{ #category : #generator }
AllergiesTest class >> generator [
	"Potential generator hints"
	
	^ {('@allergicToItem:score:' -> #allergicToItem:forScore:).
	('@listScore:' -> #'allergyListForScore:')}
]

{ #category : #config }
AllergiesTest class >> uuid [
	"Answer a unique id for this exercise"
	^'49ae8e78-a641-0d00-ba20-5f9f04641ab1'
]

{ #category : #config }
AllergiesTest class >> version [
	"Generated from specification: 1 April 2019"
	^'1.2.1'
]

{ #category : #running }
AllergiesTest >> setUp [
	super setUp.
	allergiesCalculator := Allergies new
]

{ #category : #tests }
AllergiesTest >> test01_NoAllergiesMeansNotAllergicToPeanuts [
	| result |

	result := allergiesCalculator allergicToItem: 'peanuts' forScore: 0 .
	self assert: result equals: false
]

{ #category : #tests }
AllergiesTest >> test02_NoAllergiesMeansNotAllergicToCats [
	| result |

	result := allergiesCalculator allergicToItem: 'cats' forScore: 0 .
	self assert: result equals: false
]

{ #category : #tests }
AllergiesTest >> test03_NoAllergiesMeansNotAllergicToStrawberries [
	| result |

	result := allergiesCalculator allergicToItem: 'strawberries' forScore: 0 .
	self assert: result equals: false
]

{ #category : #tests }
AllergiesTest >> test04_AllergicToOnlyEggs [
	| result |

	result := allergiesCalculator allergicToItem: 'eggs' forScore: 1 .
	self assert: result equals: true
]

{ #category : #tests }
AllergiesTest >> test05_AllergicToEggsInAdditionToOtherStuffLikeEggsRepeated [
	| result |

	result := allergiesCalculator allergicToItem: 'eggs' forScore: 5 .
	self assert: result equals: true
]

{ #category : #tests }
AllergiesTest >> test06_AllergicToEggsInAdditionToOtherStuffLikeShellfish [
	| result |

	result := allergiesCalculator allergicToItem: 'shellfish' forScore: 5 .
	self assert: result equals: true
]

{ #category : #tests }
AllergiesTest >> test07_AllergicToEggsInAdditionToOtherStuffLikeStrawberries [
	| result |

	result := allergiesCalculator allergicToItem: 'strawberries' forScore: 5 .
	self assert: result equals: false
]

{ #category : #tests }
AllergiesTest >> test08_AllergicToStrawberriesButNotPeanuts [
	| result |

	result := allergiesCalculator allergicToItem: 'peanuts' forScore: 9 .
	self assert: result equals: false
]

{ #category : #tests }
AllergiesTest >> test09_AllergicToStrawberriesButNotShellfish [
	| result |

	result := allergiesCalculator allergicToItem: 'shellfish' forScore: 9 .
	self assert: result equals: false
]

{ #category : #tests }
AllergiesTest >> test10_AllergicToStrawberriesAndAlsoEggs [
	| result |

	result := allergiesCalculator allergicToItem: 'eggs' forScore: 9 .
	self assert: result equals: true
]

{ #category : #tests }
AllergiesTest >> test11_AllergicToStrawberriesAndAlsoStrawberriesRepeated [
	| result |

	result := allergiesCalculator allergicToItem: 'strawberries' forScore: 9 .
	self assert: result equals: true
]

{ #category : #tests }
AllergiesTest >> test12_ListWhenNoAllergies [
	| result |

	result := allergiesCalculator allergyListForScore: 0 .
	self assert: result equals: #()
]

{ #category : #tests }
AllergiesTest >> test13_ListWhenJustEggs [
	| result |

	result := allergiesCalculator allergyListForScore: 1 .
	self assert: result equals: #('eggs' )
]

{ #category : #tests }
AllergiesTest >> test14_ListWhenJustPeanuts [
	| result |

	result := allergiesCalculator allergyListForScore: 2 .
	self assert: result equals: #('peanuts' )
]

{ #category : #tests }
AllergiesTest >> test15_ListWhenJustStrawberries [
	| result |

	result := allergiesCalculator allergyListForScore: 8 .
	self assert: result equals: #('strawberries' )
]

{ #category : #tests }
AllergiesTest >> test16_ListWhenEggsAndPeanuts [
	| result |

	result := allergiesCalculator allergyListForScore: 3 .
	self assert: result equals: #('eggs' 'peanuts' )
]

{ #category : #tests }
AllergiesTest >> test17_ListWhenMoreThanEggsButNotPeanuts [
	| result |

	result := allergiesCalculator allergyListForScore: 5 .
	self assert: result equals: #('eggs' 'shellfish' )
]

{ #category : #tests }
AllergiesTest >> test18_ListWhenLotsOfStuff [
	| result |

	result := allergiesCalculator allergyListForScore: 248 .
	self assert: result equals: #('strawberries' 'tomatoes' 'chocolate' 'pollen' 'cats' )
]

{ #category : #tests }
AllergiesTest >> test19_ListWhenEverything [
	| result |

	result := allergiesCalculator allergyListForScore: 255 .
	self assert: result equals: #('eggs' 'peanuts' 'shellfish' 'strawberries' 'tomatoes' 'chocolate' 'pollen' 'cats' )
]

{ #category : #tests }
AllergiesTest >> test20_ListWhenNoAllergenScoreParts [
	| result |

	result := allergiesCalculator allergyListForScore: 509 .
	self assert: result equals: #('eggs' 'shellfish' 'strawberries' 'tomatoes' 'chocolate' 'pollen' 'cats' )
]
