printing
tokensPrefixTypeOn: tokens
	tokens add: self operator.
	tokens space.
	tokens parenEnclosedAdd: self expressions cypherString 