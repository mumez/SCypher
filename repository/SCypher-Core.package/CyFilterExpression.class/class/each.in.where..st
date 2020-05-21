instance creation
each: eachExp in: inExp where: whereExpression
	| inst |
	inst := self of: (CyExpression each: eachExp in: inExp).
	inst where: whereExpression.
	^ inst