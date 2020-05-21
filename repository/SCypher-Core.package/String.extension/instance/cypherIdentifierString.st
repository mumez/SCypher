*SCypher-Core-printing
cypherIdentifierString
	| firstChar |
	self ifEmpty: [ ^self ].
	firstChar := self first.
	(firstChar isLetter or: [ firstChar = $_ ]) ifFalse: [ ^self backQuotesEscapedEnclosed  ].
	
	2 to: self size do: [:idx| (self at: idx) isAlphaNumeric ifFalse: [^self backQuotesEscapedEnclosed]].
	^ self