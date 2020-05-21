printing
tokensOn: tokens
	self value ifNotNil: [:nm | tokens spacedAdd: nm cypherString ].
	self order ifNotNil: [ tokens preSpacedAdd: self order asString]