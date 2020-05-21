printing
tokensOn: tokens
	tokens add: self identifier cypherString.
	self tokensOperatorOn: tokens.
	self tokensValueOn: tokens