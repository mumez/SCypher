Class {
	#name : #CyCypherGenerationTest,
	#superclass : #TestCase,
	#category : #'SCypher-Tests'
}

{ #category : #tests }
CyCypherGenerationTest >> testGenerateBasicQuery [
	| node query generated expected |
	node := CyNode name: 'n' label: 'Movie' props: {'released'->2000}.
	query := CyQuery statements: { 
	(CyMatch of: (node)).
	(CyReturn of: ((CyIdentifier of: node prop: 'title'), (CyIdentifier of: node prop: 'summary')))
		orderBy:(CyIdentifier of: node prop: 'released');
		skip: 2; limit: 10.
	 }.
	generated := query cypherString.
	
	expected := 'MATCH (n:Movie {released:2000})
RETURN n.title, n.summary ORDER BY n.released SKIP 2 LIMIT 10 '.
	
	self assert: generated equals: expected.
]

{ #category : #tests }
CyCypherGenerationTest >> testGenerateComplexPredicate [
	| node nameParam predicate generated expected |
	node := 'n' asCypherIdentifier.
	predicate := (((node @ 'name') = 'Peter') xor: ((node @ 'age') < 30 and: (node @ 'name') = 'Timothy')) or: ((node @ 'name') = 'Peter' or: (node @ 'name') = 'Timothy') not.
	generated := predicate cypherString.
	expected := '(((n.name = "Peter") XOR ((n.age < 30) AND (n.name = "Timothy"))) OR NOT (((n.name = "Peter") OR (n.name = "Timothy"))))'.
	
	self assert: generated equals: expected.
]

{ #category : #tests }
CyCypherGenerationTest >> testGenerateMatchWhereReturn [
	| node nameParam query generated expected |
	node := 'n' asCypherIdentifier.
	nameParam := 'name' asCypherParameter.
	query := CyQuery match: (CyNode name: node label: 'Movie')
		where: ((node @ 'title') = nameParam)
		return: node orderBy: (node @ 'title') skip: 'skip' asCypherParameter limit: 'limit' asCypherParameter.
	
	generated := query cypherString. 
	expected := 'MATCH (n:Movie)
WHERE (n.title = $name)
RETURN n ORDER BY n.title SKIP 0 LIMIT $limit '.
	
	self assert: generated equals: expected.
]

{ #category : #tests }
CyCypherGenerationTest >> testGeneratePredicate [
	| node nameParam predicate generated expected |
	node := 'n' asCypherIdentifier.
	nameParam := 'name' asCypherParameter.
	predicate := ((node @ 'title') <= nameParam).
	generated := predicate cypherString.
	expected := '(n.title <= $name)'.
	
	self assert: generated equals: expected.
]

{ #category : #tests }
CyCypherGenerationTest >> testGenerateRelationshipQuery [
	| movie person1 person2 movieNode person1Node person2Node relationshipA relationshipB pattern query generated expected |
	movie := 'm' asCypherObject.
	person1 := 'p' asCypherObject.
	person2 := 'p2' asCypherObject.
	movieNode := CyNode name: movie label: 'Movie' props: {'released'->2000}.
	person1Node := CyNode name: person1 label: 'Person' props: {}.
	person2Node := CyNode name: person2 label: 'Person' props: {}.
	relationshipA := (CyRelationship start: person1Node end: movieNode name: 'acted_in' type: 'ACTED_IN') beOut .
	relationshipB := (CyRelationship start: movieNode end: person2Node name: 'acted_in2' type: 'ACTED_IN') beIn .
	pattern := CyPatternElement withAll: { relationshipA. relationshipB }.
	query := CyQuery statements: { 
		CyMatch of: pattern.
		(CyReturn of: movie, person1, person2) orderBy: ((movie prop: 'name'), (person1 prop: 'name') desc, (person2 prop: 'name') desc); limit: 10
	}.

	generated := query cypherString.
	
	expected := 'MATCH (p:Person)-[acted_in:ACTED_IN]->(m:Movie {released:2000})<-[acted_in2:ACTED_IN]-(p2:Person)
RETURN m, p, p2 ORDER BY m.name, p.name DESC, p2.name DESC LIMIT 10 '.
	
	self assert: generated equals: expected.
]

{ #category : #tests }
CyCypherGenerationTest >> testGenerateWithQuery [
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
]
