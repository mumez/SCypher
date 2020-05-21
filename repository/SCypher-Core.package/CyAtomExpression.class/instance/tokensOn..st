printing
tokensOn: tokens
	self value ifNotNil: [:nm | tokens add: nm cypherString ].
	self tokensAliasOn: tokens