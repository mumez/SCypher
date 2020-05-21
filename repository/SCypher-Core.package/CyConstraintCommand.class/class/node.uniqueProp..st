instance creation
node: node uniqueProp: prop
	| uniqueSpecifier |
	uniqueSpecifier := CyUniqueConstraintSpecifier node: node prop: prop.
	^ self of: uniqueSpecifier