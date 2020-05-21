printing
tokensOn: tokens
	tokens squareBegin.
	self tokensFromOn: tokens.
	tokens add: '..'.
	self tokensToOn: tokens.
	tokens squareEnd.