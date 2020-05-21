printing
tokensPostfixTypeOn: tokens
	tokens add: self expressions cypherString.
	tokens space.
	tokens add: self operator cypherString.
	