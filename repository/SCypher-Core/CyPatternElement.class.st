Class {
	#name : #CyPatternElement,
	#superclass : #CyObject,
	#instVars : [
		'relationships',
		'shortestPathType',
		'assignedTo'
	],
	#category : 'SCypher-Core'
}

{ #category : #'instance creation' }
CyPatternElement class >> withAll: aCollection [
	^self new relationships: aCollection; yourself
]

{ #category : #accessing }
CyPatternElement >> relationships [
	^ relationships
]

{ #category : #accessing }
CyPatternElement >> relationships: anObject [
	relationships := anObject
]

{ #category : #accessing }
CyPatternElement >> shortestPathType [
	^ shortestPathType
]

{ #category : #accessing }
CyPatternElement >> shortestPathType: anObject [
	shortestPathType := anObject
]

{ #category : #printing }
CyPatternElement >> tokensOn: tokens [
	| rels |
	rels := self relationships.
	rels isEmptyOrNil ifTrue: [ ^self ].
	rels size = 1 ifTrue: [ rels first tokensOn: tokens ].
	rels allButLastDo: [ :each |
		each tokensWithoutEndNodeOn: tokens
	].
	rels last tokensOn: tokens 
]
