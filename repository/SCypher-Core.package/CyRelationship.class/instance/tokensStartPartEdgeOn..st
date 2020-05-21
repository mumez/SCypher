printing
tokensStartPartEdgeOn: tokens
	(self isIn or: [self isBoth])
		ifTrue: [tokens  add: '<-']
		ifFalse: [ tokens add: '-' ].
	