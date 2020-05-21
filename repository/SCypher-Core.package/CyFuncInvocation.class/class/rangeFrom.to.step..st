instance creation-shortcuts
rangeFrom: from to: to step: step
	^self call: 'range' expressions: { from. to. step}