Class {
	#name : #CyConstraintCommand,
	#superclass : #CyCommand,
	#category : 'SCypher-Core'
}

{ #category : #'instance creation' }
CyConstraintCommand class >> node: node existsProp: prop [
	| existenceSpecifier |
	existenceSpecifier := CyExistenceConstraintSpecifier target: node prop: prop.
	^ self of: existenceSpecifier
]

{ #category : #'instance creation' }
CyConstraintCommand class >> node: node uniqueProp: prop [
	| uniqueSpecifier |
	uniqueSpecifier := CyUniqueConstraintSpecifier node: node prop: prop.
	^ self of: uniqueSpecifier
]

{ #category : #'instance creation' }
CyConstraintCommand class >> relationshipName: relationshipName type: relationshipType existsProp: prop [
	| existenceSpecifier |
	existenceSpecifier := CyExistenceConstraintSpecifier relationshipName: relationshipName type: relationshipType prop: prop.
	^ self of: existenceSpecifier
]
