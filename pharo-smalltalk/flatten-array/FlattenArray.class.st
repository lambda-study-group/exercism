Class {
	#name : #FlattenArray,
	#superclass : #Object,
	#category : #'Exercise@FlattenArray'
}

{ #category : #exercism }
FlattenArray >> flattenArray: anArray [
	"Use a recursive utility function to obtain a flat array of non-Nil items"	
			
	| as |
	as := WriteStream on: Array new.
	self flattenUtil: anArray stream: as.
	^as contents.
]

{ #category : #utility }
FlattenArray >> flattenUtil: item stream: aStream [
  "Recursively handle processing an array, writing non-Nil elements to a stream"

  item isNotNil 
	ifTrue: [ item isArray 
		ifTrue: [ item do: [:el |  self flattenUtil: el stream: aStream ] ] 
		ifFalse: [ aStream nextPut: item ] ].
]
