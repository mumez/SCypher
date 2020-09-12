Class {
	#name : #CyCaseAlternative,
	#superclass : #CyObject,
	#instVars : [
		'when',
		'then'
	],
	#category : 'SCypher-Core'
}

{ #category : #'instance creation' }
CyCaseAlternative class >> when: whenExpression then: thenExpression [
	^ self new
		when: whenExpression;
		then: thenExpression asCypherValue;
		yourself
]

{ #category : #accessing }
CyCaseAlternative >> then [
	^ then
]

{ #category : #accessing }
CyCaseAlternative >> then: anObject [
	then := anObject
]

{ #category : #printing }
CyCaseAlternative >> tokensOn: tokens [
	tokens add: 'WHEN'.
	tokens spacedAdd: self when cypherString.
	
	tokens add: 'THEN'.
	tokens space; add: self then cypherString.
]

{ #category : #accessing }
CyCaseAlternative >> when [
	^ when
]

{ #category : #accessing }
CyCaseAlternative >> when: anObject [
	when := anObject
]
