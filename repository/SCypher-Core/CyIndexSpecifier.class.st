Class {
	#name : #CyIndexSpecifier,
	#superclass : #CyObject,
	#instVars : [
		'name',
		'type',
		'ifExpression',
		'target',
		'props'
	],
	#category : #'SCypher-Core'
}

{ #category : #'instance creation' }
CyIndexSpecifier class >> name: indexName [
	^ self new
		name: indexName;
		yourself
]

{ #category : #'instance creation' }
CyIndexSpecifier class >> target: nodeOrRelationship props: props [
	^ self new
		target: nodeOrRelationship;
		props: props;
		yourself
]

{ #category : #'index-type' }
CyIndexSpecifier >> fullText [
	self type: 'FULLTEXT'
]

{ #category : #actions }
CyIndexSpecifier >> ifExists [
	self ifExpression: 'EXISTS'
]

{ #category : #accessing }
CyIndexSpecifier >> ifExpression [

	^ ifExpression
]

{ #category : #accessing }
CyIndexSpecifier >> ifExpression: anObject [

	ifExpression := anObject
]

{ #category : #actions }
CyIndexSpecifier >> ifNotExists [
	self ifExpression: 'NOT EXISTS'
]

{ #category : #'index-type' }
CyIndexSpecifier >> lookUp [
	self type: 'LOOKUP'
]

{ #category : #accessing }
CyIndexSpecifier >> name [

	^ name
]

{ #category : #accessing }
CyIndexSpecifier >> name: anObject [

	name := anObject
]

{ #category : #'index-type' }
CyIndexSpecifier >> point [
	self type: 'POINT'
]

{ #category : #accessing }
CyIndexSpecifier >> props [ 
	^ props
]

{ #category : #accessing }
CyIndexSpecifier >> props: anObject [
	props := anObject
]

{ #category : #'index-type' }
CyIndexSpecifier >> range [
	self type: 'RANGE'
]

{ #category : #accessing }
CyIndexSpecifier >> target [
	^ target
]

{ #category : #accessing }
CyIndexSpecifier >> target: anObject [
	target := anObject
]

{ #category : #'index-type' }
CyIndexSpecifier >> text [
	self type: 'TEXT'
]

{ #category : #printing }
CyIndexSpecifier >> tokensForOn: tokens [
	self target ifNil: [ ^self ].
	tokens spacedAdd: 'FOR'.
	tokens spacedAdd: self target cypherString.
]

{ #category : #printing }
CyIndexSpecifier >> tokensIfOn: tokens [
	self ifExpression ifNil: [ ^self ].
	tokens spacedAdd: 'IF'.
	tokens spacedAdd: self ifExpression
]

{ #category : #printing }
CyIndexSpecifier >> tokensNameOn: tokens [
	self name ifNil: [ ^self ].
	tokens spacedAdd: self name
]

{ #category : #printing }
CyIndexSpecifier >> tokensOn: tokens [
	self tokensTypeOn: tokens.
	tokens spacedAdd: 'INDEX'.
	self tokensNameOn: tokens.
	self tokensIfOn: tokens.
	self tokensForOn: tokens.
	self tokensPropsOn: tokens.
]

{ #category : #printing }
CyIndexSpecifier >> tokensPropsOn: tokens [
	self props ifNil: [ ^self ].
	tokens spacedAdd: 'ON'.
	tokens parenEnclosedAdd: self props cypherString
]

{ #category : #printing }
CyIndexSpecifier >> tokensTypeOn: tokens [
	self type ifNil: [ ^self ].
	tokens spacedAdd: self type
]

{ #category : #accessing }
CyIndexSpecifier >> type [
	^ type
]

{ #category : #accessing }
CyIndexSpecifier >> type: anObject [

	type := anObject
]
