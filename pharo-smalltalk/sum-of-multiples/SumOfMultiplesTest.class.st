"
# Sum Of Multiples

Given a number, find the sum of all the unique multiples of particular numbers up to
but not including that number.

If we list all the natural numbers below 20 that are multiples of 3 or 5,
we get 3, 5, 6, 9, 10, 12, 15, and 18.

The sum of these multiples is 78.

## Hint

The trick to this exercise understanding how to iterate accross a range of numbers as well as check a Collection for any multiples that are divisible by a number. Try using the Spotter to look up potential classes and browse the categories of methods in those classes. 

Also remember that the Pharo environment is extensively cross referenced. You can right click on any class or method and browse ""references"" to a class (to see how it might be created), as well as ""senders"" of a method (to see how it might be used). 	


"
Class {
	#name : #SumOfMultiplesTest,
	#superclass : #ExercismTest,
	#instVars : [
		'sumOfMultiplesCalculator'
	],
	#category : #'Exercise@SumOfMultiples'
}

{ #category : #config }
SumOfMultiplesTest class >> exercise [
	"Answer the configured exercise meta data for this exercise, an ExercismExercise"
	
	^(self createExerciseAfter: LeapTest)
		isCore: false;
		difficulty: 3;
		topics: #('iteration' 'filtering' 'math');
		yourself
				
]

{ #category : #config }
SumOfMultiplesTest class >> uuid [
	"Answer a unique id for this exercise"
	^'34b0900f-de21-4fef-b24b-f125b608e65e'
]

{ #category : #config }
SumOfMultiplesTest class >> version [
	"Generated from specification: 25 February 2019"
	^'1.5.0'
]

{ #category : #running }
SumOfMultiplesTest >> setUp [
	super setUp.
	sumOfMultiplesCalculator := SumOfMultiples new
]

{ #category : #tests }
SumOfMultiplesTest >> test01_NoMultiplesWithinLimit [
	| result |

	result := sumOfMultiplesCalculator sumFactors: #(3 5 ) limit: 1 .
	self assert: result equals: 0
]

{ #category : #tests }
SumOfMultiplesTest >> test02_OneFactorHasMultiplesWithinLimit [
	| result |

	result := sumOfMultiplesCalculator sumFactors: #(3 5 ) limit: 4 .
	self assert: result equals: 3
]

{ #category : #tests }
SumOfMultiplesTest >> test03_MoreThanOneMultipleWithinLimit [
	| result |

	result := sumOfMultiplesCalculator sumFactors: #(3 ) limit: 7 .
	self assert: result equals: 9
]

{ #category : #tests }
SumOfMultiplesTest >> test04_MoreThanOneFactorWithMultiplesWithinLimit [
	| result |

	result := sumOfMultiplesCalculator sumFactors: #(3 5 ) limit: 10 .
	self assert: result equals: 23
]

{ #category : #tests }
SumOfMultiplesTest >> test05_EachMultipleIsOnlyCountedOnce [
	| result |

	result := sumOfMultiplesCalculator sumFactors: #(3 5 ) limit: 100 .
	self assert: result equals: 2318
]

{ #category : #tests }
SumOfMultiplesTest >> test06_AMuchLargerLimit [
	| result |

	result := sumOfMultiplesCalculator sumFactors: #(3 5 ) limit: 1000 .
	self assert: result equals: 233168
]

{ #category : #tests }
SumOfMultiplesTest >> test07_ThreeFactors [
	| result |

	result := sumOfMultiplesCalculator sumFactors: #(7 13 17 ) limit: 20 .
	self assert: result equals: 51
]

{ #category : #tests }
SumOfMultiplesTest >> test08_FactorsNotRelativelyPrime [
	| result |

	result := sumOfMultiplesCalculator sumFactors: #(4 6 ) limit: 15 .
	self assert: result equals: 30
]

{ #category : #tests }
SumOfMultiplesTest >> test09_SomePairsOfFactorsRelativelyPrimeAndSomeNot [
	| result |

	result := sumOfMultiplesCalculator sumFactors: #(5 6 8 ) limit: 150 .
	self assert: result equals: 4419
]

{ #category : #tests }
SumOfMultiplesTest >> test10_OneFactorIsAMultipleOfAnother [
	| result |

	result := sumOfMultiplesCalculator sumFactors: #(5 25 ) limit: 51 .
	self assert: result equals: 275
]

{ #category : #tests }
SumOfMultiplesTest >> test11_MuchLargerFactors [
	| result |

	result := sumOfMultiplesCalculator sumFactors: #(43 47 ) limit: 10000 .
	self assert: result equals: 2203160
]

{ #category : #tests }
SumOfMultiplesTest >> test12_AllNumbersAreMultiplesOf1 [
	| result |

	result := sumOfMultiplesCalculator sumFactors: #(1 ) limit: 100 .
	self assert: result equals: 4950
]

{ #category : #tests }
SumOfMultiplesTest >> test13_NoFactorsMeansAnEmptySum [
	| result |

	result := sumOfMultiplesCalculator sumFactors: #() limit: 10000 .
	self assert: result equals: 0
]

{ #category : #tests }
SumOfMultiplesTest >> test14_TheOnlyMultipleOf0Is0 [
	| result |

	result := sumOfMultiplesCalculator sumFactors: #(0 ) limit: 1 .
	self assert: result equals: 0
]

{ #category : #tests }
SumOfMultiplesTest >> test15_TheFactor0DoesNotAffectTheSumOfMultiplesOfOtherFactors [
	| result |

	result := sumOfMultiplesCalculator sumFactors: #(3 0 ) limit: 4 .
	self assert: result equals: 3
]

{ #category : #tests }
SumOfMultiplesTest >> test16_SolutionsUsingIncludeexcludeMustExtendToCardinalityGreaterThan3 [
	| result |

	result := sumOfMultiplesCalculator sumFactors: #(2 3 5 7 11 ) limit: 10000 .
	self assert: result equals: 39614537
]
