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
		 r orderBy: orderBy; skip: 0; limit: limit
	]
]

{ #category : #shortcuts }
CyQuery class >> match: match where: where return: return skip: skip limit: limit [
	^self match: match where: where return: return in: [:r |
		 r skip: skip; limit: limit
	]
]

{ #category : #'instance creation' }
CyQuery class >> statements: statements [
	^self new statements: statements; yourself
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
CyQuery >> addStatement: cypherStatement [
	^ self statements add: cypherStatement
]

{ #category : #adding }
CyQuery >> addWhere: whereClause [
	whereClause ifNil: [ ^ nil ].
	^ self addStatement: (self whereClass of: whereClause)
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

{ #category : #printing }
CyQuery >> printString [
	^self cypherString 
]

{ #category : #factory }
CyQuery >> returnClass [
	^ CyReturn 
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
