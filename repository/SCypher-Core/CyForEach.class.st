Class {
	#name : #CyForEach,
	#superclass : #CyClause,
	#instVars : [
		'inExpression',
		'updatingClauses'
	],
	#category : 'SCypher-Core'
}

{ #category : #'instance creation' }
CyForEach class >> variable: iterationVariable in: collectionExpression do: updatingClause [
	| inst |
	inst := self new.
	inst variable: iterationVariable.
	inst inExpression: collectionExpression.
	updatingClause isArray
		ifTrue: [ inst updatingClauses: updatingClause ]
		ifFalse: [ inst updatingClauses: {updatingClause} ].
	^ inst
]

{ #category : #accessing }
CyForEach >> inExpression [
	^ inExpression
]

{ #category : #accessing }
CyForEach >> inExpression: anObject [
	inExpression := anObject
]

{ #category : #printing }
CyForEach >> tokensOn: tokens [
	tokens add: self keyword; space.
	tokens parenBegin.
	tokens spacedAdd: self value cypherString.
	tokens spacedAdd: 'IN'.
	tokens spacedAdd: self inExpression cypherString.
	tokens spacedAdd: '|'.
	self tokensUpdatingClausesOn: tokens.
	tokens parenEnd 
]

{ #category : #printing }
CyForEach >> tokensUpdatingClausesOn: tokens [
	tokens addAll: (self join: ' ' in: self updatingClauses by: #cypherString)
]

{ #category : #accessing }
CyForEach >> updatingClauses [
	^ updatingClauses ifNil: [updatingClauses := OrderedCollection new]
]

{ #category : #accessing }
CyForEach >> updatingClauses: anObject [
	updatingClauses := anObject
]

{ #category : #accessing }
CyForEach >> variable [
	^self value	
]

{ #category : #accessing }
CyForEach >> variable: iterationVariable [
	self value: iterationVariable
]
