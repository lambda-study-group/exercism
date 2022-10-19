Extension { #name : #Integer }

{ #category : #'*Exercise@Die' }
Integer >> d10 [
	"Create a handle of that many 10-faced dice"
	
	| handle |
	handle := DieHandle new.
	1 to: self do: [ :n | handle addDie: (Die withFaces: 10) ].
	^handle.
]

{ #category : #'*Exercise@Die' }
Integer >> d20 [
	"Create a handle of that many 20-faced dice"
	
	| handle |
	handle := DieHandle new.
	1 to: self do: [ :n | handle addDie: (Die withFaces: 20) ].
	^handle.
]
