printing
tokensOn: tokens
	tokens spacedAdd: 'CONSTRAINT ON'.
	self tokensTargetOn: tokens.
	self tokensAssertionOn: tokens