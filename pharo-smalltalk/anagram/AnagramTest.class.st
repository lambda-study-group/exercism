"
# Anagram

Given a word and a list of possible anagrams, select the correct sublist.

Given `""listen""` and a list of candidates like `""enlists"" ""google""
""inlets"" ""banana""` the program should return a list containing
`""inlets""`.

## Hint

As with Isogram, it's worth browsing what data types are already available in the system. Also remember to take the tests step by step and try to build up a solution bit by bit. The debugger can also be your friend, and remember that it's possible to evaluate any expression or variable to better visualise and and understand how it works.

"
Class {
	#name : #AnagramTest,
	#superclass : #ExercismTest,
	#instVars : [
		'anagramCalculator'
	],
	#category : #'Exercise@Anagram'
}

{ #category : #config }
AnagramTest class >> exercise [
	"Answer the configured exercise meta data for this exercise, an ExercismExercise"
	
	^(self createExerciseAfter: IsogramTest)
		isCore: false;
		difficulty: 3;
		topics: #('strings' 'filtering');
		yourself
	
				
]

{ #category : #config }
AnagramTest class >> uuid [
	"Answer a unique id for this exercise"
	^'cc8b42be-4a3f-0d00-bb2c-6d04071d6982'
]

{ #category : #config }
AnagramTest class >> version [
	"Generated from specification: 28 February 2019"
	^'1.4.0'
]

{ #category : #running }
AnagramTest >> setUp [
	super setUp.
	anagramCalculator := Anagram new
]

{ #category : #tests }
AnagramTest >> test01_NoMatches [
	| result |

	result := anagramCalculator findAnagramsCandidates: #('hello' 'world' 'zombies' 'pants' ) subject: 'diaper' .
	self assert: result equals: #()
]

{ #category : #tests }
AnagramTest >> test02_DetectsTwoAnagrams [
	| result |

	result := anagramCalculator findAnagramsCandidates: #('stream' 'pigeon' 'maters' ) subject: 'master' .
	self assert: result equals: #('stream' 'maters' )
]

{ #category : #tests }
AnagramTest >> test03_DoesNotDetectAnagramSubsets [
	| result |

	result := anagramCalculator findAnagramsCandidates: #('dog' 'goody' ) subject: 'good' .
	self assert: result equals: #()
]

{ #category : #tests }
AnagramTest >> test04_DetectsAnagram [
	| result |

	result := anagramCalculator findAnagramsCandidates: #('enlists' 'google' 'inlets' 'banana' ) subject: 'listen' .
	self assert: result equals: #('inlets' )
]

{ #category : #tests }
AnagramTest >> test05_DetectsThreeAnagrams [
	| result |

	result := anagramCalculator findAnagramsCandidates: #('gallery' 'ballerina' 'regally' 'clergy' 'largely' 'leading' ) subject: 'allergy' .
	self assert: result equals: #('gallery' 'regally' 'largely' )
]

{ #category : #tests }
AnagramTest >> test06_DoesNotDetectNonanagramsWithIdenticalChecksum [
	| result |

	result := anagramCalculator findAnagramsCandidates: #('last' ) subject: 'mass' .
	self assert: result equals: #()
]

{ #category : #tests }
AnagramTest >> test07_DetectsAnagramsCaseinsensitively [
	| result |

	result := anagramCalculator findAnagramsCandidates: #('cashregister' 'Carthorse' 'radishes' ) subject: 'Orchestra' .
	self assert: result equals: #('Carthorse' )
]

{ #category : #tests }
AnagramTest >> test08_DetectsAnagramsUsingCaseinsensitiveSubject [
	| result |

	result := anagramCalculator findAnagramsCandidates: #('cashregister' 'carthorse' 'radishes' ) subject: 'Orchestra' .
	self assert: result equals: #('carthorse' )
]

{ #category : #tests }
AnagramTest >> test09_DetectsAnagramsUsingCaseinsensitivePossibleMatches [
	| result |

	result := anagramCalculator findAnagramsCandidates: #('cashregister' 'Carthorse' 'radishes' ) subject: 'orchestra' .
	self assert: result equals: #('Carthorse' )
]

{ #category : #tests }
AnagramTest >> test10_DoesNotDetectAnAnagramIfTheOriginalWordIsRepeated [
	| result |

	result := anagramCalculator findAnagramsCandidates: #('go Go GO' ) subject: 'go' .
	self assert: result equals: #()
]

{ #category : #tests }
AnagramTest >> test11_AnagramsMustUseAllLettersExactlyOnce [
	| result |

	result := anagramCalculator findAnagramsCandidates: #('patter' ) subject: 'tapper' .
	self assert: result equals: #()
]

{ #category : #tests }
AnagramTest >> test12_WordsAreNotAnagramsOfThemselvescaseinsensitive [
	| result |

	result := anagramCalculator findAnagramsCandidates: #('BANANA' 'Banana' 'banana' ) subject: 'BANANA' .
	self assert: result equals: #()
]
