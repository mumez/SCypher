printing
tokensOn: tokens
	self isPrefix ifTrue: [ ^self tokensPrefixTypeOn: tokens ].
	self isInfix ifTrue: [ ^self tokensInfixTypeOn: tokens ].
	self isPostfix ifTrue: [ ^self tokensPostfixTypeOn: tokens ].