Class {
	#name : #GradeSchool,
	#superclass : #Object,
	#instVars : [
		'roster'
	],
	#category : #'Exercise@GradeSchool'
}

{ #category : #adding }
GradeSchool >> addStudents: aList [
	"Create a class roster based on a list of student-grade pairs"	

	roster := Dictionary new.
	aList do: [ :item |
		| grade person arr |
		grade := item at: 2.
		person := item at: 1.
		arr := roster at: grade ifAbsent: OrderedCollection new.
		arr add: person.
		roster at: grade put: arr ].
	^self.
]

{ #category : #exercism }
GradeSchool >> desiredGrade: aNumber [
	"Return a sorted array of students in a particular grade"	
			
	^((roster at: aNumber ifAbsent: #()) asArray) sort.
]

{ #category : #exercism }
GradeSchool >> roster [
	"Return a roster sorted by grades and then by names"	
	
	| r |
	r := WriteStream on: Array new.	
	roster keys sort do: [ :k |
		(roster at: k) sort do: [ :name | r nextPut: name ] ].
	^r contents.
]
