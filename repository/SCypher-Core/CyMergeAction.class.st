Class {
	#name : #CyMergeAction,
	#superclass : #CyObject,
	#instVars : [
		'actionType',
		'expression'
	],
	#category : #'SCypher-Core'
}

{ #category : #'instance creation' }
CyMergeAction class >> actionType: aString expression: setExpression [
	^ self new
		actionType: aString;
		expression: setExpression;
		yourself
]

{ #category : #'instance creation' }
CyMergeAction class >> onCreate: anExpression [
	^self actionType: 'CREATE' expression: anExpression
]

{ #category : #'instance creation' }
CyMergeAction class >> onMatch: anExpression [
	^self actionType: 'MATCH' expression: anExpression
]

{ #category : #accessing }
CyMergeAction >> actionType [
	^ actionType
]

{ #category : #accessing }
CyMergeAction >> actionType: anObject [
	actionType := anObject
]

{ #category : #accessing }
CyMergeAction >> expression [
	^ expression
]

{ #category : #accessing }
CyMergeAction >> expression: anObject [
	expression := anObject
]

{ #category : #printing }
CyMergeAction >> tokensActionOn: tokens [
	tokens add: 'ON'.
	tokens spacedAdd: self actionType cypherString
]

{ #category : #printing }
CyMergeAction >> tokensExpressionOn: tokens [
	tokens add: self expression cypherString
]

{ #category : #printing }
CyMergeAction >> tokensOn: tokens [
	self tokensActionOn: tokens.
	self tokensExpressionOn: tokens
]
