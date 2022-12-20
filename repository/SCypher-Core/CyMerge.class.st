Class {
	#name : #CyMerge,
	#superclass : #CyClause,
	#instVars : [
		'actions'
	],
	#category : #'SCypher-Core'
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
CyMerge >> onCreate: anExpression [
	self addAction: (self mergeActionClass onCreate: anExpression)
]

{ #category : #actions }
CyMerge >> onCreateSet: setExpression [
	self onCreate: (CySet of: setExpression)
]

{ #category : #actions }
CyMerge >> onMatch: anExpression [
	self addAction: (self mergeActionClass onMatch: anExpression)
]

{ #category : #actions }
CyMerge >> onMatchSet: setExpression [
	self onMatch: (CySet of: setExpression)
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
