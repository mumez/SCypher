instance creation
target: nodeOrRelationshipPattern prop: prop
	| inst |
	inst := self new.
	inst target: nodeOrRelationshipPattern.
	inst prop: prop.
	^inst