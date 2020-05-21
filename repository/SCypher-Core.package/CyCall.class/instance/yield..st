actions
yield: yieldPhraseOrString
	| yield |
	yield := ((yieldPhraseOrString isKindOf: CyYield)
				ifTrue: [ yieldPhraseOrString ]
				ifFalse: [ CyYield of: yieldPhraseOrString ]).
	self yieldPhrase: yield.
			