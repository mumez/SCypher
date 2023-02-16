Class {
	#name : #CyCommandSpecifier,
	#superclass : #CyObject,
	#instVars : [
		'name',
		'ifExpression',
		'target',
		'props'
	],
	#category : #'SCypher-Core'
}

{ #category : #'instance creation' }
CyCommandSpecifier class >> name: indexName [
	^ self new
		name: indexName;
		yourself
]

{ #category : #actions }
CyCommandSpecifier >> ifExists [
	self ifExpression: 'EXISTS'
]

{ #category : #accessing }
CyCommandSpecifier >> ifExpression [

	^ ifExpression
]

{ #category : #accessing }
CyCommandSpecifier >> ifExpression: anObject [

	ifExpression := anObject
]

{ #category : #actions }
CyCommandSpecifier >> ifNotExists [
	self ifExpression: 'NOT EXISTS'
]

{ #category : #accessing }
CyCommandSpecifier >> name [

	^ name
]

{ #category : #accessing }
CyCommandSpecifier >> name: anObject [

	name := anObject
]

{ #category : #accessing }
CyCommandSpecifier >> props [

	^ props
]

{ #category : #accessing }
CyCommandSpecifier >> props: anObject [

	props := anObject
]

{ #category : #accessing }
CyCommandSpecifier >> target [
	^ target
]

{ #category : #accessing }
CyCommandSpecifier >> target: anObject [
	target := anObject
]

{ #category : #printing }
CyCommandSpecifier >> tokensForOn: tokens [
	self target ifNil: [ ^self ].
	tokens spacedAdd: 'FOR'.
	tokens spacedAdd: self target cypherString.
]

{ #category : #printing }
CyCommandSpecifier >> tokensIfOn: tokens [
	self ifExpression ifNil: [ ^self ].
	tokens spacedAdd: 'IF'.
	tokens spacedAdd: self ifExpression
]

{ #category : #printing }
CyCommandSpecifier >> tokensNameOn: tokens [
	self name ifNil: [ ^self ].
	tokens spacedAdd: self name
]

{ #category : #printing }
CyCommandSpecifier >> tokensOn: tokens [
	self tokensNameOn: tokens.
	self tokensIfOn: tokens.
	self tokensForOn: tokens.
	self tokensPropsOn: tokens.
]

{ #category : #printing }
CyCommandSpecifier >> tokensPropsOn: tokens [
	self props ifNil: [ ^self ].
	tokens spacedAdd: 'ON'.
	tokens parenEnclosedAdd: self props cypherString
]

{ #category : #printing }
CyCommandSpecifier >> tokensTypeOn: tokens [
	self type ifNil: [ ^self ].
	tokens spacedAdd: self type
]
