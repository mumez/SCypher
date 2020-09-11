Class {
	#name : #CyIndexSpecifier,
	#superclass : #CyObject,
	#instVars : [
		'label',
		'prop'
	],
	#category : 'SCypher-Core'
}

{ #category : #'instance creation' }
CyIndexSpecifier class >> label: label prop: prop [
	^ self new
		label: label;
		prop: prop;
		yourself
]

{ #category : #accessing }
CyIndexSpecifier >> label [
	^ label
]

{ #category : #accessing }
CyIndexSpecifier >> label: anObject [
	label := anObject
]

{ #category : #accessing }
CyIndexSpecifier >> prop [
	^ prop
]

{ #category : #accessing }
CyIndexSpecifier >> prop: anObject [
	prop := anObject
]

{ #category : #printing }
CyIndexSpecifier >> tokensLabelOn: tokens [
	self label ifNotNil: [ tokens add: ':', self label cypherLabelString ].
	
]

{ #category : #printing }
CyIndexSpecifier >> tokensOn: tokens [
	tokens spacedAdd: 'INDEX ON'.
	self tokensLabelOn: tokens.
	self tokensPropertyOn: tokens
]

{ #category : #printing }
CyIndexSpecifier >> tokensPropertyOn: tokens [
	self prop ifNotNil: [ tokens parenEnclosedAdd: self prop cypherString].
	
]
