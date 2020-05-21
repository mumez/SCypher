printing
tokensInfixTypeOn: tokens
	| leftExp rightExp |
	leftExp := self expressions first.
	rightExp := self expressions last.
	
	self enclosed ifTrue: [tokens parenBegin].
	tokens add: leftExp cypherString.
	tokens spacedAdd: self operator.
	tokens add: rightExp cypherString.
	self enclosed ifTrue: [tokens parenEnd]