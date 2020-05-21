instance creation-list
each: expA in: expB
	^(self type: #infix operator: 'IN' expressions: {expA. expB}) bePlain