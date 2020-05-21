instance creation-shortcuts
xor: expA with: expB
	^self type: #infix operator: 'XOR' expressions: {expA. expB}