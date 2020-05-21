instance creation
of: value as: alias 
	| inst | 
	inst := self of: value.
	inst items size =1 ifTrue: [ inst items first alias: alias ].
	^inst