Class {
	#name : #CyConstraintCommand,
	#superclass : #CyCommand,
	#category : 'SCypher-Core'
}

{ #category : #factory }
CyConstraintCommand class >> specifierClass [
	^ CyConstraintSpecifier 
]
