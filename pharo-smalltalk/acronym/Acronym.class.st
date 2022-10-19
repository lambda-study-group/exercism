Class {
	#name : #Acronym,
	#superclass : #Object,
	#category : #'Exercise@Acronym'
}

{ #category : #exercism }
Acronym >> abbreviatePhrase: aString [
  "Return an acronym of a phrase"
  ^(([:c |  ' -' includes: c ] split: aString)
		select: [ :word | word isNotEmpty ] 
		thenCollect: [:word |  (word at: (word findFirst: [:c | c isLetter ])) 
			asUppercase ]) asArray as: String.
]
