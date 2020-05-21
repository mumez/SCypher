instance creation
of: target when: whenExpression then: thenExpression else: elseExpression
	^(self of: target)
		when: whenExpression then: thenExpression;
		else: elseExpression;
		yourself