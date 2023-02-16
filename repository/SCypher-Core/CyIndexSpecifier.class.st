Class {
	#name : #CyIndexSpecifier,
	#superclass : #CyCommandSpecifier,
	#instVars : [
		'type'
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

{ #category : #'index-type' }
CyIndexSpecifier >> lookUp [
	self type: 'LOOKUP'
]

{ #category : #'index-type' }
CyIndexSpecifier >> point [
	self type: 'POINT'
]

{ #category : #'index-type' }
CyIndexSpecifier >> range [
	self type: 'RANGE'
]

{ #category : #'index-type' }
CyIndexSpecifier >> text [
	self type: 'TEXT'
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
