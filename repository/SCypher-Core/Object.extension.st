Extension { #name : #Object }

{ #category : #'*SCypher-Core-converting' }
Object >> asCypherObject [
	^CyIdentifier of: self
]

{ #category : #'*SCypher-Core-converting' }
Object >> asCypherParameter [
	^CyParameter name: self asString
]

{ #category : #'*SCypher-Core-converting' }
Object >> asCypherValue [
	^CyValue of: self
]

{ #category : #'*SCypher-Core-printing' }
Object >> cypherString [
	^N4PortableUtil default jsonStringFrom: self
]

{ #category : #'*SCypher-Core-printing' }
Object >> cypherTokenString [
	^(self isCyObject) ifTrue: [ self cypherString  ] ifFalse: [ self asString ].
]

{ #category : #'*SCypher-Core-printing' }
Object >> cypherValueString [
	^self cypherString 
]

{ #category : #'*SCypher-Core-testing' }
Object >> isCyObject [
	^false
]
