"
# Hello World

The classical introductory exercise. Just say ""Hello, World!"".

[""Hello, World!""](http://en.wikipedia.org/wiki/%22Hello,_world!%22_program) is
the traditional first program for beginning programming in a new language
or environment.

The objectives are simple:

- Write a function that returns the string ""Hello, World!"".
- Run the test suite and make sure that it succeeds.
- Submit your solution and check it at the website.

If everything goes well, you will be ready to fetch your first real exercise

## Hint

If you are editting this file in a text editor and not in Pharo - 
please review the [Getting Started](https://exercism.io/tracks/pharo/installation) section. 

While you can use a text editor, the Pharo IDE is partly what makes the language so special.

In Pharo you can run code (including tests) with broken methods and missing classes.  When the VM encounters broken code, it raises a debugger which lets you explore the problem a little better.  

You then have the option to press the Create button to add a missing class or method, as well as correct any code that causes an error. When you do so, the debugger will backup and let you resume execution with your new changes.

Try doing this with your HelloWorld example, by simply running any one of the unit test methods.
"
Class {
	#name : #HelloWorldTest,
	#superclass : #ExercismTest,
	#category : #'Exercise@HelloWorld'
}

{ #category : #config }
HelloWorldTest class >> exercise [
	"Answer the configured exercise meta data for this exercise, an ExercismExercise.
	HelloWorld is a special case as it's the first exercise"
	
	^(ExercismExercise for: self) 
		isCore: true;
		isAutoApproved: true;
		difficulty: 1;
		topics: #('introduction' 'strings');
		yourself
]

{ #category : #config }
HelloWorldTest class >> uuid [
	"Answer a unique id for this exercise"
	^'a1812b5e-2788-4ea6-b948-bfe54edeb0da'
]

{ #category : #config }
HelloWorldTest class >> version [
	"Answer the exercise version number string this test was derived from"
	
	^'1.1.0'  
]

{ #category : #testing }
HelloWorldTest >> testHello [
	self assert: HelloWorld sayHello equals: 'Hello, World!'
]
