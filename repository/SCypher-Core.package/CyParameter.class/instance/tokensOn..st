printing
tokensOn: tokens
	tokens add: '$'.
	self identifier ifNotNil: [:nm | tokens add: nm cypherString].
	self tokensAccessorOn: tokens.