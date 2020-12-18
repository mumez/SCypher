Class {
	#name : #CyParameter,
	#superclass : #CyAtomExpression,
	#instVars : [
		'accessor'
	],
	#category : #'SCypher-Core'
}

{ #category : #converting }
CyParameter >> -> paramValue [
	^ self identifier -> paramValue
]

{ #category : #accessing }
CyParameter >> accessor [
	^ accessor
]

{ #category : #accessing }
CyParameter >> accessor: anObject [
	accessor := anObject
]

{ #category : #converting }
CyParameter >> asCypherParameter [
	^self
]

{ #category : #testing }
CyParameter >> isEmptyOrNil [
	^false
]

{ #category : #printing }
CyParameter >> tokensAccessorOn: tokens [
	self accessor
		ifNotNil: [ :acc | 
			tokens
				add: '.';
				add: acc cypherString ]
]

{ #category : #printing }
CyParameter >> tokensOn: tokens [
	tokens add: '$'.
	self identifier ifNotNil: [:nm | tokens add: nm cypherString].
	self tokensAccessorOn: tokens.
]
