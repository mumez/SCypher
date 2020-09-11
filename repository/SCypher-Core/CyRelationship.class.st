Class {
	#name : #CyRelationship,
	#superclass : #CyObject,
	#instVars : [
		'start',
		'end',
		'types',
		'direction',
		'props'
	],
	#category : 'SCypher-Core'
}

{ #category : #'instance creation' }
CyRelationship class >> start: start end: end [
	^self start: start end: end name: nil
]

{ #category : #'instance creation' }
CyRelationship class >> start: start end: end name: identifier [
	^self start: start end: end name: identifier type: nil
]

{ #category : #'instance creation' }
CyRelationship class >> start: start end: end name: identifier type: type [
	^self start: start end: end name: identifier type: type props: nil
]

{ #category : #'instance creation' }
CyRelationship class >> start: start end: end name: identifier type: type props: props [
	^self start: start end: end name: identifier types: {type} props: props
]

{ #category : #'instance creation' }
CyRelationship class >> start: start end: end name: identifier types: types props: props [
	^self new start: start;
		end: end;
		identifier: identifier;
		types: types;
		props: props;
		yourself
]

{ #category : #'instance creation' }
CyRelationship class >> start: start end: end type: type [
	^self start: start end: end type: type props: nil
]

{ #category : #'instance creation' }
CyRelationship class >> start: start end: end type: type props: props [
	^self new start: start;
		end: end;
		type: type;
		props: props;
		yourself
]

{ #category : #converting }
CyRelationship >> accessor: propName [
	^CyIdentifier of: self identifier prop: propName
]

{ #category : #actions }
CyRelationship >> beBoth [
	^self direction: #both
]

{ #category : #actions }
CyRelationship >> beIn [
	^self direction: #in
]

{ #category : #actions }
CyRelationship >> beOut [
	^self direction: #out
]

{ #category : #accessing }
CyRelationship >> direction [
	^ direction
]

{ #category : #accessing }
CyRelationship >> direction: anObject [
	direction := anObject
]

{ #category : #accessing }
CyRelationship >> end [
	^ end
]

{ #category : #accessing }
CyRelationship >> end: anObject [
	end := anObject asCypherObject asNode
]

{ #category : #testing }
CyRelationship >> isBoth [
	^self direction = #both
]

{ #category : #testing }
CyRelationship >> isDirected [
	^self direction notNil
]

{ #category : #testing }
CyRelationship >> isIn [
	^self direction = #in
]

{ #category : #testing }
CyRelationship >> isOut [
	^self direction = #out
]

{ #category : #accessing }
CyRelationship >> props [
	^ props
]

{ #category : #accessing }
CyRelationship >> props: anObject [
	props := anObject
]

{ #category : #accessing }
CyRelationship >> start [
	^ start
]

{ #category : #accessing }
CyRelationship >> start: anObject [
	start := anObject  asCypherObject asNode
]

{ #category : #printing }
CyRelationship >> tokensCenterPartEdgeOn: tokens [
	tokens add: '['.
	self identifier ifNotNil: [:nm | tokens add: nm].
	
	self types ifNotNil: [ tokens add: ':' ].
	self types do: [:each | tokens add: each ] separatedBy: [ tokens add: '|' ].
	
	self props ifNotNil: [  
		self types ifNotNil: [ tokens add: ' ' ].
		tokens add: (self props cypherString )].
	
	tokens add: ']'
]

{ #category : #printing }
CyRelationship >> tokensEndNodeOn: tokens [
	tokens addAll: self end tokenArray
]

{ #category : #printing }
CyRelationship >> tokensEndPartEdgeOn: tokens [
	(self isOut or: [self isBoth]) 
		ifTrue: [tokens  add: '->']
		ifFalse: [ tokens add: '-' ]
]

{ #category : #printing }
CyRelationship >> tokensOn: tokens [
	self tokensWithoutEndNodeOn: tokens.
	self tokensEndNodeOn: tokens
]

{ #category : #printing }
CyRelationship >> tokensPropertiesOn: tokens [
	
]

{ #category : #printing }
CyRelationship >> tokensStartNodeOn: tokens [
	tokens addAll: self start tokenArray.
]

{ #category : #printing }
CyRelationship >> tokensStartPartEdgeOn: tokens [
	(self isIn or: [self isBoth])
		ifTrue: [tokens  add: '<-']
		ifFalse: [ tokens add: '-' ].
	
]

{ #category : #printing }
CyRelationship >> tokensTypeOn: tokens [
	
]

{ #category : #printing }
CyRelationship >> tokensWithoutEndNodeOn: tokens [
	self tokensStartNodeOn: tokens.
	self tokensStartPartEdgeOn: tokens.
	
	((self identifier notNil or: [ self type notNil ]) or: [ self props notNil ]) ifTrue: [ 
		self tokensCenterPartEdgeOn: tokens
	].
	
	self tokensEndPartEdgeOn: tokens
]

{ #category : #accessing }
CyRelationship >> type [
	^ self types first
]

{ #category : #accessing }
CyRelationship >> type: anObject [
	self types: (Array with: anObject)
]

{ #category : #accessing }
CyRelationship >> types [
	^ types
]

{ #category : #accessing }
CyRelationship >> types: anObject [
	types := anObject
]
