"
# Leap

Given a year, report if it is a leap year.

The tricky thing here is that a leap year in the Gregorian calendar occurs:

```text
on every year that is evenly divisible by 4
  except every year that is evenly divisible by 100
    unless the year is also evenly divisible by 400
```

For example, 1997 is not a leap year, but 1996 is.  1900 is not a leap
year, but 2000 is.

## Notes

Though our exercise adopts some very simple rules, there is more to
learn!

For a delightful, four minute explanation of the whole leap year
phenomenon, go watch [this youtube video][video].

[video]: http://www.youtube.com/watch?v=xX96xng7sAE

## Hint

The tests for this exercise (and future exercises), are prefix numbered like 'test00_'. 
This is not a normal convention in Pharo, however to ease the study of the language it is 
useful to present tests in a deterministic order.

For this exercise, study the 'arithmetic' method category for class Number, as well as how boolean operators are also defined as messages. Notice how ""and:"" and ""or:"" are implented in the classes True and False. You can use the context menu item ""senders of..."" to view how other parts of Pharo use these operators.

You may also find something useful trying... `World > Tools > Finder > Examples > 20 . 4 . true`
<br> which is asking Pharo which operations between the first and second elements result in the third.
<br> [View demo][demo]

[demo]: https://github.com/exercism/pharo-smalltalk/raw/master/docs/images/Hint-Finder-Leap.gif
"
Class {
	#name : #LeapTest,
	#superclass : #ExercismTest,
	#instVars : [
		'leapCalculator'
	],
	#category : #'Exercise@Leap'
}

{ #category : #config }
LeapTest class >> exercise [
	"Answer the configured exercise meta data for this exercise, an ExercismExercise"
	
	^(self createExerciseAfter: TwoFerTest)
		isCore: true;
		difficulty: 1;
		topics: #('math' 'conditionals' 'logic');
		yourself
	
				
]

{ #category : #config }
LeapTest class >> uuid [
	"Answer a unique id for this exercise"
	^'82b07f5c-119c-4250-8c07-a0a7e1a95458'
]

{ #category : #config }
LeapTest class >> version [
	"Generated from specification: 25 February 2019"
	^'1.5.1'
]

{ #category : #running }
LeapTest >> setUp [
	super setUp.
	leapCalculator := Leap new
]

{ #category : #tests }
LeapTest >> test01_YearNotDivisibleBy4CommonYear [
	| result |

	result := leapCalculator leapYear: 2015 .
	self assert: result equals: false
]

{ #category : #tests }
LeapTest >> test02_YearDivisibleBy2NotDivisibleBy4CommonYear [
	| result |

	result := leapCalculator leapYear: 1970 .
	self assert: result equals: false
]

{ #category : #tests }
LeapTest >> test03_YearDivisibleBy4NotDivisibleBy100LeapYear [
	| result |

	result := leapCalculator leapYear: 1996 .
	self assert: result equals: true
]

{ #category : #tests }
LeapTest >> test04_YearDivisibleBy100NotDivisibleBy400CommonYear [
	| result |

	result := leapCalculator leapYear: 2100 .
	self assert: result equals: false
]

{ #category : #tests }
LeapTest >> test05_YearDivisibleBy400LeapYear [
	| result |

	result := leapCalculator leapYear: 2000 .
	self assert: result equals: true
]

{ #category : #tests }
LeapTest >> test06_YearDivisibleBy200NotDivisibleBy400CommonYear [
	| result |

	result := leapCalculator leapYear: 1800 .
	self assert: result equals: false
]

{ #category : #extra }
LeapTest >> testMisuseOfSelector [
	self verifySolution: leapCalculator class avoidsSelector: #isLeapYear
]
