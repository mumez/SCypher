printing
tokensOn: tokens
	self statements
		do: [ :each | tokens addAll: each tokenArray ]
		separatedBy: [ tokens add: self delimiter ]