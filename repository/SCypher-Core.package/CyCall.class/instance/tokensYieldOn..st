printing
tokensYieldOn: tokens
	self procInvocation ifNil: [ ^self ].
	self yieldPhrase ifNotNil: [:yield | 
		tokens add: yield cypherString  	
	]