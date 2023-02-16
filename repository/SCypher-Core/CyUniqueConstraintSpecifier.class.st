Class {
	#name : #CyUniqueConstraintSpecifier,
	#superclass : #CyObject,
	#instVars : [
		'node',
		'prop'
	],
	#category : #'SCypher-Core'
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
CyUniqueConstraintSpecifier >> tokensOn: tokens [
	tokens spacedAdd: 'CONSTRAINT'.
	self tokensTargetOn: tokens.
	self tokensRequireOn: tokens
]

{ #category : #printing }
CyUniqueConstraintSpecifier >> tokensRequireOn: tokens [
	tokens spacedAdd: 'REQUIRE'.
	tokens add: (self node accessor: self prop) cypherString.
	tokens spacedAdd: 'IS UNIQUE'.
	
]

{ #category : #printing }
CyUniqueConstraintSpecifier >> tokensTargetOn: tokens [
	tokens spacedAdd: 'FOR'.
	tokens spacedAdd: self node cypherString
]
