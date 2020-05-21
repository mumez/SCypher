printing
tokensAliasOn: tokens
	self alias ifNotNil: [:nm | tokens addAll: {' AS '. nm cypherString}].
	