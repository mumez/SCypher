defaults
defaultKeyword
	| clsName |
	clsName := self className.
	^(clsName copyFrom: 3 to: clsName size) asUppercase.