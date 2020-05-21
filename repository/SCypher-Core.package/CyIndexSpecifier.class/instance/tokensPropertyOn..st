printing
tokensPropertyOn: tokens
	self prop ifNotNil: [ tokens parenEnclosedAdd: self prop cypherString].
	