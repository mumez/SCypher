Class {
	#name : #CyCypherGenerationTest,
	#superclass : #TestCase,
	#category : #'SCypher-Tests'
}

{ #category : #tests }
CyCypherGenerationTest >> testFluentGenerateBasicQuery [
	| node query generated expected |
	node := CyNode name: 'n' label: 'Movie' props: {'released'->2000}.
	query := (CyQuery match: node) return: (node @ #title), (node @ #summary) in: [ :ret |
		ret orderBy: (node @ #released); skip: 2; limit: 10 
	].
	generated := query cypherString.
	
	expected := 'MATCH (n:Movie {released:2000})
RETURN n.title, n.summary ORDER BY n.released SKIP 2 LIMIT 10 '.
	
	self assert: generated equals: expected.
]

{ #category : #tests }
CyCypherGenerationTest >> testFluentGenerateRelationshipQuery [
	| movie person1 person2 movieNode person1Node person2Node path query generated expected |
	movie := 'm' asCypherIdentifier.
	person1 := 'p' asCypherIdentifier.
	person2 := 'p2' asCypherIdentifier.
	movieNode := CyNode name: movie label: 'Movie' props: {'released'->2000}.
	person1Node := CyNode name: person1 label: 'Person' props: {}.
	person2Node := CyNode name: person2 label: 'Person' props: {}.
	path := person1Node - ('acted_in' asCypherIdentifier rel: 'ACTED_IN') -> movieNode <- ('acted_in2' asCypherIdentifier rel: 'ACTED_IN') - person2Node.
	query := (CyQuery match: path) return: movie, person1, person2 in: [ :ret |
		ret orderBy: (movie @ #name), (person1 @ #name) desc, (person2 @ #name) desc; limit: 10 
	].

	generated := query cypherString.
	
	expected := 'MATCH (p:Person)-[`acted_in`:ACTED_IN]->(m:Movie {released:2000})<-[`acted_in2`:ACTED_IN]-(p2:Person)
RETURN m, p, p2 ORDER BY m.name, p.name DESC, p2.name DESC LIMIT 10 '.
	
	self assert: generated equals: expected.
]

{ #category : #tests }
CyCypherGenerationTest >> testFluentGenerateWithQuery [
	| user friend friends query generated expected |
	user := 'user' asCypherIdentifier.
	friend := 'friend' asCypherIdentifier.
	friends := 'friends' asCypherIdentifier.
	query := (CyQuery match: ((user asNode -- friend asNode) type: 'FRIEND')).
	query where: (user @ #name = 'name' asCypherParameter);
		with: (user, (friend count as: friends));
		where: (friends > 10);
		return: user.
	generated := query cypherString.
	
	expected := 'MATCH (user)-[:FRIEND]-(friend)
WHERE (user.name = $name)
WITH user, count(friend) AS friends 
WHERE (friends > 10)
RETURN user '.
	
	self assert: generated equals: expected.
]

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
	| node predicate generated expected |
	node := 'n' asCypherIdentifier.
	predicate := (((node @ 'name') = 'Peter') xor: ((node @ 'age') < 30 and: (node @ 'name') = 'Timothy')) or: ((node @ 'name') = 'Peter' or: (node @ 'name') = 'Timothy') not.
	generated := predicate cypherString.
	expected := '(((n.name = "Peter") XOR ((n.age < 30) AND (n.name = "Timothy"))) OR NOT (((n.name = "Peter") OR (n.name = "Timothy"))))'.
	
	self assert: generated equals: expected.
]

{ #category : #tests }
CyCypherGenerationTest >> testGenerateLongPathPatterns [
	| n1 n2 n3 r1 r2 pattern1 expected1 pattern2 expected2 pattern3 expected3 |
	n1 := ('a' asCypherIdentifier node: 'Label1' props: {'aa'->1.'bb'->'BB'}).
	n2 := ('b' asCypherIdentifier node: 'Label2' props: {'cc'->2}).
	n3 := ('c' asCypherIdentifier node: 'Label3' props: {}).
	r1 := ('r1' asCypherIdentifier rel: 'Type1' props: {'dd'->3.'ee'->'EE'}).
	r2 := ('r2' asCypherIdentifier rel: 'Type2' props: {'ff'->4}).
	
	pattern1 := n1 - r1 - n2 - r2 - n3.
	expected1 := '(a:Label1 {aa:1,bb:"BB"})-[r1:Type1 {dd:3,ee:"EE"}]-(b:Label2 {cc:2})-[r2:Type2 {ff:4}]-(c:Label3)'.
	self assert: pattern1 cypherString equals: expected1.
	
	pattern2 := n1 - r1 -> n2 <- r2 - n3.
	expected2 := '(a:Label1 {aa:1,bb:"BB"})-[r1:Type1 {dd:3,ee:"EE"}]->(b:Label2 {cc:2})<-[r2:Type2 {ff:4}]-(c:Label3)'.
	self assert: pattern2 cypherString equals: expected2.
	
	pattern3 := n1 <- r1 - n2 - r2 -> n3.
	expected3 := '(a:Label1 {aa:1,bb:"BB"})<-[r1:Type1 {dd:3,ee:"EE"}]-(b:Label2 {cc:2})-[r2:Type2 {ff:4}]->(c:Label3)'.
	self assert: pattern3 cypherString equals: expected3.
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
RETURN n ORDER BY n.title SKIP $skip LIMIT $limit '.
	
	self assert: generated equals: expected.
]

{ #category : #tests }
CyCypherGenerationTest >> testGenerateNodesOnlyPathPatterns [
	| n1 n2 pattern1 expected1 pattern2 expected2 pattern3 expected3 |
	n1 := ('a' asCypherIdentifier node: 'Label1' props: {'aa'->1.'bb'->'BB'}).
	n2 := ('b' asCypherIdentifier node: 'Label2' props: {'cc'->2.}).
	
	pattern1 := n1 -- n2.
	expected1 := '(a:Label1 {aa:1,bb:"BB"})--(b:Label2 {cc:2})'.
	self assert: pattern1 cypherString equals: expected1.
	
	pattern2 := n1 --> n2.
	expected2 := '(a:Label1 {aa:1,bb:"BB"})-->(b:Label2 {cc:2})'.
	self assert: pattern2 cypherString equals: expected2.
	
	pattern3 := n1 <-- n2.
	expected3 := '(a:Label1 {aa:1,bb:"BB"})<--(b:Label2 {cc:2})'.
	self assert: pattern3 cypherString equals: expected3.
]

{ #category : #tests }
CyCypherGenerationTest >> testGeneratePathPatterns [
	| n1 n2 r1 pattern1 expected1 pattern2 expected2 pattern3 expected3 |
	n1 := ('a' asCypherIdentifier node: 'Label1' props: {'aa'->1.'bb'->'BB'}).
	n2 := ('b' asCypherIdentifier node: 'Label2' props: {'cc'->2.}).
	r1 := ('r' asCypherIdentifier rel: 'Type1' props: {'dd'->3.'ee'->'EE'}).
	
	pattern1 := n1 - r1 - n2.
	expected1 := '(a:Label1 {aa:1,bb:"BB"})-[r:Type1 {dd:3,ee:"EE"}]-(b:Label2 {cc:2})'.
	self assert: pattern1 cypherString equals: expected1.
	
	pattern2 := n1 - r1 -> n2.
	expected2 := '(a:Label1 {aa:1,bb:"BB"})-[r:Type1 {dd:3,ee:"EE"}]->(b:Label2 {cc:2})'.
	self assert: pattern2 cypherString equals: expected2.
	
	pattern3 := n1 <- r1 - n2.
	expected3 := '(a:Label1 {aa:1,bb:"BB"})<-[r:Type1 {dd:3,ee:"EE"}]-(b:Label2 {cc:2})'.
	self assert: pattern3 cypherString equals: expected3.
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
	movie := 'm' asCypherIdentifier.
	person1 := 'p' asCypherIdentifier.
	person2 := 'p2' asCypherIdentifier.
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
	
	expected := 'MATCH (p:Person)-[`acted_in`:ACTED_IN]->(m:Movie {released:2000})<-[`acted_in2`:ACTED_IN]-(p2:Person)
RETURN m, p, p2 ORDER BY m.name, p.name DESC, p2.name DESC LIMIT 10 '.
	
	self assert: generated equals: expected.
]

{ #category : #tests }
CyCypherGenerationTest >> testGenerateVariablePatterns [
	| n1 n2 r1 r2 r3 pattern1 expected1 pattern2 expected2 pattern3 expected3 |
	n1 := ('a' asCypherIdentifier node: 'Label1' props: {'aa'->1.'bb'->'BB'}).
	n2 := ('b' asCypherIdentifier node: 'Label2' props: {'cc'->2.}).
	r1 := ('r' asCypherIdentifier asRelationship rangeFrom: 1 to: 5).
	r2 := ('r' asCypherIdentifier asRelationship rangeFrom: 1).
	r3 := ('r' asCypherIdentifier asRelationship rangeTo: 5).
	
	pattern1 := n1 - r1 - n2.
	expected1 := '(a:Label1 {aa:1,bb:"BB"})-[r*1..5]-(b:Label2 {cc:2})'.
	self assert: pattern1 cypherString equals: expected1.
	
	pattern2 := n1 - r2 -> n2.
	expected2 := '(a:Label1 {aa:1,bb:"BB"})-[r*1..]->(b:Label2 {cc:2})'.
	self assert: pattern2 cypherString equals: expected2.
	
	pattern3 := n1 <- r3 - n2.
	expected3 := '(a:Label1 {aa:1,bb:"BB"})<-[r*..5]-(b:Label2 {cc:2})'.
	self assert: pattern3 cypherString equals: expected3.
]

{ #category : #tests }
CyCypherGenerationTest >> testGenerateWithQuery [
	| user friend friends query generated expected |
	user := 'user' asCypherIdentifier.
	friend := 'friend' asCypherIdentifier.
	friends := 'friends' asCypherIdentifier.
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
