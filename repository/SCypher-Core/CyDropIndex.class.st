Class {
	#name : #CyDropIndex,
	#superclass : #CyIndexCommand,
	#category : 'SCypher-Core'
}

{ #category : #'instance creation' }
CyDropIndex class >> name: indexName [
	^self name: indexName dropIfExists: false
]

{ #category : #'instance creation' }
CyDropIndex class >> name: indexName dropIfExists: aBoolean [
	| inst |
	inst := self of: (CyIndexSpecifier name: indexName).
	aBoolean ifTrue: [ inst value ifExists  ].
	^ inst
]

{ #category : #defaults }
CyDropIndex >> defaultCommandName [
	^'DROP'
]
