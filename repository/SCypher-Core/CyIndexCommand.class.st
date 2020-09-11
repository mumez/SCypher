Class {
	#name : #CyIndexCommand,
	#superclass : #CyCommand,
	#category : 'SCypher-Core'
}

{ #category : #'instance creation' }
CyIndexCommand class >> label: label prop: prop [
	| indexSpecifier |
	indexSpecifier := CyIndexSpecifier label: label prop: prop.
	^ self of: indexSpecifier
]
