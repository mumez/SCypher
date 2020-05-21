*SCypher-Core-printing
cypherString
	self = '*' ifTrue: [ ^self ].
	^self cypherIdentifierString 