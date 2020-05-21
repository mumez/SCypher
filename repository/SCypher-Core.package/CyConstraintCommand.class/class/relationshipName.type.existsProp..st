instance creation
relationshipName: relationshipName type: relationshipType existsProp: prop
	| existenceSpecifier |
	existenceSpecifier := CyExistenceConstraintSpecifier relationshipName: relationshipName type: relationshipType prop: prop.
	^ self of: existenceSpecifier