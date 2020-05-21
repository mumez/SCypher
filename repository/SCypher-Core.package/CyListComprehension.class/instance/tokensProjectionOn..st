printing
tokensProjectionOn: tokens
	| proj |
	proj := self projectionExpression.
	proj ifNil: [ ^self ].
	tokens spacedAdd: '|'.
	tokens add: proj cypherString 