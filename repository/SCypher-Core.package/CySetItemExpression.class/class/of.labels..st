instance creation
of: identifier labels: values
	| inst |
	inst := self operator: #labels.
	inst identifier: identifier asCypherObject.
	inst labels: values.
	^inst