Class {
	#name : #Etl,
	#superclass : #Object,
	#category : #'Exercise@Etl'
}

{ #category : #'as yet unclassified' }
Etl >> transformData: aCollection [ 
	^(aCollection keys
		flatCollect: [ :k | (aCollection at: k) 
									collect: [ :v | (v asLowercase)->(k asInteger) ] ]) asDictionary.
]
