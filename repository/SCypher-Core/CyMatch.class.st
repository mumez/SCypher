Class {
	#name : #CyMatch,
	#superclass : #CyClause,
	#instVars : [
		'isOptional'
	],
	#category : 'SCypher-Core'
}

{ #category : #defaults }
CyMatch >> defaultKeyword [
	^self isOptional ifTrue: [^'OPTIONAL MATCH' ] ifFalse: [ 'MATCH' ]
]

{ #category : #accessing }
CyMatch >> isOptional [
	^ isOptional ifNil: [ isOptional := false ]
]

{ #category : #accessing }
CyMatch >> isOptional: anObject [
	isOptional := anObject
]
