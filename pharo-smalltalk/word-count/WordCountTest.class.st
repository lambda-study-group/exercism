"
# Word Count

Given a phrase, count the occurrences of each word in that phrase.

For example for the input `""olly olly in come free""`

```text
olly: 2
in: 1
come: 1
free: 1
```

## Hint

There are several ways to approach this, study class String carefully and take it step by step. You might change approach mid way through if the solution becomes more complicated.

"
Class {
	#name : #WordCountTest,
	#superclass : #ExercismTest,
	#instVars : [
		'wordCountCalculator'
	],
	#category : #'Exercise@WordCount'
}

{ #category : #config }
WordCountTest class >> exercise [
	"Answer the configured exercise meta data for this exercise, an ExercismExercise"
	
	^(self createExerciseAfter: AllergiesTest)
		isCore: false;
		difficulty: 3;
		topics: #('strings' 'iteration' 'pattern_recognition');
		yourself

]

{ #category : #config }
WordCountTest class >> uuid [
	"Answer a unique id for this exercise"
	^'a5de8cbe-4a3f-0d00-bb5e-8947071d6982'
]

{ #category : #config }
WordCountTest class >> version [
	"Generated from specification: 28 February 2019"
	^'1.3.0'
]

{ #category : #running }
WordCountTest >> setUp [
	super setUp.
	wordCountCalculator := WordCount new
]

{ #category : #tests }
WordCountTest >> test01_CountOneWord [
	| result |

	result := wordCountCalculator countWordsSentence: 'word' .
	self assert: result equals: ((Dictionary new) add: ('word'->1); yourself)
]

{ #category : #tests }
WordCountTest >> test02_CountOneOfEachWord [
	| result |

	result := wordCountCalculator countWordsSentence: 'one of each' .
	self assert: result equals: ((Dictionary new) add: ('of'->1); add: ('each'->1); add: ('one'->1); yourself)
]

{ #category : #tests }
WordCountTest >> test03_MultipleOccurrencesOfAWord [
	| result |

	result := wordCountCalculator countWordsSentence: 'one fish two fish red fish blue fish' .
	self assert: result equals: ((Dictionary new) add: ('blue'->1); add: ('fish'->4); add: ('one'->1); add: ('red'->1); add: ('two'->1); yourself)
]

{ #category : #tests }
WordCountTest >> test04_HandlesCrampedLists [
	| result |

	result := wordCountCalculator countWordsSentence: 'one,two,three' .
	self assert: result equals: ((Dictionary new) add: ('two'->1); add: ('one'->1); add: ('three'->1); yourself)
]

{ #category : #tests }
WordCountTest >> test05_HandlesExpandedLists [
	| result |

	result := wordCountCalculator countWordsSentence: 'one,
two,
three' .
	self assert: result equals: ((Dictionary new) add: ('two'->1); add: ('one'->1); add: ('three'->1); yourself)
]

{ #category : #tests }
WordCountTest >> test06_IgnorePunctuation [
	| result |

	result := wordCountCalculator countWordsSentence: 'car: carpet as java: javascript!!&@$%^&' .
	self assert: result equals: ((Dictionary new) add: ('as'->1); add: ('javascript'->1); add: ('java'->1); add: ('car'->1); add: ('carpet'->1); yourself)
]

{ #category : #tests }
WordCountTest >> test07_IncludeNumbers [
	| result |

	result := wordCountCalculator countWordsSentence: 'testing, 1, 2 testing' .
	self assert: result equals: ((Dictionary new) add: ('testing'->2); add: ('1'->1); add: ('2'->1); yourself)
]

{ #category : #tests }
WordCountTest >> test08_NormalizeCase [
	| result |

	result := wordCountCalculator countWordsSentence: 'go Go GO Stop stop' .
	self assert: result equals: ((Dictionary new) add: ('stop'->2); add: ('go'->3); yourself)
]

{ #category : #tests }
WordCountTest >> test09_WithApostrophes [
	| result |

	result := wordCountCalculator countWordsSentence: 'First: don''t laugh. Then: don''t cry.' .
	self assert: result equals: ((Dictionary new) add: ('cry'->1); add: ('don''t'->2); add: ('laugh'->1); add: ('first'->1); add: ('then'->1); yourself)
]

{ #category : #tests }
WordCountTest >> test10_WithQuotations [
	| result |

	result := wordCountCalculator countWordsSentence: 'Joe can''t tell between ''large'' and large.' .
	self assert: result equals: ((Dictionary new) add: ('large'->2); add: ('joe'->1); add: ('can''t'->1); add: ('and'->1); add: ('tell'->1); add: ('between'->1); yourself)
]

{ #category : #tests }
WordCountTest >> test11_MultipleSpacesNotDetectedAsAWord [
	| result |

	result := wordCountCalculator countWordsSentence: ' multiple   whitespaces' .
	self assert: result equals: ((Dictionary new) add: ('multiple'->1); add: ('whitespaces'->1); yourself)
]

{ #category : #tests }
WordCountTest >> test12_AlternatingWordSeparatorsNotDetectedAsAWord [
	| result |

	result := wordCountCalculator countWordsSentence: ',
,one,
 ,two 
 ''three''' .
	self assert: result equals: ((Dictionary new) add: ('two'->1); add: ('one'->1); add: ('three'->1); yourself)
]
