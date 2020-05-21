defaults
defaultKeyword
	^self withRelations ifTrue: [^'DETACH DELETE' ] ifFalse: [ 'DELETE' ]