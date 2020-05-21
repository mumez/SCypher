printing
tokensOn: tokens
	tokens add: self keyword; space.
	
	tokens addAll: (self join: ', ' in: self itemSetters by: #cypherString)