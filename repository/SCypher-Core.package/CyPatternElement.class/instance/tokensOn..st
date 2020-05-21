printing
tokensOn: tokens
	| rels |
	rels := self relationships.
	rels isEmptyOrNil ifTrue: [ ^self ].
	rels size = 1 ifTrue: [ rels first tokensOn: tokens ].
	rels allButLastDo: [ :each |
		each tokensWithoutEndNodeOn: tokens
	].
	rels last tokensOn: tokens 