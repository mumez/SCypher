accessing
commandName
	^self isAll ifTrue: [ 'UNION ALL' ] ifFalse: [ 'UNION' ]