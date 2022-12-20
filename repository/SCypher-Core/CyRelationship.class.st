Class {
	#name : #CyRelationship,
	#superclass : #CyObject,
	#instVars : [
		'start',
		'end',
		'types',
		'range',
		'direction',
		'props'
	],
	#category : #'SCypher-Core'
}

{ #category : #'instance creation' }
CyRelationship class >> empty [
	^self new
]

{ #category : #'instance creation' }
CyRelationship class >> rangeFrom: from [
	^ self empty rangeFrom: from
]

{ #category : #'instance creation' }
CyRelationship class >> rangeFrom: from to: to [
	^ self empty rangeFrom: from to: to
]

{ #category : #'instance creation' }
CyRelationship class >> rangeTo: to [
	^ self empty rangeTo: to
]

{ #category : #'instance creation' }
CyRelationship class >> rangeVariable [
	^ self empty rangeVariable
]

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
	| types |
	types := type ifNotNil: [ {type} ].
	^ self
		start: start
		end: end
		name: identifier
		types: types
		props: props
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

{ #category : #'actions-path pattern' }
CyRelationship >> - aCyNodeOrRelationship [
	^ aCyNodeOrRelationship connectByRelationship: self
]

{ #category : #'actions-path pattern' }
CyRelationship >> -> aCyNodeOrRelationship [
	^ aCyNodeOrRelationship outConnectByRelationship: self
]

{ #category : #'actions-path pattern' }
CyRelationship >> <- aCyRelationship [
	^ aCyRelationship inConnectByRelationship: self
]

{ #category : #shortcuts }
CyRelationship >> @ propName [
	^self asIdentifier @ propName 
]

{ #category : #converting }
CyRelationship >> accessor: propName [
	^CyIdentifier of: self identifier prop: propName
]

{ #category : #converting }
CyRelationship >> asPattern [
	^ CyPatternElement with: self
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

{ #category : #'dispatching-path pattern' }
CyRelationship >> connectByRelationship: aLeftSideRelationship [
	| nextRel |
	nextRel := self copy.
	nextRel start: aLeftSideRelationship end.
	^ aLeftSideRelationship asPattern addRelationship: nextRel.
	
]

{ #category : #copying }
CyRelationship >> copy [
	| rel |
	rel := self class
		start: self start end: self end name: self identifier types: self types copy props: self props copy.
	rel range: self range copy.
	rel direction: self direction copy.
	^rel
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

{ #category : #shortcuts }
CyRelationship >> havingAll: assocArray [
	^self asIdentifier havingAll: assocArray
]

{ #category : #'dispatching-path pattern' }
CyRelationship >> inConnectByRelationship: aLeftSideRelationship [
	| pathPattern |
	pathPattern := self connectByRelationship: aLeftSideRelationship.
	pathPattern lastRelationship beIn.
	^pathPattern
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
CyRelationship >> isEmpty [
	^ ((self identifier isNil and: [ self types isNil ])
		and: [ self range isNil ]) and: [ self props isNil ]
]

{ #category : #testing }
CyRelationship >> isIn [
	^self direction = #in
]

{ #category : #testing }
CyRelationship >> isOut [
	^self direction = #out
]

{ #category : #'dispatching-path pattern' }
CyRelationship >> outConnectByRelationship: aLeftSideRelationship [
	| pathPattern |
	pathPattern := self connectByRelationship: aLeftSideRelationship.
	pathPattern lastRelationship beOut.
	^pathPattern
]

{ #category : #accessing }
CyRelationship >> props [
	^ props
]

{ #category : #accessing }
CyRelationship >> props: anObject [
	anObject
		ifNil: [ props := nil.
			^ self ].
	props := anObject asDictionary
]

{ #category : #accessing }
CyRelationship >> range [
	^ range
]

{ #category : #accessing }
CyRelationship >> range: rangeLiteral [
	range := rangeLiteral
]

{ #category : #'actions-range' }
CyRelationship >> rangeFrom: from [
	^self rangeFrom: from to: nil
]

{ #category : #'actions-range' }
CyRelationship >> rangeFrom: from to: to [
	self range: (CyRangeExpression from: from to: to)
]

{ #category : #'actions-range' }
CyRelationship >> rangeTo: to [
	^self rangeFrom: nil to: to
]

{ #category : #'actions-range' }
CyRelationship >> rangeVariable [
	self rangeFrom: nil to: nil
]

{ #category : #accessing }
CyRelationship >> start [
	^ start
]

{ #category : #accessing }
CyRelationship >> start: anObject [
	start := anObject asCypherObject asNode
]

{ #category : #printing }
CyRelationship >> tokensCenterPartEdgeOn: tokens [
	self isEmpty ifTrue: [ ^self ].
	tokens add: '['.
	self identifier ifNotNil: [:nm | tokens add: nm cypherIdentifierString].
	self tokensTypesOn: tokens.
	self range ifNotNil: [  
		tokens add: '*'.
		tokens add: (self range cypherString)	
	].
	self tokensPropertiesOn: tokens.
	tokens add: ']'
]

{ #category : #printing }
CyRelationship >> tokensEndNodeOn: tokens [
	self end ifNil: [ ^self ].
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
	self props ifNil: [ ^self ].
	self props ifNotEmpty: [  
		self types ifNotNil: [ tokens add: ' ' ].
		tokens add: (self props cypherString )].
]

{ #category : #printing }
CyRelationship >> tokensStartNodeOn: tokens [
	self start ifNil: [ ^self ].
	tokens addAll: self start tokenArray.
]

{ #category : #printing }
CyRelationship >> tokensStartPartEdgeOn: tokens [
	(self isIn or: [self isBoth])
		ifTrue: [tokens  add: '<-']
		ifFalse: [ tokens add: '-' ].
	
]

{ #category : #printing }
CyRelationship >> tokensTypesOn: tokens [
	self types ifNil: [ ^self ].
	self types ifNotEmpty: [ 
		tokens add: ':' .
		self types do: [:each | tokens add: each ] separatedBy: [ tokens add: '|' ].
	].
]

{ #category : #printing }
CyRelationship >> tokensWithoutEndNodeOn: tokens [
	self tokensStartNodeOn: tokens.
	self tokensStartPartEdgeOn: tokens.
	
	self tokensCenterPartEdgeOn: tokens.
	
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
