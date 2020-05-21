printing
tokensAssertionOn: tokens
	tokens spacedAdd: 'ASSERT'.
	tokens add: (CyFuncInvocation exists: (self target accessor: self prop)) cypherString.