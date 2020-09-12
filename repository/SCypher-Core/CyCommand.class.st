Class {
	#name : #CyCommand,
	#superclass : #CyObject,
	#instVars : [
		'commandName'
	],
	#category : 'SCypher-Core'
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

{ #category : #printing }
CyCommand >> tokensOn: tokens [
	tokens add: self commandName; space.
	tokens add: (self value cypherTokenString)
]
