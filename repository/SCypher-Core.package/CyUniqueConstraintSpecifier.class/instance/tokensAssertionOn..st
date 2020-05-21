printing
tokensAssertionOn: tokens
	tokens spacedAdd: 'ASSERT'.
	tokens add: (self node accessor: self prop) cypherString.
	tokens spacedAdd: 'IS UNIQUE'.
	