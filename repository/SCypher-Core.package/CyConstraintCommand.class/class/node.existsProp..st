instance creation
node: node existsProp: prop
	| existenceSpecifier |
	existenceSpecifier := CyExistenceConstraintSpecifier target: node prop: prop.
	^ self of: existenceSpecifier