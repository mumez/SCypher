Class {
	#name : #CyLabel,
	#superclass : #CyObject,
	#instVars : [
		'type',
		'operator',
		'expressions'
	],
	#category : #'SCypher-Core'
}

{ #category : #'instance creation-shortcuts' }
CyLabel class >> and: labelA with: labelB [
	^self type: #infix operator: '&' expressions: {labelA. labelB}
]

{ #category : #'instance creation' }
CyLabel class >> label: aLabelName [
	^self type: #leaf operator: nil expressions: {aLabelName}
]

{ #category : #'instance creation-shortcuts' }
CyLabel class >> not: aLabel [
	^self type: #prefix operator: '!' expressions: {aLabel}
]

{ #category : #'instance creation-shortcuts' }
CyLabel class >> or: labelA with: labelB [
	^self type: #infix operator: '|' expressions: {labelA. labelB}
]

{ #category : #'instance creation' }
CyLabel class >> type: aSymbol operator: operatorString expressions: aCollection [
	^self new
		type: aSymbol;
		operator: operatorString;
		expressions: aCollection asOrderedCollection;
		yourself
]

{ #category : #'shortcuts-conditions' }
CyLabel >> & otherLabel [
	^self class and: self with: otherLabel
]

{ #category : #printing }
CyLabel >> cypherLabelString [
	^self cypherString
]

{ #category : #accessing }
CyLabel >> expressions [
	^ expressions
]

{ #category : #accessing }
CyLabel >> expressions: anObject [
	expressions := anObject
]

{ #category : #testing }
CyLabel >> isInfix [
	^self type = #infix
]

{ #category : #testing }
CyLabel >> isLeaf [
	^self type = #leaf
]

{ #category : #testing }
CyLabel >> isPrefix [
	^self type = #prefix
]

{ #category : #'shortcuts-conditions' }
CyLabel >> not [
	^self class not: self
]

{ #category : #accessing }
CyLabel >> operator [
	^ operator
]

{ #category : #accessing }
CyLabel >> operator: anObject [
	operator := anObject
]

{ #category : #'shortcuts-conditions' }
CyLabel >> | otherLabel [
	^self class or: self with: otherLabel
]

{ #category : #printing }
CyLabel >> tokensFor: operand [
	| opTokens needsParens |
	opTokens := CyTokenCollection new.
	(operand isKindOf: CyLabel)
		ifFalse: [ opTokens add: operand cypherLabelString. ^opTokens ].
	needsParens := operand isLeaf not.
	needsParens ifTrue: [ opTokens add: '(' ].
	operand tokensOn: opTokens.
	needsParens ifTrue: [ opTokens add: ')' ].
	^opTokens
]

{ #category : #printing }
CyLabel >> tokensOn: tokens [
	self isLeaf ifTrue: [ ^tokens add: self expressions first cypherLabelString ].
	self isPrefix ifTrue: [
		tokens add: self operator.
		^tokens addAll: (self tokensFor: self expressions first) ].
	tokens addAll: (self tokensFor: self expressions first).
	tokens add: self operator.
	tokens addAll: (self tokensFor: self expressions last)
]

{ #category : #accessing }
CyLabel >> type [
	^ type
]

{ #category : #accessing }
CyLabel >> type: anObject [
	"#leaf, #infix, #prefix"
	type := anObject
]
