*SCypher-Core-printing
doubleQuotesEscapedEnclosed
	^String streamContents: [:str |
		str nextPut: $".
		str nextPutAll: (self copyReplaceAll: '`' with: '``').
		str nextPut: $".
	]