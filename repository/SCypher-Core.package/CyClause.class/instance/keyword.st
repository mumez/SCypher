accessing
keyword
	^ keyword ifNil: [ keyword := self defaultKeyword ]