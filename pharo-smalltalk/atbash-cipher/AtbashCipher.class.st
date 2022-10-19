Class {
	#name : #AtbashCipher,
	#superclass : #Object,
	#classVars : [
		'KeyDictionary'
	],
	#category : #'Exercise@AtbashCipher'
}

{ #category : #'class initialization' }
AtbashCipher class >> initialize [
	"comment stating purpose of message"

	|alphabet digits|
	alphabet := ($a to: $z) as: String.
	digits := ($0 to: $9) as: String.
	KeyDictionary := Dictionary new.
	(digits, alphabet) with: (digits, alphabet reverse) do: [ :a :b | KeyDictionary at: a put: b ].
]

{ #category : #'as yet unclassified' }
AtbashCipher >> decodePhrase: aString [ 
	|st|
	st := WriteStream on: String new.
	aString do: [ :c | c isAlphaNumeric 
								ifTrue: [ st nextPut: (KeyDictionary at: (c asLowercase)) ] ].												
	^ st contents.
]

{ #category : #'as yet unclassified' }
AtbashCipher >> encodePhrase: aString [ 
	|st cnt|
	st := WriteStream on: String new.
	cnt := 0.
	aString do: [ :c | c isAlphaNumeric 
								ifTrue: [ ((cnt > 0) & (cnt \\ 5 = 0))
												ifTrue: [ st nextPut: $  ].
											 cnt := cnt + 1.
											 st nextPut: (KeyDictionary at: (c asLowercase)) ] ].												
	^ st contents.
]
