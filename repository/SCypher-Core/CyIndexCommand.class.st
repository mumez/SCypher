Class {
	#name : #CyIndexCommand,
	#superclass : #CyCommand,
	#category : 'SCypher-Core'
}

{ #category : #'instance creation' }
CyIndexCommand class >> nodeLabeled: nodeLabel prop: prop [
	| node |
	node := 'n' asCypherIdentifier node: {nodeLabel}.
	^ self target: node props: (CyObjects with: node @ prop).
	
]

{ #category : #'instance creation' }
CyIndexCommand class >> relationshipTyped: relationshipType prop: prop [
	| node |
	node := (CyNode empty) - ('r' asCypherIdentifier rel: {relationshipType}) - (CyNode empty).
	^ self target: node props: (CyObjects with: node @ prop).
	
]

{ #category : #'instance creation' }
CyIndexCommand class >> target: nodeOrRelationship props: props [
	| indexSpecifier |
	indexSpecifier := CyIndexSpecifier target: nodeOrRelationship props: props.
	^ self of: indexSpecifier
]
