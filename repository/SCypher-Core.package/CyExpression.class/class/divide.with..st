instance creation-shortcuts
divide: expA with: expB
	^self type: #infix operator: '/' expressions: {expA. expB}