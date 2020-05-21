printing
tokensOn: tokens
	tokens add: self commandName; space.
	tokens add: (self value cypherTokenString)