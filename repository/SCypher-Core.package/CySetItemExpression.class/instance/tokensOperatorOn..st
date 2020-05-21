printing
tokensOperatorOn: tokens
	(self operator isNil or: [self operator = #labels]) ifTrue: [ ^self ].
	tokens spacedAdd: self operator