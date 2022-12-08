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

{ #category : #'shortcuts-functions' }
CyObject >> abs [
	^ CyFuncInvocation abs: self
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

{ #category : #'shortcuts-functions' }
CyObject >> collect [ 
	^ CyFuncInvocation collect: self
]

{ #category : #'shortcuts-comparing' }
CyObject >> contains: otherExpression [
	^self expressionClass contain: self with: otherExpression
]

{ #category : #'shortcuts-functions' }
CyObject >> count [
	^ CyFuncInvocation count: self
]

{ #category : #printing }
CyObject >> cypherString [
	^String streamContents: [ :str | self printCypherOn: str ]
]

{ #category : #'shortcuts-functions' }
CyObject >> endNode [ 
	^ CyFuncInvocation endNode: self
]

{ #category : #'shortcuts-comparing' }
CyObject >> ends: otherExpression [
	^self expressionClass end: self with: otherExpression
]

{ #category : #'shortcuts-comparing' }
CyObject >> equals: otherExpression [
	^self expressionClass eq: self with: otherExpression
]

{ #category : #'shortcuts-functions' }
CyObject >> exists [ 
	^ CyFuncInvocation exists: self
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

{ #category : #'shortcuts-functions' }
CyObject >> head [ 
	^ CyFuncInvocation head: self
]

{ #category : #'shortcuts-functions' }
CyObject >> id [ 
	^ CyFuncInvocation id: self
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

{ #category : #'shortcuts-functions' }
CyObject >> keys [ 
	^ CyFuncInvocation keys: self
]

{ #category : #'shortcuts-functions' }
CyObject >> labels [ 
	^ CyFuncInvocation labels: self
]

{ #category : #'shortcuts-functions' }
CyObject >> last [ 
	^ CyFuncInvocation last: self
]

{ #category : #'shortcuts-functions' }
CyObject >> length [
	^ CyFuncInvocation length: self
]

{ #category : #'shortcuts-comparing' }
CyObject >> lessThan: otherExpression [
	^self expressionClass lt: self with: otherExpression
]

{ #category : #'shortcuts-comparing' }
CyObject >> lessThanOrEquals: otherExpression [
	^self expressionClass le: self with: otherExpression
]

{ #category : #'shortcuts-functions' }
CyObject >> lower [ 
	^ CyFuncInvocation lower: self
]

{ #category : #'shortcuts-functions' }
CyObject >> max [ 
	^ CyFuncInvocation max: self
]

{ #category : #'shortcuts-functions' }
CyObject >> min [ 
	^ CyFuncInvocation min: self
]

{ #category : #'shortcuts-comparing' }
CyObject >> not [
	^self expressionClass not: self
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

{ #category : #'shortcuts-functions' }
CyObject >> relationships [ 
	^ CyFuncInvocation relationships: self
]

{ #category : #'shortcuts-functions' }
CyObject >> reverse [
	^ CyFuncInvocation reverse: self
]

{ #category : #'shortcuts-functions' }
CyObject >> size [
	^ CyFuncInvocation size: self
]

{ #category : #'shortcuts-functions' }
CyObject >> startNode [
	^ CyFuncInvocation startNode: self
]

{ #category : #'shortcuts-comparing' }
CyObject >> starts: otherExpression [
	^self expressionClass start: self with: otherExpression
]

{ #category : #'shortcuts-functions' }
CyObject >> sum [
	^ CyFuncInvocation sum: self
]

{ #category : #'shortcuts-functions' }
CyObject >> tail [
	^ CyFuncInvocation tail: self
]

{ #category : #'shortcuts-functions' }
CyObject >> toFloat [
	^ CyFuncInvocation toFloat: self
]

{ #category : #'shortcuts-functions' }
CyObject >> toInt [
	^ CyFuncInvocation toInt: self
]

{ #category : #'shortcuts-functions' }
CyObject >> toString [
	^ CyFuncInvocation toString: self
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

{ #category : #'shortcuts-functions' }
CyObject >> trim [
	^ CyFuncInvocation trim: self
]

{ #category : #'shortcuts-functions' }
CyObject >> type [
	^ CyFuncInvocation type: self
]

{ #category : #'shortcuts-functions' }
CyObject >> upper [
	^ CyFuncInvocation upper: self
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
