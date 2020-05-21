printing
tokensOn: tokens
	tokens squareBegin.
	self tokensFilterOn: tokens.
	self tokensProjectionOn: tokens.
	tokens squareEnd
	