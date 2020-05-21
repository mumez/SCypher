instance creation-shortcuts
coalesce: propValue with: defaultValue
	^self call: 'coalesce' expressions: { propValue. defaultValue}