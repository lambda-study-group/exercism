"
# ReverseString

This class implements string reversal from first principles, i.e. using character level iteration
and writing to streams.


Public API and Key Messages

- reverseValue: aString -    
 
- Instance creation: ReverseString new.

   revStr := ReverseString new.
	revStr reverseValue: 'asdf'.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #ReverseString,
	#superclass : #Object,
	#category : #'Exercise@ReverseString'
}

{ #category : #exercism }
ReverseString >> reverseValue:aString [
	"Return a reverse of the supplied string"	
			
	| st |
	st := WriteStream on: String new.
	aString reverseDo: [ :c | st nextPut: c ].
	^st contents.
]
