Class {
	#name : #HighScores,
	#superclass : #Object,
	#category : #'Exercise@HighScores'
}

{ #category : #exercism }
HighScores >> latestScore: aCollection [ 
	^aCollection last.
]

{ #category : #exercism }
HighScores >> personalBestScores: aCollection [ 
	^aCollection max.
]

{ #category : #exercism }
HighScores >> personalTopThreeScores: aCollection [ 
	^(aCollection sorted: [ :a :b | a > b ]) copyFrom: 1 to: (3 min: (aCollection size)).
]

{ #category : #exercism }
HighScores >> scores: aCollection [ 
	^aCollection.
]
