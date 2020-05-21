converting
tokenArray
	| tokens |
	tokens := CyTokenCollection new.
	self tokensOn: tokens.
	^tokens