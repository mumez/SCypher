Class {
	#name : #CyCall,
	#superclass : #CyClause,
	#instVars : [
		'procInvocation',
		'yieldPhrase'
	],
	#category : 'SCypher-Core'
}

{ #category : #'built-in procedures' }
CyCall class >> dbConstraints [
	^self of: 'db.constraints'
]

{ #category : #'built-in procedures' }
CyCall class >> dbIndexes [
	^self of: 'db.indexes'
]

{ #category : #'built-in procedures' }
CyCall class >> dbLabels [
	^self of: 'db.labels'
]

{ #category : #'built-in procedures' }
CyCall class >> dbPropertyKeys [
	^self of: 'db.propertyKeys'
]

{ #category : #'built-in procedures' }
CyCall class >> dbRelationshipTypes [
	^self of: 'db.relationshipTypes'
]

{ #category : #'built-in procedures' }
CyCall class >> dbmsComponents [
	^self of: 'dbms.components'
]

{ #category : #'built-in procedures' }
CyCall class >> dbmsFunctions [
	^self of: 'dbms.functions'
]

{ #category : #'built-in procedures' }
CyCall class >> dbmsListConfig [
	^self of: 'dbms.listConfig'
]

{ #category : #'built-in procedures' }
CyCall class >> dbmsProcedures [
	^self of: 'dbms.procedures'
]

{ #category : #'instance creation' }
CyCall class >> implicitOf: procName [
	| inst |
	inst := self new.
	inst procInvocation: (CyProcInvocation implicit: procName).
	^inst 
]

{ #category : #'instance creation' }
CyCall class >> of: procName [
	^self of: procName arguments: #()
]

{ #category : #'instance creation' }
CyCall class >> of: procName arguments: arguments [
	| inst |
	inst := self new.
	inst procInvocation: (CyProcInvocation name: procName expressions: arguments).
	^inst
]

{ #category : #accessing }
CyCall >> procInvocation [
	^ procInvocation
]

{ #category : #accessing }
CyCall >> procInvocation: anObject [
	procInvocation := anObject
]

{ #category : #printing }
CyCall >> tokensOn: tokens [
	tokens add: self keyword.
	tokens spacedAdd: self procInvocation cypherString.
	
	self tokensYieldOn: tokens.
]

{ #category : #printing }
CyCall >> tokensYieldOn: tokens [
	self procInvocation ifNil: [ ^self ].
	self yieldPhrase ifNotNil: [:yield | 
		tokens add: yield cypherString  	
	]
]

{ #category : #actions }
CyCall >> yield: yieldPhraseOrString [
	| yield |
	yield := ((yieldPhraseOrString isKindOf: CyYield)
				ifTrue: [ yieldPhraseOrString ]
				ifFalse: [ CyYield of: yieldPhraseOrString ]).
	self yieldPhrase: yield.
			
]

{ #category : #accessing }
CyCall >> yieldPhrase [
	^ yieldPhrase
]

{ #category : #accessing }
CyCall >> yieldPhrase: anObject [
	yieldPhrase := anObject
]
