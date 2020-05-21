printing
tokensWithoutEndNodeOn: tokens
	self tokensStartNodeOn: tokens.
	self tokensStartPartEdgeOn: tokens.
	
	((self identifier notNil or: [ self type notNil ]) or: [ self props notNil ]) ifTrue: [ 
		self tokensCenterPartEdgeOn: tokens
	].
	
	self tokensEndPartEdgeOn: tokens