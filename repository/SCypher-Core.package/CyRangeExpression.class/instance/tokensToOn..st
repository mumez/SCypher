printing
tokensToOn: tokens
	self to ifNotNil: [ :t | tokens add: t cypherString ]