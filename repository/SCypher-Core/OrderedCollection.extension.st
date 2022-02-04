Extension { #name : #OrderedCollection }

{ #category : #'*SCypher-Core' }
OrderedCollection >> cypherString [
	^self asArray cypherString
]
