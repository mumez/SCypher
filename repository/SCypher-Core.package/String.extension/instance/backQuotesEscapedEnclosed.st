*SCypher-Core-printing
backQuotesEscapedEnclosed
	^String streamContents: [:str |
		str nextPut: $`.
		str nextPutAll: (self copyReplaceAll: '`' with: '``').
		str nextPut: $`.
	]