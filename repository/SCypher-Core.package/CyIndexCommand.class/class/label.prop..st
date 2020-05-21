instance creation
label: label prop: prop
	| indexSpecifier |
	indexSpecifier := CyIndexSpecifier label: label prop: prop.
	^ self of: indexSpecifier