instance creation
name: procName expressions: exprArray
	^self new procName: procName; expressions: (CyObjects withAll: exprArray); yourself