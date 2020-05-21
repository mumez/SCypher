instance creation
of: identifier add: value
	| inst |
	inst := self operator: '+='.
	inst identifier: identifier asCypherObject.
	inst value: value asCypherValue.
	^inst