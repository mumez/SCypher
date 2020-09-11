Class {
	#name : #CyListExpression,
	#superclass : #CyAtomExpression,
	#instVars : [
		'funcName',
		'filter'
	],
	#category : 'SCypher-Core'
}

{ #category : #'instance creation' }
CyListExpression class >> allOf: filter [
	^self funcName: 'all' filter: filter
	
]

{ #category : #'instance creation' }
CyListExpression class >> anyOf: filter [
	^self funcName: 'any' filter: filter
	
]

{ #category : #'instance creation' }
CyListExpression class >> filterBy: filter [
	^self funcName: 'filter' filter: filter
	
]

{ #category : #'instance creation' }
CyListExpression class >> funcName: funcName filter: filterExpression [
	^ self new
		funcName: funcName;
		filter: filterExpression;
		yourself
]

{ #category : #'instance creation' }
CyListExpression class >> noneOf: filter [
	^self funcName: 'none' filter: filter
	
]

{ #category : #'instance creation' }
CyListExpression class >> selectBy: filter [
	^self filterBy: filter
]

{ #category : #'instance creation' }
CyListExpression class >> singleOf: filter [
	^self funcName: 'single' filter: filter
	
]

{ #category : #accessing }
CyListExpression >> filter [
	^ filter
]

{ #category : #accessing }
CyListExpression >> filter: anObject [
	filter := anObject
]

{ #category : #accessing }
CyListExpression >> funcName [
	^ funcName
]

{ #category : #accessing }
CyListExpression >> funcName: anObject [
	funcName := anObject
]

{ #category : #printing }
CyListExpression >> tokensOn: tokens [
	tokens add: self funcName.
	tokens parenEnclosedAdd: self filter cypherString
]
