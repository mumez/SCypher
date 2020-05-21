printing
tokensUpdatingClausesOn: tokens
	tokens addAll: (self join: ' ' in: self updatingClauses by: #cypherString)