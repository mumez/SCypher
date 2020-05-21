printing
tokensOn: tokens
	tokens spacedAdd: 'CASE'.
	self target ifNotNil: [:tar | tokens spacedAdd: tar cypherString].
	self tokensAlternativesOn: tokens.
	self tokensElseOn: tokens.
	tokens spacedAdd: 'END'