Class {
	#name : #CyConstraintSpecifier,
	#superclass : #CyCommandSpecifier,
	#instVars : [
		'predicate'
	],
	#category : #'SCypher-Core'
}

{ #category : #'instance creation' }
CyConstraintSpecifier class >> node: node prop: prop [
	^ self target: node props: (CyObjects with: prop)
]

{ #category : #'instance creation' }
CyConstraintSpecifier class >> target: nodeOrRelationship props: props [
	^ self new
		target: nodeOrRelationship;
		props: props;
		yourself
]

{ #category : #actions }
CyConstraintSpecifier >> isKey [
	self predicate: (CyExpression isKey: self props)
]

{ #category : #actions }
CyConstraintSpecifier >> isNull [
	self predicate: (CyExpression isNull: self props)
]

{ #category : #actions }
CyConstraintSpecifier >> notNull [
	self predicate: (CyExpression isNotNull: self props)
]

{ #category : #accessing }
CyConstraintSpecifier >> predicate [

	^ predicate
]

{ #category : #accessing }
CyConstraintSpecifier >> predicate: anObject [

	predicate := anObject
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
	self predicate ifNil: [ ^self ].
	tokens spacedAdd: 'REQUIRE'.
	tokens spacedAdd: self predicate cypherString
	
]

{ #category : #actions }
CyConstraintSpecifier >> unique [
	self predicate: (CyExpression isUnique: self props)
]
