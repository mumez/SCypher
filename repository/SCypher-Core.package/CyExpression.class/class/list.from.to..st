instance creation-list
list: expA from: fromExpression to: toExpression
	^self type: #postfix operator: (CyRangeExpression from: fromExpression to: toExpression) expressions: {expA}