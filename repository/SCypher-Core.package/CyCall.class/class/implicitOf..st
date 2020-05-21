instance creation
implicitOf: procName
	| inst |
	inst := self new.
	inst procInvocation: (CyProcInvocation implicit: procName).
	^inst 