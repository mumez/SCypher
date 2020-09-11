Class {
	#name : #CySet,
	#superclass : #CyClause,
	#instVars : [
		'itemSetters'
	],
	#category : 'SCypher-Core'
}

{ #category : #'instance creation' }
CySet class >> itemSetters: aCollection [
	^self new itemSetters: aCollection; yourself
]

{ #category : #'instance creation' }
CySet class >> of: setExpressions [
	| exps |
	exps := setExpressions isCollection ifTrue: [ setExpressions ] ifFalse: [ CyObjects with: setExpressions ].
	^self itemSetters: exps 
]

{ #category : #accessing }
CySet >> itemSetters [
	^ itemSetters ifNil: [ itemSetters := OrderedCollection new ]
]

{ #category : #accessing }
CySet >> itemSetters: anObject [
	itemSetters := anObject
]

{ #category : #printing }
CySet >> tokensOn: tokens [
	tokens add: self keyword; space.
	
	tokens addAll: (self join: ', ' in: self itemSetters by: #cypherString)
]
