instance creation
call: funcName expressions: exprArray
	^self new funcName: funcName; expressions: (CyObjects withAll: exprArray); yourself