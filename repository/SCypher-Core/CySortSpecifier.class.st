Class {
	#name : #CySortSpecifier,
	#superclass : #CyObject,
	#instVars : [
		'order'
	],
	#category : 'SCypher-Core'
}

{ #category : #actions }
CySortSpecifier >> asc [
	self order: #ASC
]

{ #category : #actions }
CySortSpecifier >> desc [
	self order: #DESC
]

{ #category : #accessing }
CySortSpecifier >> order [
	^ order
]

{ #category : #accessing }
CySortSpecifier >> order: anObject [
	order := anObject
]

{ #category : #printing }
CySortSpecifier >> tokensOn: tokens [
	self value ifNotNil: [:nm | tokens spacedAdd: nm cypherString ].
	self order ifNotNil: [ tokens preSpacedAdd: self order asString]
]
