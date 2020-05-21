instance creation
variable: iterationVariable in: collectionExpression do: updatingClause
	| inst |
	inst := self new.
	inst variable: iterationVariable.
	inst inExpression: collectionExpression.
	updatingClause isArray
		ifTrue: [ inst updatingClauses: updatingClause ]
		ifFalse: [ inst updatingClauses: {updatingClause} ].
	^ inst