*SCypher-Core-printing
cypherTokenString
	^(self isCyObject) ifTrue: [ self cypherString  ] ifFalse: [ self asString ].