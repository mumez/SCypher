instance creation-shortcuts
isNull: expA
	^self type: #postfix operator: 'IS NULL' expressions: {expA}