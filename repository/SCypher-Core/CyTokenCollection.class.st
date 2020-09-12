Class {
	#name : #CyTokenCollection,
	#superclass : #OrderedCollection,
	#category : 'SCypher-Core'
}

{ #category : #actions }
CyTokenCollection >> cr [
	^self add: String cr
]

{ #category : #actions }
CyTokenCollection >> parenBegin [
	self add: '('
]

{ #category : #actions }
CyTokenCollection >> parenEnclosedAdd: word [
	self parenEnclosedAdd: word isDistinct: false
]

{ #category : #actions }
CyTokenCollection >> parenEnclosedAdd: word isDistinct: aBoolean [
	self parenBegin.
	aBoolean ifTrue: [ self spacedAdd: 'DISTINCT' ].
	self add: word.
	self parenEnd
]

{ #category : #actions }
CyTokenCollection >> parenEnd [
	self add: ')'
]

{ #category : #actions }
CyTokenCollection >> preSpacedAdd: word [
	(self notEmpty and: [self last ~= String space]) ifTrue: [ self space ].
	self add: word
]

{ #category : #actions }
CyTokenCollection >> space [
	^self add: ' '
]

{ #category : #actions }
CyTokenCollection >> spacedAdd: word [
	self preSpacedAdd: word.
	self space
]

{ #category : #actions }
CyTokenCollection >> squareBegin [
	self add: '['
]

{ #category : #actions }
CyTokenCollection >> squareEnclosedAdd: word [
	self squareBegin.
	self add: word.
	self squareEnd
]

{ #category : #actions }
CyTokenCollection >> squareEnd [
	self add: ']'
]
