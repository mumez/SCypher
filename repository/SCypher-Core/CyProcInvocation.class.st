Class {
	#name : #CyProcInvocation,
	#superclass : #CyAtomExpression,
	#instVars : [
		'isImplicit',
		'procName',
		'expressions'
	],
	#category : 'SCypher-Core'
}

{ #category : #'instance creation' }
CyProcInvocation class >> implicit: procName [
	| inst |
	inst := self name: procName expressions: nil.
	inst isImplicit: true.
	^inst
]

{ #category : #'instance creation' }
CyProcInvocation class >> name: procName expression: expr [
	^self name: procName expressions: {expr}
]

{ #category : #'instance creation' }
CyProcInvocation class >> name: procName expressions: exprArray [
	^self new procName: procName; expressions: (CyObjects withAll: exprArray); yourself
]

{ #category : #accessing }
CyProcInvocation >> expressions [
	^ expressions
]

{ #category : #accessing }
CyProcInvocation >> expressions: anObject [
	expressions := anObject
]

{ #category : #testing }
CyProcInvocation >> isExplicit [
	^self isImplicit not
]

{ #category : #accessing }
CyProcInvocation >> isImplicit [
	^ isImplicit ifNil: [ isImplicit := false ]
]

{ #category : #accessing }
CyProcInvocation >> isImplicit: anObject [
	isImplicit := anObject
]

{ #category : #accessing }
CyProcInvocation >> procName [
	^ procName ifNil: [ procName := '' ]
]

{ #category : #accessing }
CyProcInvocation >> procName: anObject [
	procName := anObject
]

{ #category : #printing }
CyProcInvocation >> tokensOn: tokens [
	tokens add: self procName.
	self isImplicit ifTrue: [^self].
	self expressions ifNil: [^self ].
	tokens parenEnclosedAdd: self expressions cypherString
	
]
