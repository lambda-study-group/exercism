"
# Clock

Implement a clock that handles times without dates.

You should be able to add and subtract minutes to it.

Two clocks that represent the same time should be equal to each other.

## Hint

Try and encapsulate your implementation

"
Class {
	#name : #ClockTest,
	#superclass : #ExercismTest,
	#instVars : [
		'clock1',
		'clock2'
	],
	#category : #'Exercise@Clock'
}

{ #category : #config }
ClockTest class >> exercise [
	"Answer the configured exercise meta data for this exercise, an ExercismExercise"
	
	^(self createExerciseAfter: LeapTest)
		isCore: false;
		difficulty: 2;
		topics: #('math' 'classes' 'structural_equality');
		yourself
	
				
]

{ #category : #generator }
ClockTest class >> generator [
	"Answer code generator aliases/hints"
	
	"Mostly hand generated"
	^false
]

{ #category : #config }
ClockTest class >> uuid [
	"Answer a unique id for this exercise"
	^'f8080717-9d41-0d00-9011-755a08866539'
]

{ #category : #config }
ClockTest class >> version [
	"Generated from specification: 29 March 2019"
	^'2.4.0'
]

{ #category : #tests }
ClockTest >> test01_CreateANewClockWithAnInitialTimeOnTheHour [
	| result |
	result := (Clock hour: 8 minute: 0) asString.
	self assert: result equals: '08:00'
]

{ #category : #tests }
ClockTest >> test02_CreateANewClockWithAnInitialTimePastTheHour [
	| result |
	result := (Clock hour: 11 minute: 9) asString.
	self assert: result equals: '11:09'
]

{ #category : #tests }
ClockTest >> test03_CreateANewClockWithAnInitialTimeMidnightIsZeroHours [
	| result |
	result := (Clock hour: 24 minute: 0) asString.
	self assert: result equals: '00:00'
]

{ #category : #tests }
ClockTest >> test04_CreateANewClockWithAnInitialTimeHourRollsOver [
	| result |
	result := (Clock hour: 25 minute: 0) asString.
	self assert: result equals: '01:00'
]

{ #category : #tests }
ClockTest >> test05_CreateANewClockWithAnInitialTimeHourRollsOverContinuously [
	| result |
	result := (Clock hour: 100 minute: 0) asString.
	self assert: result equals: '04:00'
]

{ #category : #tests }
ClockTest >> test06_CreateANewClockWithAnInitialTimeSixtyMinutesIsNextHour [
	| result |
	result := (Clock hour: 1 minute: 60) asString.
	self assert: result equals: '02:00'
]

{ #category : #tests }
ClockTest >> test07_CreateANewClockWithAnInitialTimeMinutesRollOver [
	| result |
	result := (Clock hour: 0 minute: 160) asString.
	self assert: result equals: '02:40'
]

{ #category : #tests }
ClockTest >> test08_CreateANewClockWithAnInitialTimeMinutesRollOverContinuously [
	| result |
	result := (Clock hour: 0 minute: 1723) asString.
	self assert: result equals: '04:43'
]

{ #category : #tests }
ClockTest >> test09_CreateANewClockWithAnInitialTimeHourAndMinutesRollOver [
	| result |
	result := (Clock hour: 25 minute: 160) asString.
	self assert: result equals: '03:40'
]

{ #category : #tests }
ClockTest >> test10_CreateANewClockWithAnInitialTimeHourAndMinutesRollOverContinuously [
	| result |
	result := (Clock hour: 201 minute: 3001) asString.
	self assert: result equals: '11:01'
]

{ #category : #tests }
ClockTest >> test11_CreateANewClockWithAnInitialTimeHourAndMinutesRollOverToExactlyMidnight [
	| result |
	result := (Clock hour: 72 minute: 8640) asString.
	self assert: result equals: '00:00'
]

{ #category : #tests }
ClockTest >> test12_CreateANewClockWithAnInitialTimeNegativeHour [
	| result |
	result := (Clock hour: -1 minute: 15) asString.
	self assert: result equals: '23:15'
]

{ #category : #tests }
ClockTest >> test13_CreateANewClockWithAnInitialTimeNegativeHourRollsOver [
	| result |
	result := (Clock hour: -25 minute: 0) asString.
	self assert: result equals: '23:00'
]

{ #category : #tests }
ClockTest >> test14_CreateANewClockWithAnInitialTimeNegativeHourRollsOverContinuously [
	| result |
	result := (Clock hour: -91 minute: 0) asString.
	self assert: result equals: '05:00'
]

{ #category : #tests }
ClockTest >> test15_CreateANewClockWithAnInitialTimeNegativeMinutes [
	| result |
	result := (Clock hour: 1 minute: -40) asString.
	self assert: result equals: '00:20'
]

{ #category : #tests }
ClockTest >> test16_CreateANewClockWithAnInitialTimeNegativeMinutesRollOver [
	| result |
	result := (Clock hour: 1 minute: -160) asString.
	self assert: result equals: '22:20'
]

{ #category : #tests }
ClockTest >> test17_CreateANewClockWithAnInitialTimeNegativeMinutesRollOverContinuously [
	| result |
	result := (Clock hour: 1 minute: -4820) asString.
	self assert: result equals: '16:40'
]

{ #category : #tests }
ClockTest >> test18_CreateANewClockWithAnInitialTimeNegativeSixtyMinutesIsPreviousHour [
	| result |
	result := (Clock hour: 2 minute: -60) asString.
	self assert: result equals: '01:00'
]

{ #category : #tests }
ClockTest >> test19_CreateANewClockWithAnInitialTimeNegativeHourAndMinutesBothRollOver [
	| result |
	result := (Clock hour: -25 minute: -160) asString.
	self assert: result equals: '20:20'
]

{ #category : #tests }
ClockTest >> test20_CreateANewClockWithAnInitialTimeNegativeHourAndMinutesBothRollOverContinuously [
	| result |
	result := (Clock hour: -121 minute: -5810) asString.
	self assert: result equals: '22:10'
]

{ #category : #tests }
ClockTest >> test21_AddMinutesAddMinutes [
	| result |
	result := (Clock hour: 10 minute: 0) + 3.
	self assert: result asString equals: '10:03'
]

{ #category : #tests }
ClockTest >> test22_AddMinutesAddNoMinutes [
	| result |
	result := (Clock hour: 6 minute: 41) + 0.
	self assert: result asString equals: '06:41'
]

{ #category : #tests }
ClockTest >> test23_AddMinutesAddToNextHour [
	| result |
	result := (Clock hour: 0 minute: 45) + 40.
	self assert: result asString equals: '01:25'
]

{ #category : #tests }
ClockTest >> test24_AddMinutesAddMoreThanOneHour [
	| result |
	result := (Clock hour: 10 minute: 0) + 61.
	self assert: result asString equals: '11:01'
]

{ #category : #tests }
ClockTest >> test25_AddMinutesAddMoreThanTwoHoursWithCarry [
	| result |
	result := (Clock hour: 0 minute: 45) + 160.
	self assert: result asString equals: '03:25'
]

{ #category : #tests }
ClockTest >> test26_AddMinutesAddAcrossMidnight [
	| result |
	result := (Clock hour: 23 minute: 59) + 2.
	self assert: result asString equals: '00:01'
]

{ #category : #tests }
ClockTest >> test27_AddMinutesAddMoreThanOneDay1500Min25Hrs [
	| result |
	result := (Clock hour: 5 minute: 32) + 1500.
	self assert: result asString equals: '06:32'
]

{ #category : #tests }
ClockTest >> test28_AddMinutesAddMoreThanTwoDays [
	| result |
	result := (Clock hour: 1 minute: 1) + 3500.
	self assert: result asString equals: '11:21'
]

{ #category : #tests }
ClockTest >> test29_SubtractMinutesSubtractMinutes [
	| result |
	result := (Clock hour: 10 minute: 3) - 3.
	self assert: result asString equals: '10:00'
]

{ #category : #tests }
ClockTest >> test30_SubtractMinutesSubtractToPreviousHour [
	| result |
	result := (Clock hour: 10 minute: 3) - 30.
	self assert: result asString equals: '09:33'
]

{ #category : #tests }
ClockTest >> test31_SubtractMinutesSubtractMoreThanAnHour [
	| result |
	result := (Clock hour: 10 minute: 3) - 70.
	self assert: result asString equals: '08:53'
]

{ #category : #tests }
ClockTest >> test32_SubtractMinutesSubtractAcrossMidnight [
	| result |
	result := (Clock hour: 0 minute: 3) - 4.
	self assert: result asString equals: '23:59'
]

{ #category : #tests }
ClockTest >> test33_SubtractMinutesSubtractMoreThanTwoHours [
	| result |
	result := (Clock hour: 0 minute: 0) - 160.
	self assert: result asString equals: '21:20'
]

{ #category : #tests }
ClockTest >> test34_SubtractMinutesSubtractMoreThanTwoHoursWithBorrow [
	| result |
	result := (Clock hour: 6 minute: 15) - 160.
	self assert: result asString equals: '03:35'
]

{ #category : #tests }
ClockTest >> test35_SubtractMinutesSubtractMoreThanOneDay1500Min25Hrs [
	| result |
	result := (Clock hour: 5 minute: 32) - 1500.
	self assert: result asString equals: '04:32'
]

{ #category : #tests }
ClockTest >> test36_SubtractMinutesSubtractMoreThanTwoDays [
	| result |
	result := (Clock hour: 2 minute: 20) - 3000.
	self assert: result asString equals: '00:20'
]

{ #category : #tests }
ClockTest >> test37_CompareTwoClocksForEqualityClocksWithSameTime [
	clock1 := Clock hour: 15 minute: 37.
	clock2 := Clock hour: 15 minute: 37.
	self assert: clock1 equals: clock2
]

{ #category : #tests }
ClockTest >> test38_CompareTwoClocksForEqualityClocksAMinuteApart [
	clock1 := Clock hour: 15 minute: 36.
	clock2 := Clock hour: 15 minute: 37.
	self deny: clock1 equals: clock2
]

{ #category : #tests }
ClockTest >> test39_CompareTwoClocksForEqualityClocksAnHourApart [
	clock1 := Clock hour: 14 minute: 37.
	clock2 := Clock hour: 15 minute: 37.
	self deny: clock1 equals: clock2
]

{ #category : #tests }
ClockTest >> test40_CompareTwoClocksForEqualityClocksWithHourOverflow [
	clock1 := Clock hour: 10 minute: 37.
	clock2 := Clock hour: 34 minute: 37.
	self assert: clock1 equals: clock2
]

{ #category : #tests }
ClockTest >> test41_CompareTwoClocksForEqualityClocksWithHourOverflowBySeveralDays [
	clock1 := Clock hour: 3 minute: 11.
	clock2 := Clock hour: 99 minute: 11.
	self assert: clock1 equals: clock2
]

{ #category : #tests }
ClockTest >> test42_CompareTwoClocksForEqualityClocksWithNegativeHour [
	clock1 := Clock hour: 22 minute: 40.
	clock2 := Clock hour: -2 minute: 40.
	self assert: clock1 equals: clock2
]

{ #category : #tests }
ClockTest >> test43_CompareTwoClocksForEqualityClocksWithNegativeHourThatWraps [
	clock1 := Clock hour: 17 minute: 3.
	clock2 := Clock hour: -31 minute: 3.
	self assert: clock1 equals: clock2
]

{ #category : #tests }
ClockTest >> test44_CompareTwoClocksForEqualityClocksWithNegativeHourThatWrapsMultipleTimes [
	clock1 := Clock hour: 13 minute: 49.
	clock2 := Clock hour: -83 minute: 49.
	self assert: clock1 equals: clock2
]

{ #category : #tests }
ClockTest >> test45_CompareTwoClocksForEqualityClocksWithMinuteOverflow [
	clock1 := Clock hour: 0 minute: 1.
	clock2 := Clock hour: 0 minute: 1441.
	self assert: clock1 equals: clock2
]

{ #category : #tests }
ClockTest >> test46_CompareTwoClocksForEqualityClocksWithMinuteOverflowBySeveralDays [
	clock1 := Clock hour: 2 minute: 2.
	clock2 := Clock hour: 2 minute: 4322.
	self assert: clock1 equals: clock2
]

{ #category : #tests }
ClockTest >> test47_CompareTwoClocksForEqualityClocksWithNegativeMinute [
	clock1 := Clock hour: 2 minute: 40.
	clock2 := Clock hour: 3 minute: -20.
	self assert: clock1 equals: clock2
]

{ #category : #tests }
ClockTest >> test48_CompareTwoClocksForEqualityClocksWithNegativeMinuteThatWraps [
	clock1 := Clock hour: 4 minute: 10.
	clock2 := Clock hour: 5 minute: -1490.
	self assert: clock1 equals: clock2
]

{ #category : #tests }
ClockTest >> test49_CompareTwoClocksForEqualityClocksWithNegativeMinuteThatWrapsMultipleTimes [
	clock1 := Clock hour: 6 minute: 15.
	clock2 := Clock hour: 6 minute: -4305.
	self assert: clock1 equals: clock2
]

{ #category : #tests }
ClockTest >> test50_CompareTwoClocksForEqualityClocksWithNegativeHoursAndMinutes [
	clock1 := Clock hour: 7 minute: 32.
	clock2 := Clock hour: -12 minute: -268.
	self assert: clock1 equals: clock2
]

{ #category : #tests }
ClockTest >> test51_CompareTwoClocksForEqualityClocksWithNegativeHoursAndMinutesThatWrap [
	clock1 := Clock hour: 18 minute: 7.
	clock2 := Clock hour: -54 minute: -11513.
	self assert: clock1 equals: clock2
]

{ #category : #tests }
ClockTest >> test52_CompareTwoClocksForEqualityFullClockAndZeroedClock [
	clock1 := Clock hour: 24 minute: 0.
	clock2 := Clock hour: 0 minute: 0.
	self assert: clock1 equals: clock2
]
