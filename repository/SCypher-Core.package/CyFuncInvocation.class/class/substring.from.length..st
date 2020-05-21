instance creation-shortcuts
substring: original from: begin length: subLength
	^self call: 'substring' expressions: { original. begin. subLength}