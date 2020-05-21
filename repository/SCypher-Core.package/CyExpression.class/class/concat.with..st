instance creation-shortcuts
concat: expA with: expB
	^self type: #infix operator: '+' expressions: {expA. expB}