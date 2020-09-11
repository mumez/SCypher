Class {
	#name : #CyFuncInvocation,
	#superclass : #CyAtomExpression,
	#instVars : [
		'isDistinct',
		'funcName',
		'expressions'
	],
	#category : 'SCypher-Core'
}

{ #category : #'instance creation-shortcuts' }
CyFuncInvocation class >> abs: expression [
	^self call: 'abs' expression: expression
]

{ #category : #'instance creation' }
CyFuncInvocation class >> call: funcName expression: expr [
	^self call: funcName expressions: {expr}
]

{ #category : #'instance creation' }
CyFuncInvocation class >> call: funcName expressions: exprArray [
	^self new funcName: funcName; expressions: (CyObjects withAll: exprArray); yourself
]

{ #category : #'instance creation-shortcuts' }
CyFuncInvocation class >> coalesce: propValue with: defaultValue [
	^self call: 'coalesce' expressions: { propValue. defaultValue}
]

{ #category : #'instance creation-shortcuts' }
CyFuncInvocation class >> collect: expression [
	^self call: 'collect' expression: expression
]

{ #category : #'instance creation-shortcuts' }
CyFuncInvocation class >> count: expression [
	^self call: 'count' expression: expression
]

{ #category : #'instance creation-shortcuts' }
CyFuncInvocation class >> endNode: expression [
	^self call: 'endNode' expression: expression
]

{ #category : #'instance creation-shortcuts' }
CyFuncInvocation class >> exists: expression [
	^self call: 'exists' expression: expression
]

{ #category : #'instance creation-shortcuts' }
CyFuncInvocation class >> head: expression [
	^self call: 'head' expression: expression
]

{ #category : #'instance creation-shortcuts' }
CyFuncInvocation class >> id: expression [
	^self call: 'id' expression: expression
]

{ #category : #'instance creation-shortcuts' }
CyFuncInvocation class >> keys: expression [
	^self call: 'keys' expression: expression
]

{ #category : #'instance creation-shortcuts' }
CyFuncInvocation class >> labels: expression [
	^self call: 'labels' expression: expression
]

{ #category : #'instance creation-shortcuts' }
CyFuncInvocation class >> last: expression [
	^self call: 'last' expression: expression
]

{ #category : #'instance creation-shortcuts' }
CyFuncInvocation class >> length: expression [
	^self call: 'length' expression: expression
]

{ #category : #'instance creation-shortcuts' }
CyFuncInvocation class >> lower: expression [
	^self call: 'lower' expression: expression
]

{ #category : #'instance creation-shortcuts' }
CyFuncInvocation class >> max: expression [
	^self call: 'max' expression: expression
]

{ #category : #'instance creation-shortcuts' }
CyFuncInvocation class >> min: expression [
	^self call: 'min' expression: expression
]

{ #category : #'instance creation-shortcuts' }
CyFuncInvocation class >> rangeFrom: from to: to step: step [
	^self call: 'range' expressions: { from. to. step}
]

{ #category : #'instance creation-shortcuts' }
CyFuncInvocation class >> relationships: expression [
	^self call: 'relationships' expression: expression
]

{ #category : #'instance creation-shortcuts' }
CyFuncInvocation class >> replace: original searcing: search with: replacement [
	^self call: 'replace' expressions: { original. search. replacement}
]

{ #category : #'instance creation-shortcuts' }
CyFuncInvocation class >> reverse: expression [
	^self call: 'reverse' expression: expression
]

{ #category : #'instance creation-shortcuts' }
CyFuncInvocation class >> size: expression [
	^self call: 'size' expression: expression
]

{ #category : #'instance creation-shortcuts' }
CyFuncInvocation class >> startNode: expression [
	^self call: 'startNode' expression: expression
]

{ #category : #'instance creation-shortcuts' }
CyFuncInvocation class >> substring: original from: begin length: subLength [
	^self call: 'substring' expressions: { original. begin. subLength}
]

{ #category : #'instance creation-shortcuts' }
CyFuncInvocation class >> sum: expression [
	^self call: 'sum' expression: expression
]

{ #category : #'instance creation-shortcuts' }
CyFuncInvocation class >> tail: expression [
	^self call: 'tail' expression: expression
]

{ #category : #'instance creation-shortcuts' }
CyFuncInvocation class >> timestamp [
	^self call: 'timestamp' expression: ''
]

{ #category : #'instance creation-shortcuts' }
CyFuncInvocation class >> toFloat: expression [
	^self call: 'toFloat' expression: expression
]

{ #category : #'instance creation-shortcuts' }
CyFuncInvocation class >> toInt: expression [
	^self call: 'toInt' expression: expression
]

{ #category : #'instance creation-shortcuts' }
CyFuncInvocation class >> toString: expression [
	^self call: 'toString' expression: expression
]

{ #category : #'instance creation-shortcuts' }
CyFuncInvocation class >> trim: expression [
	^self call: 'trim' expression: expression
]

{ #category : #'instance creation-shortcuts' }
CyFuncInvocation class >> type: expression [
	^self call: 'type' expression: expression
]

{ #category : #'instance creation-shortcuts' }
CyFuncInvocation class >> upper: expression [
	^self call: 'upper' expression: expression
]

{ #category : #actions }
CyFuncInvocation >> beDistinct [
	^self isDistinct: true
]

{ #category : #accessing }
CyFuncInvocation >> expressions [
	^ expressions
]

{ #category : #accessing }
CyFuncInvocation >> expressions: anObject [
	expressions := anObject
]

{ #category : #accessing }
CyFuncInvocation >> funcName [
	^ funcName ifNil: [ funcName := '' ]
]

{ #category : #accessing }
CyFuncInvocation >> funcName: anObject [
	funcName := anObject
]

{ #category : #accessing }
CyFuncInvocation >> isDistinct [
	^ isDistinct ifNil: [ isDistinct := false ]
]

{ #category : #accessing }
CyFuncInvocation >> isDistinct: anObject [
	isDistinct := anObject
]

{ #category : #printing }
CyFuncInvocation >> tokensOn: tokens [
	self expressions ifNil: [ ^ self ].
	tokens add: self funcName.
	
	tokens parenEnclosedAdd: self expressions cypherString isDistinct: self isDistinct.
	self tokensAliasOn: tokens
]
