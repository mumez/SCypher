Class {
	#name : #CyIndexCommand,
	#superclass : #CyCommand,
	#category : 'SCypher-Core'
}

{ #category : #'instance creation' }
CyIndexCommand class >> label: nodeLabel prop: prop [
	| node |
	node := 'n' asCypherIdentifier node: {nodeLabel}.
	^ self target: node props: (CyObjects with: node @ prop).
	
]

{ #category : #'instance creation' }
CyIndexCommand class >> target: nodeOrRelationship props: props [
	| indexSpecifier |
	indexSpecifier := CyIndexSpecifier target: nodeOrRelationship props: props.
	^ self of: indexSpecifier
]
