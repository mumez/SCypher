Class {
	#name : #CyFilterExpression,
	#superclass : #CyObject,
	#instVars : [
		'where'
	],
	#category : 'SCypher-Core'
}

{ #category : #'instance creation' }
CyFilterExpression class >> each: eachExp in: inExp [
	^self each: eachExp in: inExp where: nil
]

{ #category : #'instance creation' }
CyFilterExpression class >> each: eachExp in: inExp where: whereExpression [
	| inst |
	inst := self of: (CyExpression each: eachExp in: inExp).
	inst where: whereExpression.
	^ inst
]

{ #category : #printing }
CyFilterExpression >> tokensOn: tokens [
	tokens add: self value cypherString.
	self tokensWhereOn: tokens.
]

{ #category : #printing }
CyFilterExpression >> tokensWhereOn: tokens [
	self where ifNil: [^self].
	tokens spacedAdd: 'WHERE'.
	tokens add: self where cypherString
]

{ #category : #accessing }
CyFilterExpression >> where [
	^ where
]

{ #category : #accessing }
CyFilterExpression >> where: anObject [
	where := anObject
]
