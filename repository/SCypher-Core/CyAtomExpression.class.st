Class {
	#name : #CyAtomExpression,
	#superclass : #CyObject,
	#category : 'SCypher-Core'
}

{ #category : #printing }
CyAtomExpression >> tokensOn: tokens [
	self value ifNotNil: [:nm | tokens add: nm cypherString ].
	self tokensAliasOn: tokens
]
