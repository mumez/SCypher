Class {
	#name : #CyDropConstraintCommand,
	#superclass : #CyConstraintCommand,
	#category : 'SCypher-Core'
}

{ #category : #'instance creation' }
CyDropConstraintCommand class >> name: indexName [
	^self name: indexName dropIfExists: false
]

{ #category : #'instance creation' }
CyDropConstraintCommand class >> name: indexName dropIfExists: aBoolean [
	| inst |
	inst := self of: (CyIndexSpecifier name: indexName).
	aBoolean ifTrue: [ inst value ifExists  ].
	^ inst
]

{ #category : #defaults }
CyDropConstraintCommand >> defaultCommandName [
	^'DROP'
]
