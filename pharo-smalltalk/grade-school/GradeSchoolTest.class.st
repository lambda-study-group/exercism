"
# Grade School

Given students' names along with the grade that they are in, create a roster
for the school.

In the end, you should be able to:

- Add a student's name to the roster for a grade
  - ""Add Jim to grade 2.""
  - ""OK.""
- Get a list of all students enrolled in a grade
  - ""Which students are in grade 2?""
  - ""We've only got Jim just now.""
- Get a sorted list of all students in all grades.  Grades should sort
  as 1, 2, 3, etc., and students within a grade should be sorted
  alphabetically by name.
  - ""Who all is enrolled in school right now?""
  - ""Grade 1: Anna, Barb, and Charlie. Grade 2: Alex, Peter, and Zoe.
    Grade 3…""

Note that all our students only have one name.  (It's a small town, what
do you want?)

## For bonus points

Did you get the tests passing and the code clean? If you want to, these
are some additional things you could try:

- If you're working in a language with mutable data structures and your
  implementation allows outside code to mutate the school's internal DB
  directly, see if you can prevent this. Feel free to introduce additional
  tests.

Then please share your thoughts in a comment on the submission. Did this
experiment make the code better? Worse? Did you learn anything from it?

## Hint

It isn't strictly necessary to model students as a seperate object, you can use a convenient internal data strcture as the requirements are quite simple (and as long as it doesn't leak out into the results).

Note: this exercise has been slightly modified from the problem-specification, as it makes more sense to seperate adding students and querying them in seperate methods (vs. having one method doing both, which feels less Pharo/Smalltalk like).

"
Class {
	#name : #GradeSchoolTest,
	#superclass : #ExercismTest,
	#instVars : [
		'gradeSchoolCalculator'
	],
	#category : #'Exercise@GradeSchool'
}

{ #category : #config }
GradeSchoolTest class >> exercise [
	"Answer the configured exercise meta data for this exercise, an ExercismExercise"
	
	
	^(self createExerciseAfter: MatrixTest)
		isCore: true;
		difficulty: 4;
		topics: #('sorting' 'filtering' 'lists' 'object_oriented_programming');
		yourself
				
]

{ #category : #generator }
GradeSchoolTest class >> generator [
	"Potential generator hints"
	
	^ {('rosterStudents:' -> #('addStudents:' 'roster')).
	('gradeStudents:desiredGrade:' -> #('addStudents:' 'desiredGrade:'))}
]

{ #category : #config }
GradeSchoolTest class >> uuid [
	"Answer a unique id for this exercise"
	^'8198e8bb-8040-0d00-812f-dfab01deb008'
]

{ #category : #config }
GradeSchoolTest class >> version [
	"Generated from specification: 15 March 2019"
	^'1.0.0'
]

{ #category : #running }
GradeSchoolTest >> setUp [
	super setUp.
	gradeSchoolCalculator := GradeSchool new
]

{ #category : #tests }
GradeSchoolTest >> test01_AddingAStudentAddsThemToTheSortedRoster [
	| result |

	result := gradeSchoolCalculator
		addStudents: #(#('Aimee' 2));
		roster.
		
	self assert: result equals: #('Aimee')
]

{ #category : #tests }
GradeSchoolTest >> test02_AddingMoreStudentAddsThemToTheSortedRoster [
	| result |

	result := gradeSchoolCalculator
		addStudents: #(#('Blair' 2) #('James' 2) #('Paul' 2));
		roster.
		
	self assert: result equals: #('Blair' 'James' 'Paul')
]

{ #category : #tests }
GradeSchoolTest >> test03_AddingStudentsToDifferentGradesAddsThemToTheSameSortedRoster [
	| result |

	result := gradeSchoolCalculator
		addStudents: #(#('Chelsea' 3) #('Logan' 7));
		roster.
		
	self assert: result equals: #('Chelsea' 'Logan')
]

{ #category : #tests }
GradeSchoolTest >> test04_RosterReturnsAnEmptyListIfThereAreNoStudentsEnrolled [
	| result |

	result := gradeSchoolCalculator
		addStudents: #();
		roster.
		
	self assert: result equals: #()
]

{ #category : #tests }
GradeSchoolTest >> test05_StudentNamesWithGradesAreDisplayedInTheSameSortedRoster [
	| result |

	result := gradeSchoolCalculator
		addStudents:
			#(#('Peter' 2) #('Anna' 1) #('Barb' 1) #('Zoe' 2) #('Alex' 2) #('Jim' 3) #('Charlie' 1));
		roster.
		
	self
		assert: result
		equals: #('Anna' 'Barb' 'Charlie' 'Alex' 'Peter' 'Zoe' 'Jim')
]

{ #category : #tests }
GradeSchoolTest >> test06_GradeReturnsTheStudentsInThatGradeInAlphabeticalOrder [
	| result |

	result := gradeSchoolCalculator addStudents: #(#('Franklin' 5 ) #('Bradley' 5 ) #('Jeff' 1 ) ); desiredGrade: 5.
	self assert: result equals: #('Bradley' 'Franklin' )
]

{ #category : #tests }
GradeSchoolTest >> test07_GradeReturnsAnEmptyListIfThereAreNoStudentsInThatGrade [
	| result |

	result := gradeSchoolCalculator
		addStudents: #();
		desiredGrade: 1.
		
	self assert: result equals: #()
]

{ #category : #'tests-extra' }
GradeSchoolTest >> test100_EnsureDataIsImmutable [
	| result |

	result := gradeSchoolCalculator
		addStudents: #(#('Chelsea' 3) #('Logan' 7));
		yourself.
		
	result roster at: 1 put: 'Not Chelsea'.
		
	self assert: result roster equals: #('Chelsea' 'Logan')
]
