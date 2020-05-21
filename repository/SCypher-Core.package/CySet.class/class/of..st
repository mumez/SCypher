instance creation
of: setExpressions
	| exps |
	exps := setExpressions isCollection ifTrue: [ setExpressions ] ifFalse: [ CyObjects with: setExpressions ].
	^self itemSetters: exps 