instance creation-list
list: expA toLastFrom: startExpression
	^self type: #postfix operator: (CyRangeExpression toLastFrom: startExpression) expressions: {expA}