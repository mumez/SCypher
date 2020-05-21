printing
tokensOn: tokens
	tokens add: self keyword.
	tokens spacedAdd: self procInvocation cypherString.
	
	self tokensYieldOn: tokens.