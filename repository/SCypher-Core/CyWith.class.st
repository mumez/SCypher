Class {
	#name : #CyWith,
	#superclass : #CyReturn,
	#instVars : [
		'where'
	],
	#category : 'SCypher-Core'
}

{ #category : #accessing }
CyWith >> where [
	^ where
]

{ #category : #accessing }
CyWith >> where: anObject [
	where := anObject
]
