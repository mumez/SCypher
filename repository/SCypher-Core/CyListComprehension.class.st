Class {
	#name : #CyListComprehension,
	#superclass : #CyObject,
	#instVars : [
		'filterExpression',
		'projectionExpression'
	],
	#category : 'SCypher-Core'
}

{ #category : #'instance creation' }
CyListComprehension class >> filter: filterExp andProject: projectionExpression [
	^ self new
		filterExpression: filterExp;
		projectionExpression: projectionExpression;
		yourself
]

{ #category : #'instance creation' }
CyListComprehension class >> forEach: generatorExp where: whereClause andProject: projectionExpression [
	^self filter: nil andProject: projectionExpression
]

{ #category : #accessing }
CyListComprehension >> filterExpression [
	^ filterExpression
]

{ #category : #accessing }
CyListComprehension >> filterExpression: anObject [
	filterExpression := anObject
]

{ #category : #accessing }
CyListComprehension >> projectionExpression [
	^projectionExpression
]

{ #category : #accessing }
CyListComprehension >> projectionExpression: anObject [
	projectionExpression := anObject
]

{ #category : #printing }
CyListComprehension >> tokensFilterOn: tokens [
	tokens add: self filterExpression cypherString
]

{ #category : #printing }
CyListComprehension >> tokensOn: tokens [
	tokens squareBegin.
	self tokensFilterOn: tokens.
	self tokensProjectionOn: tokens.
	tokens squareEnd
	
]

{ #category : #printing }
CyListComprehension >> tokensProjectionOn: tokens [
	| proj |
	proj := self projectionExpression.
	proj ifNil: [ ^self ].
	tokens spacedAdd: '|'.
	tokens add: proj cypherString 
]
