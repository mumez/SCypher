Class {
	#name : #CyReturn,
	#superclass : #CyClause,
	#instVars : [
		'isDistinct',
		'items',
		'orderBy',
		'skip',
		'limit'
	],
	#category : 'SCypher-Core'
}

{ #category : #'instance creation' }
CyReturn class >> of: itemOrItems [
	| cypherObj items |
	cypherObj := itemOrItems asCypherObject.
	items := cypherObj isCollection ifTrue: [cypherObj] ifFalse: [CyObjects withAll: {cypherObj}].
	^self new items: items; yourself
]

{ #category : #'instance creation' }
CyReturn class >> of: value as: alias [ 
	| inst | 
	inst := self of: value.
	inst items size =1 ifTrue: [ inst items first alias: alias ].
	^inst
]

{ #category : #actions }
CyReturn >> beDistinct [
	^self isDistinct: true
]

{ #category : #accessing }
CyReturn >> isDistinct [
	^ isDistinct ifNil: [ isDistinct := false ]
]

{ #category : #accessing }
CyReturn >> isDistinct: aBoolean [
	isDistinct := aBoolean
]

{ #category : #accessing }
CyReturn >> items [
	^ items 
]

{ #category : #accessing }
CyReturn >> items: anObject [
	items := anObject
]

{ #category : #accessing }
CyReturn >> limit [
	^ limit
]

{ #category : #accessing }
CyReturn >> limit: anObject [
	limit := anObject
]

{ #category : #accessing }
CyReturn >> orderBy [
	^ orderBy
]

{ #category : #accessing }
CyReturn >> orderBy: anObject [
	orderBy := anObject
]

{ #category : #accessing }
CyReturn >> skip [
	^ skip
]

{ #category : #accessing }
CyReturn >> skip: anObject [
	skip := anObject
]

{ #category : #printing }
CyReturn >> tokensBodyOn: tokens [
	self items ifNotNil: [self tokensItemsOn: tokens].
	self orderBy ifNotNil: [self tokensOrderByOn: tokens].
	self skip ifNotNil: [self tokensSkipOn: tokens].
	self limit ifNotNil: [self tokensLimitOn: tokens]
]

{ #category : #printing }
CyReturn >> tokensItemsOn: tokens [
	tokens spacedAdd: (self items cypherString)
]

{ #category : #printing }
CyReturn >> tokensLimitOn: tokens [
	tokens spacedAdd: 'LIMIT'.
	tokens spacedAdd: (self limit cypherString)
]

{ #category : #printing }
CyReturn >> tokensOn: tokens [
	tokens spacedAdd: self keyword.
	
	self isDistinct ifTrue: [ 
		tokens spacedAdd: 'DISTINCT'
	].
	
	self tokensBodyOn: tokens.
	
]

{ #category : #printing }
CyReturn >> tokensOrderByOn: tokens [
	tokens spacedAdd: 'ORDER BY'.
	tokens spacedAdd: (self orderBy cypherString)
]

{ #category : #printing }
CyReturn >> tokensSkipOn: tokens [
	tokens spacedAdd: 'SKIP'.
	tokens spacedAdd: (self skip cypherString)
]
