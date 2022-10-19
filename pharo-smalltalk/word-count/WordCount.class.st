Class {
	#name : #WordCount,
	#superclass : #Object,
	#category : #'Exercise@WordCount'
}

{ #category : #exercism }
WordCount >> countWordsSentence: aString [
	"Return a dictionary of word counts"	
			
	| words w |
	words := Dictionary new.
	([ :c | ' ,
' includes: c ] split: aString) do: [ :word |
		word isEmpty
			ifTrue: [  ]
			ifFalse: [ 
				w := (self trimSpacesAndQuotes: word) asLowercase.
				(words includesKey: w)
					ifTrue: [ words at: w put: (words at: w) + 1 ]
					ifFalse: [ words at: w put: 1 ] ] ].
	^words.
]

{ #category : #utility }
WordCount >> trimSpacesAndQuotes: aString [
  "Trim a string by removing whitespaces and then quotes, next removing all unnecessary characters"

  | s |
  s := aString trim.
  s := s copyFrom: (s findFirst: [:c |  c ~= $' ]) to: (s findLast: [:c |  c ~= $' ]).
  ^s copyFrom: (s findFirst: [:c |  c isLetter | c isDigit ]) to: (s findLast: [:c |  c isLetter | c isDigit ])
]
