Class {
	#name : #CyQuery,
	#superclass : #CyObject,
	#instVars : [
		'statements',
		'delimiter'
	],
	#category : 'SCypher-Core'
}

{ #category : #'instance creation' }
CyQuery class >> statements: statements [
	^self new statements: statements; yourself
]

{ #category : #accessing }
CyQuery >> delimiter [
	^ delimiter ifNil: [ delimiter := String cr ]
]

{ #category : #accessing }
CyQuery >> delimiter: anObject [
	delimiter := anObject
]

{ #category : #printing }
CyQuery >> printString [
	^self cypherString 
]

{ #category : #accessing }
CyQuery >> statements [
	^ statements
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
