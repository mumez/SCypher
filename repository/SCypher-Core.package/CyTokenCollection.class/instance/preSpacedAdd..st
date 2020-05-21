actions
preSpacedAdd: word
	(self notEmpty and: [self last ~= String space]) ifTrue: [ self space ].
	self add: word