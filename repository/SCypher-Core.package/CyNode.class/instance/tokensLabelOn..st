printing
tokensLabelOn: tokens
	| lbls |
	lbls := self labels.
	lbls isEmptyOrNil ifTrue: [ ^self ].
	
	tokens add: ':'; addAll: (self join: ':' in: lbls) 