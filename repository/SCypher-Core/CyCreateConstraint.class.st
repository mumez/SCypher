Class {
	#name : #CyCreateConstraint,
	#superclass : #CyConstraintCommand,
	#category : #'SCypher-Core'
}

{ #category : #defaults }
CyCreateConstraint >> defaultCommandName [
	^'CREATE'
]

{ #category : #actions }
CyCreateConstraint >> isKey [
	self specifier isKey
]

{ #category : #actions }
CyCreateConstraint >> isNull [
	self specifier isNull
]

{ #category : #actions }
CyCreateConstraint >> notNull [
	self specifier notNull
]

{ #category : #actions }
CyCreateConstraint >> unique [
	self specifier unique
]
