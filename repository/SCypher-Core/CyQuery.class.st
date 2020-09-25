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
CyQuery class >> match: match where: where return: return [
	^self match: match where: where return: return skip: 0 limit: 100
]

{ #category : #shortcuts }
CyQuery class >> match: match where: where return: return skip: skip limit: limit [
	| query |
	query := self new.
	query addMatch: match;
		addWhere: where;
		addReturn: return skip: skip limit: limit.
	^ query
]

{ #category : #'instance creation' }
CyQuery class >> statements: statements [
	^self new statements: statements; yourself
]

{ #category : #adding }
CyQuery >> addMatch: matchClause [
	self addStatement: (self matchClass of: matchClause)
]

{ #category : #adding }
CyQuery >> addReturn: returnClause [
	self addStatement: (self returnClass of: returnClause)
]

{ #category : #adding }
CyQuery >> addReturn: returnClause skip: skip limit: limit [
	| return |
	return := (self returnClass of: returnClause) skip: skip; limit: limit.
	self addStatement: return
]

{ #category : #adding }
CyQuery >> addStatement: cyperStatement [
	self statements add: cyperStatement
]

{ #category : #adding }
CyQuery >> addWhere: whereClause [
	self addStatement: (self whereClass of: whereClause)
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
