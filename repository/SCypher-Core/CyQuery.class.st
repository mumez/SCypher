Class {
	#name : #CyQuery,
	#superclass : #CyObject,
	#instVars : [
		'statements',
		'delimiter'
	],
	#category : #'SCypher-Core'
}

{ #category : #shortcuts }
CyQuery class >> match: match [
	| query |
	query := self new.
	query addMatch: match.
	^ query
]

{ #category : #shortcuts }
CyQuery class >> match: match where: where [
	| query |
	query := self new.
	query addMatch: match;
		addWhere: where.
	^ query
]

{ #category : #shortcuts }
CyQuery class >> match: match where: where delete: delete [
	^self match: match where: where delete: delete in: nil
]

{ #category : #shortcuts }
CyQuery class >> match: match where: where delete: delete in: deleteBlock [
	| query |
	query := self match: match where: where.
	query addDelete: delete in: deleteBlock.
	^ query
]

{ #category : #shortcuts }
CyQuery class >> match: match where: where remove: remove [
	^self match: match where: where remove: remove in: nil
]

{ #category : #shortcuts }
CyQuery class >> match: match where: where remove: remove in: removeBlock [
	| query |
	query := self match: match where: where.
	query addRemove: remove in: removeBlock.
	^ query
]

{ #category : #shortcuts }
CyQuery class >> match: match where: where return: return [
	^self match: match where: where return: return in: nil
]

{ #category : #shortcuts }
CyQuery class >> match: match where: where return: return in: returnBlock [
	| query |
	query := self match: match where: where.
	query addReturn: return in: returnBlock.
	^ query
]

{ #category : #shortcuts }
CyQuery class >> match: match where: where return: return limit: limit [
	^self match: match where: where return: return in: [:r |
		 r limit: limit
	]
]

{ #category : #shortcuts }
CyQuery class >> match: match where: where return: return orderBy: orderBy skip: skip limit: limit [
	^self match: match where: where return: return in: [:r |
		orderBy ifNotNil: [r orderBy: orderBy].
		skip ifNotNil: [ r skip: skip ].
		limit ifNotNil: [ r limit: limit ].
	]
]

{ #category : #shortcuts }
CyQuery class >> match: match where: where return: return skip: skip limit: limit [
	^self match: match where: where return: return in: [:r |
		skip ifNotNil: [ r skip: skip ].
		limit ifNotNil: [ r limit: limit ].
	]
]

{ #category : #shortcuts }
CyQuery class >> match: match where: where set: set [
	^self match: match where: where set: set in: nil
]

{ #category : #shortcuts }
CyQuery class >> match: match where: where set: set in: setBlock [
	| query |
	query := self match: match where: where.
	query addSet: set in: setBlock.
	^ query
]

{ #category : #shortcuts }
CyQuery class >> matchPathWithNodeAt: nodeAId nodeAt: nodeBId createIn: aBlock [ 
	| a b r p nodeA nodeB where query pattern |
	a := 'a' asCypherIdentifier.
	b := 'b' asCypherIdentifier.
	r := 'r' asCypherIdentifier.
	p := 'p' asCypherIdentifier.
	nodeA := a asNode.
	nodeB := b asNode.
	where := (a getId = nodeAId) & (b getId = nodeBId).
	query := self match: (nodeA, nodeB) where: where.
	pattern := p path: (aBlock value: nodeA value: nodeB value: r).
	query addCreate: pattern.
	query addReturn: p.
	^ query
]

{ #category : #shortcuts }
CyQuery class >> matchPathWithNodeAt: nodeAId nodeAt: nodeBId mergeIn: aBlock [ 
	| a b r p nodeA nodeB where query pattern |
	a := 'a' asCypherIdentifier.
	b := 'b' asCypherIdentifier.
	r := 'r' asCypherIdentifier.
	p := 'p' asCypherIdentifier.
	nodeA := a asNode.
	nodeB := b asNode.
	where := (a getId = nodeAId) & (b getId = nodeBId).
	query := self match: (nodeA, nodeB) where: where.
	pattern := p path: (aBlock value: nodeA value: nodeB value: r).
	query addMerge: pattern.
	query addReturn: p.
	^ query
]

{ #category : #shortcuts }
CyQuery class >> matchPathWithRelationshipsOfTypes: typeOrTypes havingAll: relPropsArray fromNodeAt: startNodeId endNodeIn: endNodeBlock pathIn: pathCreationBlock whereIn: whereClauseBuilder [
	^ self matchPathWithRelationshipsOfTypes: typeOrTypes havingAll: relPropsArray fromNodeAt: startNodeId endNodeIn: endNodeBlock pathIn: pathCreationBlock whereIn: whereClauseBuilder returnIn: nil
]

{ #category : #shortcuts }
CyQuery class >> matchPathWithRelationshipsOfTypes: typeOrTypes havingAll: relPropsArray fromNodeAt: startNodeId endNodeIn: endNodeBlock pathIn: pathCreationBlock whereIn: whereClauseBuilder pathProcessIn: pathProcessBlock returnIn: returnBlock [
	| s e r p rel endNode path where andWhere |
	s := 's' asCypherIdentifier.
	e := 'e' asCypherIdentifier.
	r := 'r' asCypherIdentifier.
	p := 'p' asCypherIdentifier.
	rel := r rel: typeOrTypes props: relPropsArray.
	endNode := endNodeBlock value: e.
	path := p path: (pathCreationBlock value: s asNode value: rel value: endNode).
	where := (s getId equals: startNodeId).
	andWhere := (whereClauseBuilder value: s value: r value: e).
	andWhere ifNotNil: [ where := where and: andWhere ].
	pathProcessBlock ifNotNil: [ p := pathProcessBlock value: p ].
	^ self match: path where: where return: p in: returnBlock.
]

{ #category : #shortcuts }
CyQuery class >> matchPathWithRelationshipsOfTypes: typeOrTypes havingAll: relPropsArray fromNodeAt: startNodeId endNodeIn: endNodeBlock pathIn: pathCreationBlock whereIn: whereClauseBuilder returnIn: returnBlock [
	^ self matchPathWithRelationshipsOfTypes: typeOrTypes havingAll: relPropsArray fromNodeAt: startNodeId endNodeIn: endNodeBlock pathIn: pathCreationBlock whereIn: whereClauseBuilder pathProcessIn: nil returnIn: returnBlock
]

{ #category : #'instance creation' }
CyQuery class >> statements: statements [
	^self new statements: statements; yourself
]

{ #category : #adding }
CyQuery >> addCreate: createClause [
	^ self addCreate: createClause in: nil
]

{ #category : #adding }
CyQuery >> addCreate: createClause in: aBlock [
	| create |
	create := self createClass of: createClause.
	aBlock ifNotNil: [ aBlock value: create ].
	^ self addStatement: create
]

{ #category : #adding }
CyQuery >> addDelete: deleteClause [
	^ self addDelete: deleteClause in: nil
]

{ #category : #adding }
CyQuery >> addDelete: deleteClause in: aBlock [
	| delete |
	delete := self deleteClass of: deleteClause.
	aBlock ifNotNil: [ aBlock value: delete ].
	^ self addStatement: delete
]

{ #category : #adding }
CyQuery >> addMatch: matchClause [
	^ self addStatement: (self matchClass of: matchClause)
]

{ #category : #adding }
CyQuery >> addMerge: mergeClause [
	^ self addMerge: mergeClause in: nil
]

{ #category : #adding }
CyQuery >> addMerge: mergeClause in: aBlock [
	| merge |
	merge := self mergeClass of: mergeClause.
	aBlock ifNotNil: [ aBlock value: merge ].
	^ self addStatement: merge
]

{ #category : #adding }
CyQuery >> addRemove: removeClause [
	^ self addRemove: removeClause in: nil
]

{ #category : #adding }
CyQuery >> addRemove: removeClause in: aBlock [
	| remove |
	remove := self removeClass of: removeClause.
	aBlock ifNotNil: [ aBlock value: remove ].
	^ self addStatement: remove
]

{ #category : #adding }
CyQuery >> addReturn: returnClause [
	^ self addReturn: returnClause in: nil
]

{ #category : #adding }
CyQuery >> addReturn: returnClause in: aBlock [
	| return |
	return := self returnClass of: returnClause.
	aBlock ifNotNil: [ aBlock value: return ].
	^ self addStatement: return
]

{ #category : #adding }
CyQuery >> addSet: returnClause [
	^ self addSet: returnClause in: nil
]

{ #category : #adding }
CyQuery >> addSet: setClause in: aBlock [
	| set |
	set := self setClass of: setClause.
	aBlock ifNotNil: [ aBlock value: set ].
	^ self addStatement: set
]

{ #category : #adding }
CyQuery >> addStatement: cypherStatement [
	^ self statements add: cypherStatement
]

{ #category : #adding }
CyQuery >> addWhere: whereClause [
	whereClause ifNil: [ ^ nil ].
	^ self addStatement: (self whereClass of: whereClause)
]

{ #category : #factory }
CyQuery >> createClass [
	^ CyCreate
]

{ #category : #factory }
CyQuery >> deleteClass [
	^ CyDelete
]

{ #category : #accessing }
CyQuery >> delimiter [
	^ delimiter ifNil: [ delimiter := String cr ]
]

{ #category : #accessing }
CyQuery >> delimiter: anObject [
	delimiter := anObject
]

{ #category : #factory }
CyQuery >> matchClass [
	^ CyMatch 
]

{ #category : #factory }
CyQuery >> mergeClass [
	^ CyMerge
]

{ #category : #printing }
CyQuery >> printString [
	^self cypherString 
]

{ #category : #factory }
CyQuery >> removeClass [
	^ CyRemove
]

{ #category : #factory }
CyQuery >> returnClass [
	^ CyReturn 
]

{ #category : #factory }
CyQuery >> setClass [
	^ CySet
]

{ #category : #accessing }
CyQuery >> statements [
	^ statements ifNil: [ statements := OrderedCollection new ]
]

{ #category : #accessing }
CyQuery >> statements: anObject [
	statements := anObject
]

{ #category : #printing }
CyQuery >> tokensOn: tokens [
	self statements
		do: [ :each | tokens addAll: each tokenArray ]
		separatedBy: [ tokens add: self delimiter ]
]

{ #category : #union }
CyQuery >> union: otherCyObject [
	^CyUnion withAll: {self. otherCyObject}
]

{ #category : #union }
CyQuery >> unionAll: otherCyQuery [
	^(self union: otherCyQuery) all
]

{ #category : #factory }
CyQuery >> whereClass [
	^ CyWhere 
]
