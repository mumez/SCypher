instance creation-list
list: expA fromFirstTo: endExpression
	^self type: #postfix operator: (CyRangeExpression fromFirstTo: endExpression) expressions: {expA}