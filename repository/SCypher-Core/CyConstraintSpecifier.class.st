Class {
	#name : #CyConstraintSpecifier,
	#superclass : #CyObject,
	#instVars : [
		'name',
		'ifExpression',
		'target',
		'predicate'
	],
	#category : #'SCypher-Core'
}

{ #category : #'instance creation' }
CyConstraintSpecifier class >> node: node prop: prop [
	| inst |
	inst := self new.
	inst node: node.
	inst prop: prop.
	^inst
]

{ #category : #accessing }
CyConstraintSpecifier >> ifExpression [

	^ ifExpression
]

{ #category : #accessing }
CyConstraintSpecifier >> ifExpression: anObject [

	ifExpression := anObject
]

{ #category : #accessing }
CyConstraintSpecifier >> name [

	^ name
]

{ #category : #accessing }
CyConstraintSpecifier >> name: anObject [

	name := anObject
]

{ #category : #accessing }
CyConstraintSpecifier >> predicate [

	^ predicate
]

{ #category : #accessing }
CyConstraintSpecifier >> predicate: anObject [

	predicate := anObject
]

{ #category : #accessing }
CyConstraintSpecifier >> target [

	^ target
]

{ #category : #accessing }
CyConstraintSpecifier >> target: anObject [

	target := anObject
]

{ #category : #printing }
CyConstraintSpecifier >> tokensForOn: tokens [
	self target ifNil: [ ^self ].
	tokens spacedAdd: 'FOR'.
	tokens spacedAdd: self target cypherString.
]

{ #category : #printing }
CyConstraintSpecifier >> tokensIfOn: tokens [
	self ifExpression ifNil: [ ^self ].
	tokens spacedAdd: 'IF'.
	tokens spacedAdd: self ifExpression
]

{ #category : #printing }
CyConstraintSpecifier >> tokensNameOn: tokens [
	self name ifNil: [ ^self ].
	tokens spacedAdd: self name
]

{ #category : #printing }
CyConstraintSpecifier >> tokensOn: tokens [
	tokens spacedAdd: 'CONSTRAINT'.
	self tokensNameOn: tokens.
	self tokensIfOn: tokens.
	self tokensForOn: tokens.
	self tokensRequireOn: tokens
]

{ #category : #printing }
CyConstraintSpecifier >> tokensRequireOn: tokens [
	tokens spacedAdd: 'REQUIRE'.
	tokens spacedAdd: self predicate
	
]
