Class {
	#name : #SumOfMultiples,
	#superclass : #Object,
	#category : #'Exercise@SumOfMultiples'
}

{ #category : #exercism }
SumOfMultiples >> sumFactors: anArray limit: aNumber [
	"Sum all the unique multiples of factors below a certain limit"	
			
	^(1 to: (aNumber - 1)) inject: 0 into: [ :acc :n |	 
			((anArray reject: [ :el | el isZero ]) anySatisfy: [ :factor | n \\ factor = 0 ])
				ifTrue: [ acc + n ]
				ifFalse: [ acc ] ].
]
