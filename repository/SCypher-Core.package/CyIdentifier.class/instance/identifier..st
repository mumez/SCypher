accessing
identifier: identifierLikeThing
	(identifierLikeThing isKindOf: CyObject)
		ifTrue: [ ^ super identifier: identifierLikeThing identifier ].
	super identifier: identifierLikeThing