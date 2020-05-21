defaults
defaultKeyword
	^self isOptional ifTrue: [^'OPTIONAL MATCH' ] ifFalse: [ 'MATCH' ]