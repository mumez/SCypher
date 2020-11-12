Class {
	#name : #CySetItemExpression,
	#superclass : #CyObject,
	#instVars : [
		'operator',
		'labelString'
	],
	#category : #'SCypher-Core'
}

{ #category : #'instance creation' }
CySetItemExpression class >> of: identifier addAll: value [
	| inst |
	inst := self operator: '+='.
	inst identifier: identifier asCypherObject.
	inst value: value asCypherValue.
	^inst
]

{ #category : #'instance creation' }
CySetItemExpression class >> of: identifier labels: values [
	| inst |
	inst := self operator: #labels.
	inst identifier: identifier asCypherObject.
	inst labels: values.
	^inst
]

{ #category : #'instance creation' }
CySetItemExpression class >> of: identifier to: value [
	| inst |
	inst := self operator: '='.
	inst identifier: identifier asCypherObject.
	inst value: value asCypherValue.
	^inst
]

{ #category : #'instance creation' }
CySetItemExpression class >> operator: operator [
	^ self new
		operator: operator;
		yourself
]

{ #category : #accessing }
CySetItemExpression >> labelString [
	^ labelString
]

{ #category : #accessing }
CySetItemExpression >> labelString: anObject [
	labelString := anObject
]

{ #category : #accessing }
CySetItemExpression >> labels: labelNames [
	| lstr |
	lstr := String streamContents: [ :str | 
		(self join: ':' in: labelNames) do: [:each | str nextPutAll: each]
	 ].
	self labelString: lstr
	
]

{ #category : #accessing }
CySetItemExpression >> operator [
	^ operator
]

{ #category : #accessing }
CySetItemExpression >> operator: anObject [
	operator := anObject
]

{ #category : #printing }
CySetItemExpression >> tokensOn: tokens [
	tokens add: self identifier cypherString.
	self tokensOperatorOn: tokens.
	self tokensValueOn: tokens
]

{ #category : #printing }
CySetItemExpression >> tokensOperatorOn: tokens [
	(self operator isNil or: [self operator = #labels]) ifTrue: [ ^self ].
	tokens spacedAdd: self operator
]

{ #category : #printing }
CySetItemExpression >> tokensValueOn: tokens [
	(self operator isNil or: [self operator = #labels]) ifTrue: [
		tokens add: ':'.
		tokens add: self labelString.
		 ^self 
	].

	tokens add: self value cypherString 
]
