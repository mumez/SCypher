printing
tokensOn: tokens
	tokens add: self keyword; space.
	tokens parenBegin.
	tokens spacedAdd: self value cypherString.
	tokens spacedAdd: 'IN'.
	tokens spacedAdd: self inExpression cypherString.
	tokens spacedAdd: '|'.
	self tokensUpdatingClausesOn: tokens.
	tokens parenEnd 