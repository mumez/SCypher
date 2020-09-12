Class {
	#name : #CyClause,
	#superclass : #CyObject,
	#instVars : [
		'keyword'
	],
	#category : 'SCypher-Core'
}

{ #category : #'instance creation' }
CyClause class >> keyword: keyword [
	^self new keyword: keyword
]

{ #category : #'instance creation' }
CyClause class >> value: valueList [
	^self new value: valueList
]

{ #category : #defaults }
CyClause >> defaultKeyword [
	| clsName |
	clsName := self className.
	^(clsName copyFrom: 3 to: clsName size) asUppercase.
]

{ #category : #accessing }
CyClause >> keyword [
	^ keyword ifNil: [ keyword := self defaultKeyword ]
]

{ #category : #accessing }
CyClause >> keyword: anObject [
	keyword := anObject
]

{ #category : #printing }
CyClause >> tokensOn: tokens [
	tokens add: self keyword; space.
	tokens add: (self value cypherTokenString).
	
	self tokensAliasOn: tokens
]
