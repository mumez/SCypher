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

### 1: Basic MATCH query

```smalltalk
node := CyNode name: 'n' label: 'Movie' props: {'released'->2000}.
query := (CyQuery match: node) return: (node @ #title), (node @ #summary) in: [ :ret |
  ret orderBy: (node @ #released); skip: 2; limit: 10 
].
query cypherString. "print it"
```

=>

```cypher
MATCH (n:Movie {released:2000})
RETURN n.title, n.summary ORDER BY n.released SKIP 2 LIMIT 10 
```

### 2 MATCH using WITH

```smalltalk
user := 'user' asCypherIdentifier.
friend := 'friend' asCypherIdentifier.
friends := 'friends' asCypherIdentifier.
query := (CyQuery match: ((user asNode -- friend asNode) type: 'FRIEND')).
query where: (user @ #name = 'name' asCypherParameter);
 with: (user, (friend count as: friends));
 where: (friends > 10);
 return: user.
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

### 3: MATCH using RELATIONSHIPS

```smalltalk
movie := 'm' asCypherIdentifier.
person1 := 'p' asCypherIdentifier.
person2 := 'p2' asCypherIdentifier.
movieNode := CyNode name: movie label: 'Movie' props: {'released'->2000}.
person1Node := CyNode name: person1 label: 'Person'.
person2Node := CyNode name: person2 label: 'Person'.
path := person1Node - ('acted_in' asCypherIdentifier rel: 'ACTED_IN') -> movieNode <- ('acted_in2' asCypherIdentifier rel: 'ACTED_IN') - person2Node.
query := (CyQuery match: path) return: movie, person1, person2 in: [ :ret |
 ret orderBy: (movie @ #name), (person1 @ #name) desc, (person2 @ #name) desc; limit: 10 
].
query cypherString.
```

=>

```cypher
MATCH (p:Person)-[`acted_in`:ACTED_IN]->(m:Movie
{released:2000})<-[`acted_in2`:ACTED_IN]-(p2:Person)
RETURN m, p, p2 ORDER BY m.name, p.name DESC, p2.name DESC LIMIT 10 
```
