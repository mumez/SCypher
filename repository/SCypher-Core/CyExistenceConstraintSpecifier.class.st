Class {
	#name : #CyExistenceConstraintSpecifier,
	#superclass : #CyObject,
	#instVars : [
		'target',
		'prop',
		'isForRelationship'
	],
	#category : 'SCypher-Core'
}

{ #category : #'instance creation' }
CyExistenceConstraintSpecifier class >> relationshipName: relationshipName type: relationshipType prop: prop [
	^self target: (CyRelationship start: '' end: '' name: relationshipName type: relationshipType) prop: prop
]

{ #category : #'instance creation' }
CyExistenceConstraintSpecifier class >> target: nodeOrRelationshipPattern prop: prop [
	| inst |
	inst := self new.
	inst target: nodeOrRelationshipPattern.
	inst prop: prop.
	^inst
]

{ #category : #accessing }
CyExistenceConstraintSpecifier >> isForRelationship [
	^isForRelationship ifNil: [ isForRelationship := false ]
]

{ #category : #accessing }
CyExistenceConstraintSpecifier >> isForRelationship: aBoolean [
	isForRelationship := aBoolean 
]

{ #category : #accessing }
CyExistenceConstraintSpecifier >> prop [
	^ prop
]

{ #category : #accessing }
CyExistenceConstraintSpecifier >> prop: anObject [
	prop := anObject
]

{ #category : #accessing }
CyExistenceConstraintSpecifier >> target [
	^ target
]

{ #category : #accessing }
CyExistenceConstraintSpecifier >> target: anObject [
	target := anObject
]

{ #category : #printing }
CyExistenceConstraintSpecifier >> tokensAssertionOn: tokens [
	tokens spacedAdd: 'ASSERT'.
	tokens add: (CyFuncInvocation exists: (self target accessor: self prop)) cypherString.
]

{ #category : #printing }
CyExistenceConstraintSpecifier >> tokensOn: tokens [
	tokens spacedAdd: 'CONSTRAINT ON'.
	self tokensTargetOn: tokens.
	self tokensAssertionOn: tokens
]

{ #category : #printing }
CyExistenceConstraintSpecifier >> tokensTargetOn: tokens [
	tokens spacedAdd: self target cypherString
]
