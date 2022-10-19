Class {
	#name : #Raindrops,
	#superclass : #Object,
	#category : #'Exercise@Raindrops'
}

{ #category : #'as yet unclassified' }
Raindrops >> convertNumber: anInteger [ 
	|st d|
	st := WriteStream on: String new.
	d := OrderedDictionary new add: 3->'Pling'; add: 5->'Plang'; add: 7->'Plong'; yourself.
	d keysAndValuesDo: [ :k :v | anInteger \\ k = 0 ifTrue: [st nextPutAll: v] ].
	st isEmpty
		ifTrue: [ st nextPutAll: (anInteger asString) ].
	^st contents.
]
