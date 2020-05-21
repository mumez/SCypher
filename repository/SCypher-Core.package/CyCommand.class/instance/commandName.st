accessing
commandName
	^commandName ifNil: [ commandName := self defaultCommandName ]