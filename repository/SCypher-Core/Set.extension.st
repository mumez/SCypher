Extension { #name : #Set }

{ #category : #'*SCypher-Core' }
Set >> cypherString [
	^self asArray cypherString
]
