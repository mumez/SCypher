printing
tokensOn: tokens
	tokens add: self procName.
	self isImplicit ifTrue: [^self].
	self expressions ifNil: [^self ].
	tokens parenEnclosedAdd: self expressions cypherString
	