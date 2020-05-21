printing
tokensLabelOn: tokens
	self label ifNotNil: [ tokens add: ':', self label cypherLabelString ].
	