printing
tokensOn: tokens
	self expressions ifNil: [ ^ self ].
	tokens add: self funcName.
	
	tokens parenEnclosedAdd: self expressions cypherString isDistinct: self isDistinct.
	self tokensAliasOn: tokens