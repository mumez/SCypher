Class {
	#name : #CyPatternElement,
	#superclass : #CyObject,
	#instVars : [
		'relationships',
		'shortestPathType',
		'assignedTo'
	],
	#category : #'SCypher-Core'
}

{ #category : #'instance creation' }
CyPatternElement class >> with: aRelationship [
	^self withAll: { aRelationship }
]

{ #category : #'instance creation' }
CyPatternElement class >> withAll: aCollection [
	^self new relationships: aCollection asOrderedCollection; yourself
]

{ #category : #'actions-path pattern' }
CyPatternElement >> - aNode [
	self lastRelationship end: aNode
]

{ #category : #'actions-path pattern' }
CyPatternElement >> -> aNode [
	self lastRelationship end: aNode; beOut
]

{ #category : #adding }
CyPatternElement >> addRelationship: anRelationship [
	self relationships add: anRelationship
]

{ #category : #accessing }
CyPatternElement >> assignedTo [
	^ assignedTo
]

{ #category : #accessing }
CyPatternElement >> assignedTo: anIdentifier [
	assignedTo := anIdentifier
]

{ #category : #accessing }
CyPatternElement >> lastRelationship [
	^self relationships last
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
	| assignedVariable |
	assignedVariable := self assignedTo.
	assignedVariable ifNil: [^ self tokensRelationshipsOn: tokens].
	assignedVariable tokensOn: tokens.
	tokens spacedAdd: '='.
	self tokensRelationshipsOn: tokens
	
]

{ #category : #printing }
CyPatternElement >> tokensRelationshipsOn: tokens [
	| rels |
	rels := self relationships.
	rels isEmptyOrNil ifTrue: [ ^ self ].
	rels size = 1 ifTrue: [ ^ rels first tokensOn: tokens ].
	rels allButLastDo: [ :each |
		each tokensWithoutEndNodeOn: tokens
	].
	rels last tokensOn: tokens 
]
