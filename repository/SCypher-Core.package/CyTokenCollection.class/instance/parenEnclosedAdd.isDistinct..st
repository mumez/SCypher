actions
parenEnclosedAdd: word isDistinct: aBoolean
	self parenBegin.
	aBoolean ifTrue: [ self spacedAdd: 'DISTINCT' ].
	self add: word.
	self parenEnd