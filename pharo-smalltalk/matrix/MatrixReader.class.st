Class {
	#name : #MatrixReader,
	#superclass : #Object,
	#category : #'Exercise@Matrix'
}

{ #category : #exercism }
MatrixReader >> input: aMatrix atColumn: aColumn [
	"Return a column extracted from a textual representation of a matrix"	
	
	^((aMatrix splitOn: Character cr) collect: [ :item | ((item splitOn: $ ) at: aColumn) asNumber ]) asArray.
]

{ #category : #exercism }
MatrixReader >> input: aMatrix atRow: aRow [
	"Return a row extracted from a textual representation of a matrix"	

	^((((aMatrix splitOn: Character cr) at: aRow) splitOn: $ ) collect: [ :n | n asNumber ]) asArray.
]
