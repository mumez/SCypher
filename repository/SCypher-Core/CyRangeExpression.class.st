Class {
	#name : #CyRangeExpression,
	#superclass : #CyObject,
	#instVars : [
		'from',
		'to',
		'enclosed'
	],
	#category : #'SCypher-Core'
}

{ #category : #'instance creation' }
CyRangeExpression class >> from: startExpression to: endExpression [
	^ self new
		from: startExpression;
		to: endExpression;
		yourself
]

{ #category : #'instance creation' }
CyRangeExpression class >> fromFirstTo: endExpression [
	^ self from: nil to: endExpression 
]

{ #category : #'instance creation' }
CyRangeExpression class >> toLastFrom: startExpression [
	^ self from: startExpression to: nil
]

{ #category : #'instance creation' }
CyRangeExpression class >> variable [
	^self from: nil to: nil
]

{ #category : #actions }
CyRangeExpression >> beEnclosed [
	self enclosed: true
]

{ #category : #accessing }
CyRangeExpression >> enclosed [
	^enclosed ifNil: [ enclosed := false ]
]

{ #category : #accessing }
CyRangeExpression >> enclosed: aBoolean [
	enclosed := aBoolean
]

{ #category : #accessing }
CyRangeExpression >> from [
	^ from
]

{ #category : #accessing }
CyRangeExpression >> from: anObject [
	from := anObject
]

{ #category : #testing }
CyRangeExpression >> isVariable [
	^self from isNil and: [self to isNil]
]

{ #category : #accessing }
CyRangeExpression >> to [
	^ to
]

{ #category : #accessing }
CyRangeExpression >> to: anObject [
	to := anObject
]

{ #category : #printing }
CyRangeExpression >> tokensFromOn: tokens [
	self from ifNotNil: [ :f | tokens add: f cypherString ]
]

{ #category : #printing }
CyRangeExpression >> tokensOn: tokens [
	self enclosed ifTrue: [tokens squareBegin].
	self tokensFromOn: tokens.
	self isVariable ifFalse: [ tokens add: '..' ].
	self tokensToOn: tokens.
	self enclosed ifTrue: [tokens squareEnd].
]

{ #category : #printing }
CyRangeExpression >> tokensToOn: tokens [
	self to ifNotNil: [ :t | tokens add: t cypherString ]
]
