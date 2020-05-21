printing
tokensOn: tokens
	self enclosed ifTrue: [tokens parenBegin].
	tokens add: (self value asString).
	self enclosed ifTrue: [tokens parenEnd]