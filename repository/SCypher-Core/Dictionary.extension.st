Extension { #name : #Dictionary }

{ #category : #'*SCypher-Core-printing' }
Dictionary >> cypherString [
	^ String
		streamContents: [ :str | 
			| needComma |
			needComma := false.
			str nextPut: ${.
			self
				associationsDo: [ :assoc | 
					needComma
						ifTrue: [ str nextPut: $, ]
						ifFalse: [ needComma := true ].
					str nextPutAll: assoc key cypherIdentifierString.
					str nextPut: $:.
					str nextPutAll: assoc value cypherValueString].
			str nextPut: $} ]
]
