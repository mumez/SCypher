printing
tokensValueOn: tokens
	(self operator isNil or: [self operator = #labels]) ifTrue: [
		tokens add: ':'.
		tokens add: self labelString.
		 ^self 
	].

	tokens add: self value cypherString 