Class {
	#name : #CyCreate,
	#superclass : #CyClause,
	#instVars : [
		'isUnique'
	],
	#category : 'SCypher-Core'
}

{ #category : #defaults }
CyCreate >> defaultKeyword [
	^self isUnique ifTrue: [^'CREATE UNIQUE' ] ifFalse: [ 'CREATE' ]
]

{ #category : #accessing }
CyCreate >> isUnique [
	^ isUnique ifNil: [ isUnique := false ]
]

{ #category : #accessing }
CyCreate >> isUnique: anObject [
	isUnique := anObject
]
