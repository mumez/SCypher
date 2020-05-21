printing
tokensCenterPartEdgeOn: tokens
	tokens add: '['.
	self identifier ifNotNil: [:nm | tokens add: nm].
	
	self types ifNotNil: [ tokens add: ':' ].
	self types do: [:each | tokens add: each ] separatedBy: [ tokens add: '|' ].
	
	self props ifNotNil: [  
		self types ifNotNil: [ tokens add: ' ' ].
		tokens add: (self props cypherString )].
	
	tokens add: ']'