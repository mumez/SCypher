Class {
	#name : #CyRangeExpression,
	#superclass : #CyObject,
	#instVars : [
		'from',
		'to'
	],
	#category : 'SCypher-Core'
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

{ #category : #accessing }
CyRangeExpression >> from [
	^ from
]

{ #category : #accessing }
CyRangeExpression >> from: anObject [
	from := anObject
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
	tokens squareBegin.
	self tokensFromOn: tokens.
	tokens add: '..'.
	self tokensToOn: tokens.
	tokens squareEnd.
]

{ #category : #printing }
CyRangeExpression >> tokensToOn: tokens [
	self to ifNotNil: [ :t | tokens add: t cypherString ]
]
