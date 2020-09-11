Class {
	#name : #CyRawExpression,
	#superclass : #CyObject,
	#instVars : [
		'enclosed'
	],
	#category : 'SCypher-Core'
}

{ #category : #actions }
CyRawExpression >> beEnclosed [
	self enclosed: true
]

{ #category : #actions }
CyRawExpression >> bePlain [
	self enclosed: false
]

{ #category : #accessing }
CyRawExpression >> enclosed [
	^enclosed ifNil: [ enclosed := true ]
]

{ #category : #accessing }
CyRawExpression >> enclosed: aBoolean [
	enclosed := aBoolean
]

{ #category : #printing }
CyRawExpression >> tokensOn: tokens [
	self enclosed ifTrue: [tokens parenBegin].
	tokens add: (self value asString).
	self enclosed ifTrue: [tokens parenEnd]
]
