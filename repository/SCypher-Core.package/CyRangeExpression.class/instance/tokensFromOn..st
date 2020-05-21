printing
tokensFromOn: tokens
	self from ifNotNil: [ :f | tokens add: f cypherString ]