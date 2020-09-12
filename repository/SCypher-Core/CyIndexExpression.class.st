Class {
	#name : #CyIndexExpression,
	#superclass : #CyObject,
	#category : 'SCypher-Core'
}

{ #category : #printing }
CyIndexExpression >> tokensOn: tokens [
	tokens squareEnclosedAdd: self value cypherString 
]
