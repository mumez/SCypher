instance creation-shortcuts
isNotNull: expA
	^self type: #postfix operator: 'IS NOT NULL' expressions: {expA}