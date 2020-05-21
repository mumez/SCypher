printing
tokensOn: tokens
	tokens spacedAdd: self keyword.
	
	self isDistinct ifTrue: [ 
		tokens spacedAdd: 'DISTINCT'
	].
	
	self tokensBodyOn: tokens.
	