Extension { #name : #SequenceableCollection }

{ #category : #'*SCypher-Core-converting' }
SequenceableCollection >> asCypherObject [
	^CyLiteral of: self asArray
]
