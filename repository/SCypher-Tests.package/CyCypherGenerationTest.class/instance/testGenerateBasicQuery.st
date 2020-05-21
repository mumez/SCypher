tests
testGenerateBasicQuery
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