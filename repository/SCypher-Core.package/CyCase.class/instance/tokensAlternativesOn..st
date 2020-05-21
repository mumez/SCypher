printing
tokensAlternativesOn: tokens
	self alternatives do: [ :each |
		tokens spacedAdd: each cypherString
	]