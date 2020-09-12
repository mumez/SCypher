Class {
	#name : #CyYield,
	#superclass : #CyObjects,
	#category : 'SCypher-Core'
}

{ #category : #'instance creation' }
CyYield class >> of: itemOrItems [
	| cypherObj items |
	cypherObj := itemOrItems asCypherObject.
	items := cypherObj isCollection ifTrue: [cypherObj] ifFalse: [self withAll: {cypherObj}].
	^self new items: items; yourself
]

{ #category : #printing }
CyYield >> tokensOn: tokens [
	tokens spacedAdd: 'YIELD'.
	super tokensOn: tokens
]
