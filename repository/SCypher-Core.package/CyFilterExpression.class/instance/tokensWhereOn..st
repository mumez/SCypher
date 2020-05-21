printing
tokensWhereOn: tokens
	self where ifNil: [^self].
	tokens spacedAdd: 'WHERE'.
	tokens add: self where cypherString