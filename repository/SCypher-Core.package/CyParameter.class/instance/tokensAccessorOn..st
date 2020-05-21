printing
tokensAccessorOn: tokens
	self accessor
		ifNotNil: [ :acc | 
			tokens
				add: '.';
				add: acc cypherString ]