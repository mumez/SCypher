Class {
	#name : #CyIdentifier,
	#superclass : #CyObject,
	#instVars : [
		'accessor'
	],
	#category : 'SCypher-Core'
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

{ #category : #accessing }
CyIdentifier >> accessor [
	^ accessor
]

{ #category : #accessing }
CyIdentifier >> accessor: anObject [
	accessor := anObject
]

{ #category : #converting }
CyIdentifier >> add: newValue [
	^CySetItemExpression of: self add: newValue
]

{ #category : #converting }
CyIdentifier >> asNode [
	^CyNode identifier: self identifier
]

{ #category : #converting }
CyIdentifier >> asc [
	^(CySortSpecifier of: self) asc
]

{ #category : #printing }
CyIdentifier >> cypherIdentifierString [
	^self cypherString 
]

{ #category : #converting }
CyIdentifier >> desc [
	^(CySortSpecifier of: self) desc
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

{ #category : #converting }
CyIdentifier >> prop: propName [
	^self class of: self identifier prop: propName
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
