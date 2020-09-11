Class {
	#name : #CyParenExpression,
	#superclass : #CyObject,
	#category : 'SCypher-Core'
}

{ #category : #printing }
CyParenExpression >> tokensOn: tokens [
	tokens parenEnclosedAdd: self value cypherString 
]
