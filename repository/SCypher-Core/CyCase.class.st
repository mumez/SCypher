Class {
	#name : #CyCase,
	#superclass : #CyAtomExpression,
	#instVars : [
		'alternatives',
		'else'
	],
	#category : 'SCypher-Core'
}

{ #category : #'instance creation' }
CyCase class >> of: target when: whenExpression then: thenExpression [
]

{ #category : #'instance creation' }
CyCase class >> of: target when: whenExpression then: thenExpression else: elseExpression [
	^(self of: target)
		when: whenExpression then: thenExpression;
		else: elseExpression;
		yourself
]

{ #category : #'instance creation' }
CyCase class >> when: whenExpression then: thenExpression [
	^self of: nil when: whenExpression then: thenExpression
]

{ #category : #'instance creation' }
CyCase class >> when: whenExpression then: thenExpression else: elseExpression [
	^self of: nil when: whenExpression then: thenExpression else: elseExpression 
]

{ #category : #accessing }
CyCase >> alternatives [
	^ alternatives ifNil: [ alternatives := OrderedCollection new]
]

{ #category : #accessing }
CyCase >> alternatives: anObject [
	alternatives := anObject
]

{ #category : #accessing }
CyCase >> else [
	^ else
]

{ #category : #accessing }
CyCase >> else: anObject [
	else := anObject asCypherValue 
]

{ #category : #accessing }
CyCase >> target [
	^ self value
]

{ #category : #printing }
CyCase >> tokensAlternativesOn: tokens [
	self alternatives do: [ :each |
		tokens spacedAdd: each cypherString
	]
]

{ #category : #printing }
CyCase >> tokensElseOn: tokens [
	self else ifNil: [ ^self ].
	tokens add: 'ELSE'.
	tokens spacedAdd: self else cypherString
]

{ #category : #printing }
CyCase >> tokensOn: tokens [
	tokens spacedAdd: 'CASE'.
	self target ifNotNil: [:tar | tokens spacedAdd: tar cypherString].
	self tokensAlternativesOn: tokens.
	self tokensElseOn: tokens.
	tokens spacedAdd: 'END'
]

{ #category : #actions }
CyCase >> when: whenExpression then: thenExpression [
	self alternatives add: (CyCaseAlternative when: whenExpression then: thenExpression).
	
]
