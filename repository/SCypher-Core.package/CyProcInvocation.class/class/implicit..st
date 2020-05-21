instance creation
implicit: procName
	| inst |
	inst := self name: procName expressions: nil.
	inst isImplicit: true.
	^inst