printing
tokensOn: tokens
	self identifier ifNotNil: [:nm | tokens add: nm cypherIdentifierString].
	self tokensAccessorOn: tokens.
	self tokensAliasOn: tokens