Extension { #name : #String }

{ #category : #'*SCypher-Core-converting' }
String >> asCypherObject [
	^CyIdentifier of: self
]

{ #category : #'*SCypher-Core-printing' }
String >> backQuotesEscapedEnclosed [
	^String streamContents: [:str |
		str nextPut: $`.
		str nextPutAll: (self copyReplaceAll: '`' with: '``').
		str nextPut: $`.
	]
]

{ #category : #'*SCypher-Core-printing' }
String >> cypherIdentifierString [
	| firstChar |
	self ifEmpty: [ ^self ].
	firstChar := self first.
	(firstChar isLetter or: [ firstChar = $_ ]) ifFalse: [ ^self backQuotesEscapedEnclosed  ].
	
	2 to: self size do: [:idx| (self at: idx) isAlphaNumeric ifFalse: [^self backQuotesEscapedEnclosed]].
	^ self
]

{ #category : #'*SCypher-Core-printing' }
String >> cypherLabelString [
	^ self
]

{ #category : #'*SCypher-Core-printing' }
String >> cypherString [
	self = '*' ifTrue: [ ^self ].
	^self cypherIdentifierString 
]

{ #category : #'*SCypher-Core-printing' }
String >> cypherValueString [
	^self asJsonString 
]

{ #category : #'*SCypher-Core-printing' }
String >> doubleQuotesEscapedEnclosed [
	^String streamContents: [:str |
		str nextPut: $".
		str nextPutAll: (self copyReplaceAll: '`' with: '``').
		str nextPut: $".
	]
]
