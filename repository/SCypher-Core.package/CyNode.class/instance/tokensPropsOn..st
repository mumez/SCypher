printing
tokensPropsOn: tokens
	| prps |
	prps := self props.
	prps isEmptyOrNil ifTrue: [ ^self ].
	
	tokens preSpacedAdd: (prps cypherString )