Class {
	#name : #CyWhere,
	#superclass : #CyClause,
	#category : 'SCypher-Core'
}

{ #category : #printing }
CyWhere >> tokensOn: tokens [
	"The outermost parentheses right after WHERE are always redundant. Render them away on a copy,
	so the given expression stays enclosed wherever else it is reused."

	tokens add: self keyword; space.
	tokens add: self value withoutOutermostParentheses cypherTokenString.
	self tokensAliasOn: tokens
]
