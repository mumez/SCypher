Class {
	#name : #CyObject,
	#superclass : #Object,
	#instVars : [
		'value',
		'identifier',
		'alias'
	],
	#category : #'SCypher-Core'
}

{ #category : #'instance creation' }
CyObject class >> alias: anObject [
	^self new alias: anObject
]

{ #category : #'instance creation' }
CyObject class >> identifier: anObject [
	^self new identifier: anObject
]

{ #category : #utilities }
CyObject class >> jsonStringFrom: valueOrAssocs [ 
	| dict rawJsonString param |
	((valueOrAssocs isArray or: [valueOrAssocs class = OrderedCollection])
		and: [valueOrAssocs notEmpty and: [valueOrAssocs first isKindOf: Association]])
		ifTrue: [dict := valueOrAssocs asDictionary.
			param := dict]
		ifFalse: [param := valueOrAssocs].
	rawJsonString := STONJSON toString: param.
	^ rawJsonString
]

{ #category : #'instance creation' }
CyObject class >> name: anObject [
	^self identifier: anObject
]

{ #category : #'instance creation' }
CyObject class >> of: anObject [
	^self new value: anObject
]

{ #category : #'instance creation' }
CyObject class >> of: value as: alias [ 
	^(self of: value) alias: alias; yourself
]

{ #category : #'instance creation' }
CyObject class >> value: anObject [
	^self new value: anObject
]

{ #category : #'instance creation' }
CyObject class >> value: value as: alias [ 
	^(self value: value) alias: alias; yourself
]

{ #category : #concatenating }
CyObject >> , otherCyObject [
	^CyObjects withAll: {self. otherCyObject}
]

{ #category : #'shortcuts-comparing' }
CyObject >> < otherExpression [
	^self lessThan: otherExpression
]

{ #category : #'shortcuts-comparing' }
CyObject >> <= otherExpression [
	^self lessThanOrEquals: otherExpression
]

{ #category : #'shortcuts-comparing' }
CyObject >> = otherExpression [
	^self equals: otherExpression
]

{ #category : #'shortcuts-comparing' }
CyObject >> > otherExpression [
	^self greaterThan: otherExpression
]

{ #category : #'shortcuts-comparing' }
CyObject >> >= otherExpression [
	^self greaterThanOrEquals: otherExpression
]

{ #category : #accessing }
CyObject >> alias [
	^ alias
]

{ #category : #accessing }
CyObject >> alias: anObject [
	alias := anObject
]

{ #category : #accessing }
CyObject >> as: anObject [
	self alias: anObject
]

{ #category : #converting }
CyObject >> asCypherObject [
	^self
]

{ #category : #'shortcuts-comparing' }
CyObject >> contains: otherExpression [
	^self expressionClass contain: self with: otherExpression
]

{ #category : #printing }
CyObject >> cypherString [
	^String streamContents: [ :str | self printCypherOn: str ]
]

{ #category : #'shortcuts-comparing' }
CyObject >> ends: otherExpression [
	^self expressionClass end: self with: otherExpression
]

{ #category : #'shortcuts-comparing' }
CyObject >> equals: otherExpression [
	^self expressionClass eq: self with: otherExpression
]

{ #category : #factory }
CyObject >> expressionClass [
	^ CyExpression
]

{ #category : #'shortcuts-comparing' }
CyObject >> greaterThan: otherExpression [
	^self expressionClass gt: self with: otherExpression
]

{ #category : #'shortcuts-comparing' }
CyObject >> greaterThanOrEquals: otherExpression [
	^self expressionClass ge: self with: otherExpression
]

{ #category : #accessing }
CyObject >> identifier [
	^ identifier
]

{ #category : #accessing }
CyObject >> identifier: anObject [
	identifier := anObject
]

{ #category : #testing }
CyObject >> isCyObject [
	^true
]

{ #category : #private }
CyObject >> join: separator in: tokens [ 
	^self join: separator in: tokens by: #cypherIdentifierString
]

{ #category : #private }
CyObject >> join: separator in: tokens by: convertSelector [ 
	| all |
	all := OrderedCollection new.
	tokens do: [ :each | | tokenString |
		tokenString := each perform: convertSelector.
		all add: tokenString] separatedBy: [ all add: separator ].
	^all
]

{ #category : #'shortcuts-comparing' }
CyObject >> lessThan: otherExpression [
	^self expressionClass lt: self with: otherExpression
]

{ #category : #'shortcuts-comparing' }
CyObject >> lessThanOrEquals: otherExpression [
	^self expressionClass le: self with: otherExpression
]

{ #category : #'shortcuts-comparing' }
CyObject >> notEquals: otherExpression [
	^self expressionClass neq: self with: otherExpression
]

{ #category : #printing }
CyObject >> printCypherOn: aStream [
	self tokenArray do: [ :each | aStream nextPutAll: each asString]
]

{ #category : #printing }
CyObject >> printOn: aStream [
	aStream nextPutAll: self className.
	aStream nextPutAll: '('.
	aStream nextPutAll: self cypherString.
	aStream nextPutAll: ')'.
]

{ #category : #'shortcuts-comparing' }
CyObject >> regex: otherExpression [
	^self expressionClass regex: self with: otherExpression
]

{ #category : #'shortcuts-comparing' }
CyObject >> starts: otherExpression [
	^self expressionClass start: self with: otherExpression
]

{ #category : #converting }
CyObject >> tokenArray [
	| tokens |
	tokens := CyTokenCollection new.
	self tokensOn: tokens.
	^tokens
]

{ #category : #printing }
CyObject >> tokensAliasOn: tokens [
	self alias ifNotNil: [:nm | tokens addAll: {' AS '. nm cypherString}].
	
]

{ #category : #printing }
CyObject >> tokensOn: tokens [
	"override"
	^tokens
]

{ #category : #accessing }
CyObject >> value [
	^value
]

{ #category : #accessing }
CyObject >> value: anObject [
	value := anObject
]

{ #category : #'shortcuts-comparing' }
CyObject >> ~= otherExpression [
	^self notEquals: otherExpression
]
