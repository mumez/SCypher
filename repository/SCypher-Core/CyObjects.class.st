Class {
	#name : #CyObjects,
	#superclass : #CyObject,
	#instVars : [
		'items'
	],
	#category : 'SCypher-Core'
}

{ #category : #'instance creation' }
CyObjects class >> with: anElement [
	^self withAll: { anElement }
]

{ #category : #'instance creation' }
CyObjects class >> withAll: aCollection [
	^self new items: aCollection; yourself
]

{ #category : #concatenating }
CyObjects >> , otherItem [
	^self class withAll: (self items copyWith: otherItem)
]

{ #category : #enumerating }
CyObjects >> do: aBlock separatedBy: separatorBlock [
	^self items do: aBlock separatedBy: separatorBlock
]

{ #category : #accessing }
CyObjects >> first [
	^self items first
]

{ #category : #testing }
CyObjects >> isCollection [
	^self items isCollection 
]

{ #category : #accessing }
CyObjects >> items [
	^ items ifNil: [ items := OrderedCollection new ]
]

{ #category : #accessing }
CyObjects >> items: anObject [
	items := anObject
]

{ #category : #accessing }
CyObjects >> last [
	^self items last
]

{ #category : #accessing }
CyObjects >> size [
	^self items size
]

{ #category : #printing }
CyObjects >> tokensOn: tokens [
	self items do: [ :each |
		tokens add: each cypherString 
	] separatedBy: [ tokens add: ', ' ]
]
