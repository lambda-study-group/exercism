"
# Robot Simulator

Write a robot simulator.

A robot factory's test facility needs a program to verify robot movements.

The robots have three possible movements:

- turn right
- turn left
- advance

Robots are placed on a hypothetical infinite grid, facing a particular
direction (north, east, south, or west) at a set of {x,y} coordinates,
e.g., {3,8}, with coordinates increasing to the north and east.

The robot then receives a number of instructions, at which point the
testing facility verifies the robot's new position, and in which
direction it is pointing.

- The letter-string ""RAALAL"" means:
  - Turn right
  - Advance twice
  - Turn left
  - Advance once
  - Turn left yet again
- Say a robot starts at {7, 3} facing north. Then running this stream
  of instructions should leave it at {9, 4} facing west.

## Hint

It's useful to consider having a seperate Robot oject and even write some of your own tests for it, possibly using TDD to drive out useful behaviour.

"
Class {
	#name : #RobotSimulatorTest,
	#superclass : #ExercismTest,
	#instVars : [
		'robotSimulator'
	],
	#category : #'Exercise@RobotSimulator'
}

{ #category : #config }
RobotSimulatorTest class >> exercise [
	"Answer the configured exercise meta data for this exercise, an ExercismExercise"
	
	^(self createExerciseAfter: GradeSchoolTest)
		isCore: false;
		difficulty: 4;
		topics: #('iteration' 'tuples' 'object_oriented_programming');
		yourself
	
]

{ #category : #generator }
RobotSimulatorTest class >> generator [
	"Answer code generator aliases/hints"

	^ {('moveDirection:postion:'
		-> #('startFacing:atPosition:')).
		('moveDirection:postion:instructions:'
		-> #('startFacing:atPosition:' 'sendInstructions:')).
	('robotSimulatorCalculator' -> 'robotSimulator')}
]

{ #category : #config }
RobotSimulatorTest class >> uuid [
	"Answer a unique id for this exercise"
	^'5438fabb-8040-0d00-8145-63f301deb008'
]

{ #category : #config }
RobotSimulatorTest class >> version [
	"Generated from specification: 15 March 2019"
	^'3.1.0'
]

{ #category : #running }
RobotSimulatorTest >> setUp [
	super setUp.
	robotSimulator := RobotSimulator new
]

{ #category : #tests }
RobotSimulatorTest >> test01_ARobotIsCreatedWithAPositionAndADirectionRobotsAreCreatedWithAPositionAndDirection [
	| result |

	result := robotSimulator startFacing: 'north' atPosition: ((Dictionary new) add: ('x'->0); add: ('y'->0); yourself) .
	self assert: result equals: ((Dictionary new) add: ('direction'->'north'); add: ('position'->((Dictionary new) add: ('x'->0); add: ('y'->0); yourself)); yourself)
]

{ #category : #tests }
RobotSimulatorTest >> test02_ARobotIsCreatedWithAPositionAndADirectionNegativePositionsAreAllowed [
	| result |

	result := robotSimulator startFacing: 'south' atPosition: ((Dictionary new) add: ('x'-> -1); add: ('y'-> -1); yourself) .
	self assert: result equals: ((Dictionary new) add: ('direction'->'south'); add: ('position'->((Dictionary new) add: ('x'-> -1); add: ('y'-> -1); yourself)); yourself)
]

{ #category : #tests }
RobotSimulatorTest >> test03_RotatesTheRobotsDirection90DegreesClockwiseChangesTheDirectionFromNorthToEast [
	| result |

	result := robotSimulator startFacing: 'north' atPosition: ((Dictionary new) add: ('x'->0); add: ('y'->0); yourself); sendInstructions: 'R' .
	self assert: result equals: ((Dictionary new) add: ('direction'->'east'); add: ('position'->((Dictionary new) add: ('x'->0); add: ('y'->0); yourself)); yourself)
]

{ #category : #tests }
RobotSimulatorTest >> test04_RotatesTheRobotsDirection90DegreesClockwiseChangesTheDirectionFromEastToSouth [
	| result |

	result := robotSimulator startFacing: 'east' atPosition: ((Dictionary new) add: ('x'->0); add: ('y'->0); yourself); sendInstructions: 'R' .
	self assert: result equals: ((Dictionary new) add: ('direction'->'south'); add: ('position'->((Dictionary new) add: ('x'->0); add: ('y'->0); yourself)); yourself)
]

{ #category : #tests }
RobotSimulatorTest >> test05_RotatesTheRobotsDirection90DegreesClockwiseChangesTheDirectionFromSouthToWest [
	| result |

	result := robotSimulator startFacing: 'south' atPosition: ((Dictionary new) add: ('x'->0); add: ('y'->0); yourself); sendInstructions: 'R' .
	self assert: result equals: ((Dictionary new) add: ('direction'->'west'); add: ('position'->((Dictionary new) add: ('x'->0); add: ('y'->0); yourself)); yourself)
]

{ #category : #tests }
RobotSimulatorTest >> test06_RotatesTheRobotsDirection90DegreesClockwiseChangesTheDirectionFromWestToNorth [
	| result |

	result := robotSimulator startFacing: 'west' atPosition: ((Dictionary new) add: ('x'->0); add: ('y'->0); yourself); sendInstructions: 'R' .
	self assert: result equals: ((Dictionary new) add: ('direction'->'north'); add: ('position'->((Dictionary new) add: ('x'->0); add: ('y'->0); yourself)); yourself)
]

{ #category : #tests }
RobotSimulatorTest >> test07_RotatesTheRobotsDirection90DegreesCounterclockwiseChangesTheDirectionFromNorthToWest [
	| result |

	result := robotSimulator startFacing: 'north' atPosition: ((Dictionary new) add: ('x'->0); add: ('y'->0); yourself); sendInstructions: 'L' .
	self assert: result equals: ((Dictionary new) add: ('direction'->'west'); add: ('position'->((Dictionary new) add: ('x'->0); add: ('y'->0); yourself)); yourself)
]

{ #category : #tests }
RobotSimulatorTest >> test08_RotatesTheRobotsDirection90DegreesCounterclockwiseChangesTheDirectionFromWestToSouth [
	| result |

	result := robotSimulator startFacing: 'west' atPosition: ((Dictionary new) add: ('x'->0); add: ('y'->0); yourself); sendInstructions: 'L' .
	self assert: result equals: ((Dictionary new) add: ('direction'->'south'); add: ('position'->((Dictionary new) add: ('x'->0); add: ('y'->0); yourself)); yourself)
]

{ #category : #tests }
RobotSimulatorTest >> test09_RotatesTheRobotsDirection90DegreesCounterclockwiseChangesTheDirectionFromSouthToEast [
	| result |

	result := robotSimulator startFacing: 'south' atPosition: ((Dictionary new) add: ('x'->0); add: ('y'->0); yourself); sendInstructions: 'L' .
	self assert: result equals: ((Dictionary new) add: ('direction'->'east'); add: ('position'->((Dictionary new) add: ('x'->0); add: ('y'->0); yourself)); yourself)
]

{ #category : #tests }
RobotSimulatorTest >> test10_RotatesTheRobotsDirection90DegreesCounterclockwiseChangesTheDirectionFromEastToNorth [
	| result |

	result := robotSimulator startFacing: 'east' atPosition: ((Dictionary new) add: ('x'->0); add: ('y'->0); yourself); sendInstructions: 'L' .
	self assert: result equals: ((Dictionary new) add: ('direction'->'north'); add: ('position'->((Dictionary new) add: ('x'->0); add: ('y'->0); yourself)); yourself)
]

{ #category : #tests }
RobotSimulatorTest >> test11_MovesTheRobotForward1SpaceInTheDirectionItIsPointingIncreasesTheYCoordinateOneWhenFacingNorth [
	| result |

	result := robotSimulator startFacing: 'north' atPosition: ((Dictionary new) add: ('x'->0); add: ('y'->0); yourself); sendInstructions: 'A' .
	self assert: result equals: ((Dictionary new) add: ('direction'->'north'); add: ('position'->((Dictionary new) add: ('x'->0); add: ('y'->1); yourself)); yourself)
]

{ #category : #tests }
RobotSimulatorTest >> test12_MovesTheRobotForward1SpaceInTheDirectionItIsPointingDecreasesTheYCoordinateByOneWhenFacingSouth [
	| result |

	result := robotSimulator startFacing: 'south' atPosition: ((Dictionary new) add: ('x'->0); add: ('y'->0); yourself); sendInstructions: 'A' .
	self assert: result equals: ((Dictionary new) add: ('direction'->'south'); add: ('position'->((Dictionary new) add: ('x'->0); add: ('y'-> -1); yourself)); yourself)
]

{ #category : #tests }
RobotSimulatorTest >> test13_MovesTheRobotForward1SpaceInTheDirectionItIsPointingIncreasesTheXCoordinateByOneWhenFacingEast [
	| result |

	result := robotSimulator startFacing: 'east' atPosition: ((Dictionary new) add: ('x'->0); add: ('y'->0); yourself); sendInstructions: 'A' .
	self assert: result equals: ((Dictionary new) add: ('direction'->'east'); add: ('position'->((Dictionary new) add: ('x'->1); add: ('y'->0); yourself)); yourself)
]

{ #category : #tests }
RobotSimulatorTest >> test14_MovesTheRobotForward1SpaceInTheDirectionItIsPointingDecreasesTheXCoordinateByOneWhenFacingWest [
	| result |

	result := robotSimulator startFacing: 'west' atPosition: ((Dictionary new) add: ('x'->0); add: ('y'->0); yourself); sendInstructions: 'A' .
	self assert: result equals: ((Dictionary new) add: ('direction'->'west'); add: ('position'->((Dictionary new) add: ('x'-> -1); add: ('y'->0); yourself)); yourself)
]

{ #category : #tests }
RobotSimulatorTest >> test15_WhereRTurnRightLTurnLeftAndAAdvanceTheRobotCanFollowASeriesOfInstructionsAndEndUpWithTheCorrectPositionAndDirectionInstructionsToMoveEastAndNorthFromREADME [
	| result |

	result := robotSimulator startFacing: 'north' atPosition: ((Dictionary new) add: ('x'->7); add: ('y'->3); yourself); sendInstructions: 'RAALAL' .
	self assert: result equals: ((Dictionary new) add: ('direction'->'west'); add: ('position'->((Dictionary new) add: ('x'->9); add: ('y'->4); yourself)); yourself)
]

{ #category : #tests }
RobotSimulatorTest >> test16_WhereRTurnRightLTurnLeftAndAAdvanceTheRobotCanFollowASeriesOfInstructionsAndEndUpWithTheCorrectPositionAndDirectionInstructionsToMoveWestAndNorth [
	| result |

	result := robotSimulator startFacing: 'north' atPosition: ((Dictionary new) add: ('x'->0); add: ('y'->0); yourself); sendInstructions: 'LAAARALA' .
	self assert: result equals: ((Dictionary new) add: ('direction'->'west'); add: ('position'->((Dictionary new) add: ('x'-> -4); add: ('y'->1); yourself)); yourself)
]

{ #category : #tests }
RobotSimulatorTest >> test17_WhereRTurnRightLTurnLeftAndAAdvanceTheRobotCanFollowASeriesOfInstructionsAndEndUpWithTheCorrectPositionAndDirectionInstructionsToMoveWestAndSouth [
	| result |

	result := robotSimulator startFacing: 'east' atPosition: ((Dictionary new) add: ('x'->2); add: ('y'-> -7); yourself); sendInstructions: 'RRAAAAALA' .
	self assert: result equals: ((Dictionary new) add: ('direction'->'south'); add: ('position'->((Dictionary new) add: ('x'-> -3); add: ('y'-> -8); yourself)); yourself)
]

{ #category : #tests }
RobotSimulatorTest >> test18_WhereRTurnRightLTurnLeftAndAAdvanceTheRobotCanFollowASeriesOfInstructionsAndEndUpWithTheCorrectPositionAndDirectionInstructionsToMoveEastAndNorth [
	| result |

	result := robotSimulator startFacing: 'south' atPosition: ((Dictionary new) add: ('x'->8); add: ('y'->4); yourself); sendInstructions: 'LAAARRRALLLL' .
	self assert: result equals: ((Dictionary new) add: ('direction'->'north'); add: ('position'->((Dictionary new) add: ('x'->11); add: ('y'->5); yourself)); yourself)
]
