printing
tokensOn: tokens
	tokens add: 'WHEN'.
	tokens spacedAdd: self when cypherString.
	
	tokens add: 'THEN'.
	tokens space; add: self then cypherString.