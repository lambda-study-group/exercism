Class {
	#name : #HelloWorld,
	#superclass : #Object,
	#category : #'Exercise@HelloWorld'
}

{ #category : #running }
HelloWorld class >> sayHello [
	"Return a 'Hello World' strign"			
	^'Hello, World!'.
]
