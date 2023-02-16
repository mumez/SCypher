Class {
	#name : #CyCommand,
	#superclass : #CyObject,
	#instVars : [
		'commandName'
	],
	#category : #'SCypher-Core'
}

{ #category : #accessing }
CyCommand >> commandName [
	^commandName ifNil: [ commandName := self defaultCommandName ]
]

{ #category : #accessing }
CyCommand >> commandName: anObject [
	commandName := anObject
]

{ #category : #defaults }
CyCommand >> defaultCommandName [
	^''
]

{ #category : #actions }
CyCommand >> spec: aBlock [
	aBlock value: self value
]

{ #category : #accessing }
CyCommand >> specifier [
	^ self value
]

{ #category : #printing }
CyCommand >> tokensOn: tokens [
	tokens add: self commandName.
	tokens spacedAdd: (self value cypherTokenString)
]
