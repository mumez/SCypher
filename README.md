# SCypher
An extensible, dynamic Cypher query builder. Usable with [Neo4reSt](https://github.com/mumez/Neo4reSt) and [SCypherGraph](https://github.com/mumez/SCypherGraph).

## Installation

```smalltalk
Metacello new
  baseline: 'SCypher';
  repository: 'github://mumez/SCypher/repository';
  load.
```

## Examples

#### 1: Basic MATCH query
```smalltalk
node := CyNode name: 'n' label: 'Movie' props: {'released'->2000}.
query := CyQuery statements: { 
	(CyMatch of: (node)).
	(CyReturn of: ((CyIdentifier of: node prop: 'title'), (CyIdentifier of: node prop: 'summary')))
		orderBy:(CyIdentifier of: node prop: 'released');
		skip: 2; limit: 10.
 }.
query cypherString. "print it"
```
=>
```cypher
MATCH (n:Movie {released:2000})
RETURN n.title, n.summary ORDER BY n.released SKIP 2 LIMIT 10 
```
#### 2 MATCH using WITH
```smalltalk
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
query cypherString.
```
=>
```cypher
MATCH (user)-[:FRIEND]-(friend)
WHERE (user.name = $name)
WITH user, count(friend) AS friends 
WHERE (friends > 10)
RETURN user 
```
#### 3: MATCH using RELATIONSHIPS
```smalltalk
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
query cypherString.
```
=>
```cypher
MATCH (p:Person)-[acted_in:ACTED_IN]->(m:Movie {released:2000})<-[acted_in2:ACTED_IN]-(p2:Person)
RETURN m, p, p2 ORDER BY m.name, p.name DESC, p2.name DESC LIMIT 10 
```
