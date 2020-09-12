Class {
	#name : #CyDelete,
	#superclass : #CyClause,
	#instVars : [
		'withRelations'
	],
	#category : 'SCypher-Core'
}

{ #category : #defaults }
CyDelete >> defaultKeyword [
	^self withRelations ifTrue: [^'DETACH DELETE' ] ifFalse: [ 'DELETE' ]
]

{ #category : #accessing }
CyDelete >> withRelations [
	^ withRelations ifNil: [ withRelations := false ]
]

{ #category : #accessing }
CyDelete >> withRelations: anObject [
	withRelations := anObject
]
