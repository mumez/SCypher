defaults
defaultKeyword
	^self isUnique ifTrue: [^'CREATE UNIQUE' ] ifFalse: [ 'CREATE' ]