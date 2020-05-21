printing
tokensOn: tokens
	self items do: [ :each |
		tokens add: each cypherString 
	] separatedBy: [ tokens add: ', ' ]