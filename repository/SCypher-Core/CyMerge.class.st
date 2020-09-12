Class {
	#name : #CyMerge,
	#superclass : #CyClause,
	#instVars : [
		'actions'
	],
	#category : 'SCypher-Core'
}

{ #category : #accessing }
CyMerge >> actions [
	^ actions ifNil: [ actions := OrderedCollection new ]
]

{ #category : #accessing }
CyMerge >> actions: anObject [
	actions := anObject
]

{ #category : #actions }
CyMerge >> addAction: aMergeAction [
	self actions add: aMergeAction
]

{ #category : #factory }
CyMerge >> mergeActionClass [
	^CyMergeAction 
]

{ #category : #actions }
CyMerge >> onCreateSet: setExpression [
	self addAction: (self mergeActionClass onCreateSet: setExpression)
]

{ #category : #actions }
CyMerge >> onMatchSet: setExpression [
	self addAction: (self mergeActionClass onMatchSet: setExpression)
]

{ #category : #printing }
CyMerge >> tokensActionsOn: tokens [

	self actions do: [ :each | 
		tokens spacedAdd: each cypherString.	
	]
]

{ #category : #printing }
CyMerge >> tokensOn: tokens [
	super tokensOn: tokens.
	self tokensActionsOn: tokens.
	
]
