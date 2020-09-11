Class {
	#name : #CyYieldItem,
	#superclass : #CyObject,
	#category : 'SCypher-Core'
}

{ #category : #printing }
CyYieldItem >> tokensOn: tokens [
	tokens add: self value cypherString.
	self tokensAliasOn: tokens
	
]
