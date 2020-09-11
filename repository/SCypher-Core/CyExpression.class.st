Class {
	#name : #CyExpression,
	#superclass : #CyObject,
	#instVars : [
		'type',
		'operator',
		'expressions',
		'enclosed'
	],
	#category : 'SCypher-Core'
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
CyExpression class >> isNotNull: expA [
	^self type: #postfix operator: 'IS NOT NULL' expressions: {expA}
]

{ #category : #'instance creation-shortcuts' }
CyExpression class >> isNull: expA [
	^self type: #postfix operator: 'IS NULL' expressions: {expA}
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
	^self type: #postfix operator: (CyRangeExpression from: fromExpression to: toExpression) expressions: {expA}
]

{ #category : #'instance creation-list' }
CyExpression class >> list: expA fromFirstTo: endExpression [
	^self type: #postfix operator: (CyRangeExpression fromFirstTo: endExpression) expressions: {expA}
]

{ #category : #'instance creation-list' }
CyExpression class >> list: expA toLastFrom: startExpression [
	^self type: #postfix operator: (CyRangeExpression toLastFrom: startExpression) expressions: {expA}
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

{ #category : #actions }
CyExpression >> beEnclosed [
	self enclosed: true
]

{ #category : #actions }
CyExpression >> bePlain [
	self enclosed: false
]

{ #category : #accessing }
CyExpression >> enclosed [
	^enclosed ifNil: [ enclosed := true ]
]

{ #category : #accessing }
CyExpression >> enclosed: aBoolean [
	enclosed := aBoolean
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

{ #category : #testing }
CyExpression >> isPostfix [
	^self type = #postfix
]

{ #category : #testing }
CyExpression >> isPrefix [
	^self type = #prefix
]

{ #category : #accessing }
CyExpression >> operator [
	^ operator
]

{ #category : #accessing }
CyExpression >> operator: anObject [
	operator := anObject
]

{ #category : #printing }
CyExpression >> tokensInfixTypeOn: tokens [
	| leftExp rightExp |
	leftExp := self expressions first.
	rightExp := self expressions last.
	
	self enclosed ifTrue: [tokens parenBegin].
	tokens add: leftExp cypherString.
	tokens spacedAdd: self operator.
	tokens add: rightExp cypherString.
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
	tokens add: self expressions cypherString.
	tokens space.
	tokens add: self operator cypherString.
	
]

{ #category : #printing }
CyExpression >> tokensPrefixTypeOn: tokens [
	tokens add: self operator.
	tokens space.
	tokens parenEnclosedAdd: self expressions cypherString 
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
