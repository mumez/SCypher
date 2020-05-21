printing
tokensOn: tokens
	tokens add: '('.
	self identifier ifNotNil: [ :nm | tokens add: nm cypherIdentifierString ].
	self tokensLabelOn: tokens.
	self tokensPropsOn: tokens.
	tokens add: ')'