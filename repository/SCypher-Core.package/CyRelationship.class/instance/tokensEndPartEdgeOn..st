printing
tokensEndPartEdgeOn: tokens
	(self isOut or: [self isBoth]) 
		ifTrue: [tokens  add: '->']
		ifFalse: [ tokens add: '-' ]