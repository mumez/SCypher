Class {
	#name : #CyCommand,
	#superclass : #CyObject,
	#instVars : [
		'commandName'
	],
	#category : #'SCypher-Core'
}

{ #category : #'instance creation' }
CyCommand class >> name: indexName [
	^self name: indexName dropIfExists: false
]

{ #category : #'instance creation' }
CyCommand class >> name: indexName dropIfExists: aBoolean [
	| inst |
	inst := self of: (self specifierClass name: indexName).
	aBoolean ifTrue: [ inst value ifExists  ].
	^ inst
]

{ #category : #'instance creation' }
CyCommand class >> nodeLabeled: nodeLabel prop: prop [
	| node |
	node := 'n' asCypherIdentifier node: {nodeLabel}.
	^ self target: node props: (CyObjects with: node @ prop).
	
]

{ #category : #'instance creation' }
CyCommand class >> relationshipTyped: relationshipType prop: prop [
	| node |
	node := (CyNode empty) - ('r' asCypherIdentifier rel: {relationshipType}) - (CyNode empty).
	^ self target: node props: (CyObjects with: node @ prop).
	
]

{ #category : #factory }
CyCommand class >> specifierClass [
	^ self subclassResponsibility 
]

{ #category : #'instance creation' }
CyCommand class >> target: nodeOrRelationship props: props [
	| indexSpecifier |
	indexSpecifier := self specifierClass target: nodeOrRelationship props: props.
	^ self of: indexSpecifier
]

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
