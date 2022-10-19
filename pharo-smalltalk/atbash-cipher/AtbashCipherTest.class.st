"
# Atbash Cipher

Create an implementation of the atbash cipher, an ancient encryption system created in the Middle East.

The Atbash cipher is a simple substitution cipher that relies on
transposing all the letters in the alphabet such that the resulting
alphabet is backwards. The first letter is replaced with the last
letter, the second with the second-last, and so on.

An Atbash cipher for the Latin alphabet would be as follows:

```text
Plain:  abcdefghijklmnopqrstuvwxyz
Cipher: zyxwvutsrqponmlkjihgfedcba
```

It is a very weak cipher because it only has one possible key, and it is
a simple monoalphabetic substitution cipher. However, this may not have
been an issue in the cipher's time.

Ciphertext is written out in groups of fixed length, the traditional group size
being 5 letters, and punctuation is excluded. This is to make it harder to guess
things based on word boundaries.

## Examples

- Encoding `test` gives `gvhg`
- Decoding `gvhg` gives `test`
- Decoding `gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt` gives `thequickbrownfoxjumpsoverthelazydog`

## Hint

This is a fun little exercise, just follow the tests.

"
Class {
	#name : #AtbashCipherTest,
	#superclass : #ExercismTest,
	#instVars : [
		'atbashCipherCalculator'
	],
	#category : #'Exercise@AtbashCipher'
}

{ #category : #config }
AtbashCipherTest class >> exercise [
	"Answer the configured exercise meta data for this exercise, an ExercismExercise"

	^ (self createExerciseAfter: GrainsTest)
		isCore: false;
		difficulty: 3;
		topics: #('algorithms' 'strings' 'transforming' 'cryptography');
		yourself
]

{ #category : #config }
AtbashCipherTest class >> uuid [
	"Answer a unique id for this exercise"
	^'c728b116-9d41-0d00-8fd2-aa8a08866539'
]

{ #category : #config }
AtbashCipherTest class >> version [
	"Generated from specification: 29 March 2019"
	^'1.2.0'
]

{ #category : #running }
AtbashCipherTest >> setUp [
	super setUp.
	atbashCipherCalculator := AtbashCipher new
]

{ #category : #tests }
AtbashCipherTest >> test01_EncodeEncodeYes [
	| result |

	result := atbashCipherCalculator encodePhrase: 'yes' .
	self assert: result equals: 'bvh'
]

{ #category : #tests }
AtbashCipherTest >> test02_EncodeEncodeNo [
	| result |

	result := atbashCipherCalculator encodePhrase: 'no' .
	self assert: result equals: 'ml'
]

{ #category : #tests }
AtbashCipherTest >> test03_EncodeEncodeOMG [
	| result |

	result := atbashCipherCalculator encodePhrase: 'OMG' .
	self assert: result equals: 'lnt'
]

{ #category : #tests }
AtbashCipherTest >> test04_EncodeEncodeSpaces [
	| result |

	result := atbashCipherCalculator encodePhrase: 'O M G' .
	self assert: result equals: 'lnt'
]

{ #category : #tests }
AtbashCipherTest >> test05_EncodeEncodeMindblowingly [
	| result |

	result := atbashCipherCalculator encodePhrase: 'mindblowingly' .
	self assert: result equals: 'nrmwy oldrm tob'
]

{ #category : #tests }
AtbashCipherTest >> test06_EncodeEncodeNumbers [
	| result |

	result := atbashCipherCalculator encodePhrase: 'Testing,1 2 3, testing.' .
	self assert: result equals: 'gvhgr mt123 gvhgr mt'
]

{ #category : #tests }
AtbashCipherTest >> test07_EncodeEncodeDeepThought [
	| result |

	result := atbashCipherCalculator encodePhrase: 'Truth is fiction.' .
	self assert: result equals: 'gifgs rhurx grlm'
]

{ #category : #tests }
AtbashCipherTest >> test08_EncodeEncodeAllTheLetters [
	| result |

	result := atbashCipherCalculator encodePhrase: 'The quick brown fox jumps over the lazy dog.' .
	self assert: result equals: 'gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt'
]

{ #category : #tests }
AtbashCipherTest >> test09_DecodeDecodeExercism [
	| result |

	result := atbashCipherCalculator decodePhrase: 'vcvix rhn' .
	self assert: result equals: 'exercism'
]

{ #category : #tests }
AtbashCipherTest >> test10_DecodeDecodeASentence [
	| result |

	result := atbashCipherCalculator decodePhrase: 'zmlyh gzxov rhlug vmzhg vkkrm thglm v' .
	self assert: result equals: 'anobstacleisoftenasteppingstone'
]

{ #category : #tests }
AtbashCipherTest >> test11_DecodeDecodeNumbers [
	| result |

	result := atbashCipherCalculator decodePhrase: 'gvhgr mt123 gvhgr mt' .
	self assert: result equals: 'testing123testing'
]

{ #category : #tests }
AtbashCipherTest >> test12_DecodeDecodeAllTheLetters [
	| result |

	result := atbashCipherCalculator decodePhrase: 'gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt' .
	self assert: result equals: 'thequickbrownfoxjumpsoverthelazydog'
]

{ #category : #tests }
AtbashCipherTest >> test13_DecodeDecodeWithTooManySpaces [
	| result |

	result := atbashCipherCalculator decodePhrase: 'vc vix    r hn' .
	self assert: result equals: 'exercism'
]

{ #category : #tests }
AtbashCipherTest >> test14_DecodeDecodeWithNoSpaces [
	| result |

	result := atbashCipherCalculator decodePhrase: 'zmlyhgzxovrhlugvmzhgvkkrmthglmv' .
	self assert: result equals: 'anobstacleisoftenasteppingstone'
]
