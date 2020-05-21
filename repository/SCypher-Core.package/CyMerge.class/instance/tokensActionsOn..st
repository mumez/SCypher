printing
tokensActionsOn: tokens

	self actions do: [ :each | 
		tokens spacedAdd: each cypherString.	
	]