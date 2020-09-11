Class {
	#name : #CyUniqueConstraintSpecifier,
	#superclass : #CyObject,
	#instVars : [
		'node',
		'prop'
	],
	#category : 'SCypher-Core'
}

{ #category : #'instance creation' }
CyUniqueConstraintSpecifier class >> node: node prop: prop [
	| inst |
	inst := self new.
	inst node: node.
	inst prop: prop.
	^inst
]

{ #category : #accessing }
CyUniqueConstraintSpecifier >> node [
	^ node
]

{ #category : #accessing }
CyUniqueConstraintSpecifier >> node: anObject [
	node := anObject
]

{ #category : #accessing }
CyUniqueConstraintSpecifier >> prop [
	^ prop
]

{ #category : #accessing }
CyUniqueConstraintSpecifier >> prop: anObject [
	prop := anObject
]

{ #category : #printing }
CyUniqueConstraintSpecifier >> tokensAssertionOn: tokens [
	tokens spacedAdd: 'ASSERT'.
	tokens add: (self node accessor: self prop) cypherString.
	tokens spacedAdd: 'IS UNIQUE'.
	
]

{ #category : #printing }
CyUniqueConstraintSpecifier >> tokensOn: tokens [
	tokens spacedAdd: 'CONSTRAINT ON'.
	self tokensTargetOn: tokens.
	self tokensAssertionOn: tokens
]

{ #category : #printing }
CyUniqueConstraintSpecifier >> tokensTargetOn: tokens [
	tokens spacedAdd: self node cypherString
]
