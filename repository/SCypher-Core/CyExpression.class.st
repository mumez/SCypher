Class {
	#name : #CyExpression,
	#superclass : #CyObject,
	#instVars : [
		'type',
		'operator',
		'expressions',
		'enclosed'
	],
	#category : #'SCypher-Core'
}

{ #category : #'instance creation-shortcuts' }
CyExpression class >> and: expA with: expB [
	^self type: #infix operator: 'AND' expressions: {expA. expB}
]

{ #category : #'instance creation-shortcuts' }
CyExpression class >> concat: expA with: expB [
	^self type: #infix operator: '+' expressions: {expA. expB}
]

{ #category : #'instance creation-comparison' }
CyExpression class >> contain: expA with: expB [
	^self type: #infix operator: 'CONTAINS' expressions: {expA. expB}
]

{ #category : #'instance creation-shortcuts' }
CyExpression class >> divide: expA with: expB [
	^self type: #infix operator: '/' expressions: {expA. expB}
]

{ #category : #'instance creation-list' }
CyExpression class >> each: expA in: expB [
	^(self type: #infix operator: 'IN' expressions: {expA. expB}) bePlain
]

{ #category : #'instance creation-comparison' }
CyExpression class >> end: expA with: expB [
	^self type: #infix operator: 'ENDS WITH' expressions: {expA. expB}
]

{ #category : #'instance creation-comparison' }
CyExpression class >> eq: expA with: expB [
	^self type: #infix operator: '=' expressions: {expA. expB}
]

{ #category : #'instance creation-comparison' }
CyExpression class >> ge: expA with: expB [
	^self type: #infix operator: '>=' expressions: {expA. expB}
]

{ #category : #'instance creation-comparison' }
CyExpression class >> gt: expA with: expB [
	^self type: #infix operator: '>' expressions: {expA. expB}
]

{ #category : #'instance creation-shortcuts' }
CyExpression class >> isKey: expA [
	^self type: #postfix operator: 'IS KEY' expressions: {expA}
]

{ #category : #'instance creation-shortcuts' }
CyExpression class >> isNotNull: expA [
	^self type: #postfix operator: 'IS NOT NULL' expressions: {expA}
]

{ #category : #'instance creation-shortcuts' }
CyExpression class >> isNull: expA [
	^self type: #postfix operator: 'IS NULL' expressions: {expA}
]

{ #category : #'instance creation-shortcuts' }
CyExpression class >> isUnique: expA [
	^self type: #postfix operator: 'IS UNIQUE' expressions: {expA}
]

{ #category : #'instance creation-comparison' }
CyExpression class >> le: expA with: expB [
	^self type: #infix operator: '<=' expressions: {expA. expB}
]

{ #category : #'instance creation-list' }
CyExpression class >> list: expA at: atExpression [
	^self type: #postfix operator: (CyIndexExpression of: atExpression) expressions: {expA}
]

{ #category : #'instance creation-list' }
CyExpression class >> list: expA from: fromExpression to: toExpression [
	^self type: #postfix operator: (CyRangeExpression from: fromExpression to: toExpression) beEnclosed expressions: {expA}
]

{ #category : #'instance creation-list' }
CyExpression class >> list: expA fromFirstTo: endExpression [
	^self type: #postfix operator: (CyRangeExpression fromFirstTo: endExpression) beEnclosed expressions: {expA}
]

{ #category : #'instance creation-list' }
CyExpression class >> list: expA toLastFrom: startExpression [
	^self type: #postfix operator: (CyRangeExpression toLastFrom: startExpression) beEnclosed expressions: {expA}
]

{ #category : #'instance creation-comparison' }
CyExpression class >> lt: expA with: expB [
	^self type: #infix operator: '<' expressions: {expA. expB}
]

{ #category : #'instance creation-shortcuts' }
CyExpression class >> minus: expA [
	^self type: #prefix operator: '-' expressions: {expA}
]

{ #category : #'instance creation-shortcuts' }
CyExpression class >> minus: expA with: expB [
	^self type: #infix operator: '-' expressions: {expA. expB}
]

{ #category : #'instance creation-shortcuts' }
CyExpression class >> multiple: expA with: expB [
	^self type: #infix operator: '*' expressions: {expA. expB}
]

{ #category : #'instance creation-comparison' }
CyExpression class >> neq: expA with: expB [
	^self type: #infix operator: '<>' expressions: {expA. expB}
]

{ #category : #'instance creation-shortcuts' }
CyExpression class >> not: expA [
	^self type: #prefix operator: 'NOT' expressions: {expA}
]

{ #category : #'instance creation-shortcuts' }
CyExpression class >> or: expA with: expB [
	^self type: #infix operator: 'OR' expressions: {expA. expB}
]

{ #category : #'instance creation-shortcuts' }
CyExpression class >> plus: expA [
	^self type: #prefix operator: '+' expressions: {expA}
]

{ #category : #'instance creation-shortcuts' }
CyExpression class >> plus: expA with: expB [
	^self type: #infix operator: '+' expressions: {expA. expB}
]

{ #category : #'instance creation-shortcuts' }
CyExpression class >> power: expA with: expB [
	^self type: #infix operator: '^' expressions: {expA. expB}
]

{ #category : #'instance creation-comparison' }
CyExpression class >> regex: expA with: expB [
	^self type: #infix operator: '=~' expressions: {expA. expB}
]

{ #category : #'instance creation-comparison' }
CyExpression class >> start: expA with: expB [
	^self type: #infix operator: 'STARTS WITH' expressions: {expA. expB}
]

{ #category : #'instance creation' }
CyExpression class >> type: aSymbol operator: operatorString expressions: expressionCollection [
	^self new 
		type: aSymbol; operator: operatorString; expressions: (CyObjects withAll: expressionCollection); yourself
]

{ #category : #'instance creation-shortcuts' }
CyExpression class >> xor: expA with: expB [
	^self type: #infix operator: 'XOR' expressions: {expA. expB}
]

{ #category : #'shortcuts-conditions' }
CyExpression >> & otherExpression [
	^self and: otherExpression 
]

{ #category : #'shortcuts-conditions' }
CyExpression >> * otherExpression [
	^self class multiple: self with: otherExpression
]

{ #category : #'shortcuts-conditions' }
CyExpression >> + otherExpression [
	^self class plus: self with: otherExpression
]

{ #category : #'shortcuts-conditions' }
CyExpression >> - otherExpression [
	^self class minus: self with: otherExpression
]

{ #category : #'shortcuts-conditions' }
CyExpression >> / otherExpression [
	^self class divide: self with: otherExpression
]

{ #category : #'shortcuts-conditions' }
CyExpression >> and: otherExpression [
	^self class and: self with: otherExpression
]

{ #category : #actions }
CyExpression >> beEnclosed [
	self enclosed: true
]

{ #category : #actions }
CyExpression >> bePlain [
	self enclosed: false
]

{ #category : #'shortcuts-conditions' }
CyExpression >> concat: otherExpression [
	^self class concat: self with: otherExpression
]

{ #category : #'shortcuts-conditions' }
CyExpression >> containsWith: otherExpression [
	^self class contain: self with: otherExpression
]

{ #category : #accessing }
CyExpression >> enclosed [
	^enclosed ifNil: [ enclosed := true ]
]

{ #category : #accessing }
CyExpression >> enclosed: aBoolean [
	enclosed := aBoolean
]

{ #category : #'shortcuts-conditions' }
CyExpression >> endsWith: otherExpression [
	^self class end: self with: otherExpression
]

{ #category : #'shortcuts-conditions' }
CyExpression >> exists [
	^self class exists: self
]

{ #category : #accessing }
CyExpression >> expressions [
	^ expressions
]

{ #category : #accessing }
CyExpression >> expressions: anObject [
	expressions := anObject
]

{ #category : #testing }
CyExpression >> isInfix [
	^self type = #infix
]

{ #category : #'shortcuts-conditions' }
CyExpression >> isNULL [
	^self class isNull: self
]

{ #category : #'shortcuts-conditions' }
CyExpression >> isNotNULL [
	^self class isNotNull: self
]

{ #category : #testing }
CyExpression >> isPostfix [
	^self type = #postfix
]

{ #category : #testing }
CyExpression >> isPrefix [
	^self type = #prefix
]

{ #category : #private }
CyExpression >> leftExpression [
	| exp |
	exp := self expressions first.
	exp isSymbol ifTrue: [ ^ exp asCypherIdentifier ].
	^ exp
]

{ #category : #'shortcuts-conditions' }
CyExpression >> matchesRegex: otherExpression [
	^self class regex: self with: otherExpression
]

{ #category : #'shortcuts-conditions' }
CyExpression >> minus [
	^self class minus: self
]

{ #category : #'shortcuts-conditions' }
CyExpression >> not [
	^self class not: self
]

{ #category : #accessing }
CyExpression >> operator [
	^ operator
]

{ #category : #accessing }
CyExpression >> operator: anObject [
	operator := anObject
]

{ #category : #'shortcuts-conditions' }
CyExpression >> or: otherExpression [
	^self class or: self with: otherExpression
]

{ #category : #'shortcuts-conditions' }
CyExpression >> plus [
	^self class plus: self
]

{ #category : #'shortcuts-conditions' }
CyExpression >> power: otherExpression [
	^self class power: self with: otherExpression
]

{ #category : #private }
CyExpression >> rightExpression [
	| exp |
	exp := self expressions last.
	exp isSymbol ifTrue: [ ^ exp asCypherIdentifier ].
	^ exp
]

{ #category : #'shortcuts-conditions' }
CyExpression >> startsWith: otherExpression [
	^self class start: self with: otherExpression
]

{ #category : #printing }
CyExpression >> tokensInfixTypeOn: tokens [
	| leftExp rightExp |
	leftExp := self leftExpression.
	rightExp := self rightExpression.
	
	self enclosed ifTrue: [tokens parenBegin].
	tokens add: leftExp cypherValueString.
	tokens spacedAdd: self operator.
	tokens add: rightExp cypherValueString.
	self enclosed ifTrue: [tokens parenEnd]
]

{ #category : #printing }
CyExpression >> tokensOn: tokens [
	self isPrefix ifTrue: [ ^self tokensPrefixTypeOn: tokens ].
	self isInfix ifTrue: [ ^self tokensInfixTypeOn: tokens ].
	self isPostfix ifTrue: [ ^self tokensPostfixTypeOn: tokens ].
]

{ #category : #printing }
CyExpression >> tokensPostfixTypeOn: tokens [
	tokens add: self expressions cypherValueString.
	tokens space.
	tokens add: self operator.
	
]

{ #category : #printing }
CyExpression >> tokensPrefixTypeOn: tokens [
	tokens add: self operator.
	tokens space.
	tokens parenEnclosedAdd: self expressions cypherValueString 
]

{ #category : #accessing }
CyExpression >> type [
	^ type
]

{ #category : #accessing }
CyExpression >> type: anObject [
	"#prefix, #infix. #postfix"
	type := anObject
]

{ #category : #'shortcuts-conditions' }
CyExpression >> xor: otherExpression [
	^self class xor: self with: otherExpression
]

{ #category : #'shortcuts-conditions' }
CyExpression >> | otherExpression [
	^self or: otherExpression 
]
