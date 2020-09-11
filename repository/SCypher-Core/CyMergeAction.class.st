Class {
	#name : #CyMergeAction,
	#superclass : #CyObject,
	#instVars : [
		'actionType',
		'setExpression'
	],
	#category : 'SCypher-Core'
}

{ #category : #'instance creation' }
CyMergeAction class >> actionType: aString setExpression: setExpression [
	^ self new
		actionType: aString;
		setExpression: setExpression;
		yourself
]

{ #category : #'instance creation' }
CyMergeAction class >> onCreateSet: setExpression [
	^self actionType: 'CREATE' setExpression: setExpression
]

{ #category : #'instance creation' }
CyMergeAction class >> onMatchSet: setExpression [
	^self actionType: 'MATCH' setExpression: setExpression
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
CyMergeAction >> setExpression [
	^ setExpression
]

{ #category : #accessing }
CyMergeAction >> setExpression: anObject [
	setExpression := anObject
]

{ #category : #printing }
CyMergeAction >> tokensActionOn: tokens [
	tokens add: 'ON'.
	tokens spacedAdd: self actionType cypherString
]

{ #category : #printing }
CyMergeAction >> tokensOn: tokens [
	self tokensActionOn: tokens.
	self tokensSetExpressionOn: tokens
]

{ #category : #printing }
CyMergeAction >> tokensSetExpressionOn: tokens [
	tokens add: self setExpression cypherString
]
