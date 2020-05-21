printing
tokensOn: tokens
	tokens add: self keyword; space.
	tokens add: (self value cypherTokenString).
	
	self tokensAliasOn: tokens