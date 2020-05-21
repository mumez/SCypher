instance creation-list
list: expA at: atExpression
	^self type: #postfix operator: (CyIndexExpression of: atExpression) expressions: {expA}