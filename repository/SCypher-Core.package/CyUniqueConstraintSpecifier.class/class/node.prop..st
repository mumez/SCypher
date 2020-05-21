instance creation
node: node prop: prop
	| inst |
	inst := self new.
	inst node: node.
	inst prop: prop.
	^inst