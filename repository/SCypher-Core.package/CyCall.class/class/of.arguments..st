instance creation
of: procName arguments: arguments
	| inst |
	inst := self new.
	inst procInvocation: (CyProcInvocation name: procName expressions: arguments).
	^inst