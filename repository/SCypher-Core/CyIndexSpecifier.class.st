Class {
	#name : #CyIndexSpecifier,
	#superclass : #CyObject,
	#instVars : [
		'target',
		'props'
	],
	#category : #'SCypher-Core'
}

{ #category : #'instance creation' }
CyIndexSpecifier class >> target: nodeOrRelationship props: props [
	^ self new
		target: nodeOrRelationship;
		props: props;
		yourself
]

{ #category : #accessing }
CyIndexSpecifier >> props [ 
	^ props
]

{ #category : #accessing }
CyIndexSpecifier >> props: anObject [
	props := anObject
]

{ #category : #accessing }
CyIndexSpecifier >> target [
	^ target
]

{ #category : #accessing }
CyIndexSpecifier >> target: anObject [
	target := anObject
]

{ #category : #printing }
CyIndexSpecifier >> tokensOn: tokens [
	tokens add: 'INDEX'.
	
	tokens spacedAdd: 'FOR'.
	tokens spacedAdd: self target cypherString.
	
	tokens spacedAdd: 'ON'.
	self tokensPropsOn: tokens.
]

{ #category : #printing }
CyIndexSpecifier >> tokensPropsOn: tokens [
	tokens parenEnclosedAdd: self props cypherString
]
