instance creation-shortcuts
replace: original searcing: search with: replacement
	^self call: 'replace' expressions: { original. search. replacement}