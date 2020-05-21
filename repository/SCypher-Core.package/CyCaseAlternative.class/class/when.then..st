instance creation
when: whenExpression then: thenExpression
	^ self new
		when: whenExpression;
		then: thenExpression asCypherValue;
		yourself