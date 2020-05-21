tests
testGenerateWithQuery
	| user friend friends query generated expected |
	user := 'user' asCypherObject.
	friend := 'friend' asCypherObject.
	friends := 'friends' asCypherObject.
	query := CyQuery statements: { 
		CyMatch of: (CyRelationship start: user end: friend type: 'FRIEND').
		CyWhere of: (CyExpression eq: (user prop: 'name') with: 'name' asCypherParameter).
		CyWith of: (user, ((CyFuncInvocation count: friend) as: friends)).
		CyWhere of: (CyExpression gt: friends with: 10).
		CyReturn of: user.
	}.
	generated := query cypherString.
	
	expected := 'MATCH (user)-[:FRIEND]-(friend)
WHERE (user.name = $name)
WITH user, count(friend) AS friends 
WHERE (friends > 10)
RETURN user '.
	
	self assert: generated equals: expected.