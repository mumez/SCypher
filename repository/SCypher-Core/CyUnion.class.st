Class {
	#name : #CyUnion,
	#superclass : #CyObjects,
	#instVars : [
		'isAll'
	],
	#category : 'SCypher-Core'
}

{ #category : #actions }
CyUnion >> all [
	^self isAll: true
]

{ #category : #accessing }
CyUnion >> commandName [
	^self isAll ifTrue: [ 'UNION ALL' ] ifFalse: [ 'UNION' ]
]

{ #category : #accessing }
CyUnion >> isAll [
	^ isAll ifNil: [ isAll := false ]
]

{ #category : #accessing }
CyUnion >> isAll: anObject [
	isAll := anObject
]

{ #category : #printing }
CyUnion >> tokensOn: tokens [
	self items do: [ :each |
		tokens add: each cypherString 
	] separatedBy: [ tokens cr; add: self commandName; cr]
]
