instance creation
of: identifier to: value
	| inst |
	inst := self operator: '='.
	inst identifier: identifier asCypherObject.
	inst value: value asCypherValue.
	^inst