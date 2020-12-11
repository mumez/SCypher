Class {
	#name : #CyIdentifier,
	#superclass : #CyObject,
	#instVars : [
		'accessor'
	],
	#category : #'SCypher-Core'
}

{ #category : #'instance creation' }
CyIdentifier class >> of: identifier [
	^self new identifier: identifier
]

{ #category : #'instance creation' }
CyIdentifier class >> of: identifier prop: propName [
	^ (self of: identifier) accessor: propName; yourself
]

{ #category : #'instance creation' }
CyIdentifier class >> of: identifier prop: propName as: alias [
	^(self of: identifier prop: propName) alias: alias; yourself
]

{ #category : #shortcuts }
CyIdentifier >> @ propName [
	^self prop: propName
]

{ #category : #accessing }
CyIdentifier >> accessor [
	^ accessor
]

{ #category : #accessing }
CyIdentifier >> accessor: anObject [
	accessor := anObject
]

{ #category : #converting }
CyIdentifier >> addAll: newValue [
	^CySetItemExpression of: self addAll: newValue
]

{ #category : #converting }
CyIdentifier >> asCypherParameter [
	^self asParameter
]

{ #category : #'converting-node' }
CyIdentifier >> asNode [
	^CyNode identifier: self identifier
]

{ #category : #converting }
CyIdentifier >> asParameter [
	^(CyParameter name: self identifier) accessor: self accessor; yourself
]

{ #category : #'converting-relationship' }
CyIdentifier >> asRelationship [
	^CyRelationship identifier: self identifier
]

{ #category : #'converting-sort' }
CyIdentifier >> asc [
	^(CySortSpecifier of: self) asc
]

{ #category : #printing }
CyIdentifier >> cypherIdentifierString [
	^self cypherString 
]

{ #category : #'converting-sort' }
CyIdentifier >> desc [
	^(CySortSpecifier of: self) desc
]

{ #category : #factory }
CyIdentifier >> expressionClass [
	^ CyExpression
]

{ #category : #accessing }
CyIdentifier >> getId [
	^ CyProcInvocation name: 'id' expression: self
]

{ #category : #shortcuts }
CyIdentifier >> havingAll: assocArray [
	| accumExp |
	accumExp := nil.
	assocArray do: [ :assoc | |exp|
		exp := (self prop: assoc key) equals: assoc value.
		accumExp ifNil: [ accumExp := exp ] ifNotNil: [ accumExp := accumExp and: exp]
	].
	^accumExp
]

{ #category : #accessing }
CyIdentifier >> identifier: identifierLikeThing [
	(identifierLikeThing isKindOf: CyObject)
		ifTrue: [ ^ super identifier: identifierLikeThing identifier ].
	super identifier: identifierLikeThing
]

{ #category : #converting }
CyIdentifier >> labels: labels [
	^CySetItemExpression of: self labels: labels
]

{ #category : #'converting-node' }
CyIdentifier >> node: labels props: propertiesArray [
	| node labelsArray |
	node := self asNode.
	labelsArray := labels isArray ifTrue: [ labels ] ifFalse:[Array with: labels].
	node labels: labelsArray.
	node props: propertiesArray.
	^ node
]

{ #category : #'converting-path' }
CyIdentifier >> path: aRelationship [ 
	^ aRelationship asPattern assignedTo: self
]

{ #category : #converting }
CyIdentifier >> prop: propName [
	^self class of: self identifier prop: propName
]

{ #category : #'converting-relationship' }
CyIdentifier >> rel: types props: propertiesArray [
	| rel typesArray |
	rel := self asRelationship.
	typesArray := types isArray ifTrue: [ types ] ifFalse:[Array with: types].
	rel types: typesArray.
	rel props: propertiesArray.
	^ rel
]

{ #category : #converting }
CyIdentifier >> to: newValue [
	^CySetItemExpression of: self to: newValue
]

{ #category : #printing }
CyIdentifier >> tokensAccessorOn: tokens [
	self accessor
		ifNotNil: [ :acc | 
			tokens
				add: '.';
				add: acc cypherString ]
]

{ #category : #printing }
CyIdentifier >> tokensOn: tokens [
	self identifier ifNotNil: [:nm | tokens add: nm cypherIdentifierString].
	self tokensAccessorOn: tokens.
	self tokensAliasOn: tokens
]
